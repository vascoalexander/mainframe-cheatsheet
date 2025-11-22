/* REXX - Library Member mit Whitelist/Blacklist filtern */

/* Beispiel-Konfiguration */
library = "'YOUR.PDS.LIBRARY'"
whitelist_dsn = "'YOUR.CONFIG.PDS(WHITLIST)'"  /* PDS-Member */
blacklist_dsn = "'YOUR.CONFIG.PDS(BLACKLST)'"  /* PDS-Member */

/* Whitelist und Blacklist aus PDS-Membern einlesen */
Call ReadFilterLists

/* Member der Library auslesen und filtern */
Call GetFilteredMembers

/* Ergebnis anzeigen */
Say "Gefilterte Member-Liste:"
Say "========================"
Do i = 1 to filtered.0
  Say filtered.i
End
Say " "
Say "Anzahl Member: " filtered.0

Exit

/*------------------------------------------------------------------*/
/* Whitelist und Blacklist aus PDS-Membern einlesen                 */
/*------------------------------------------------------------------*/
ReadFilterLists:
  /* Whitelist einlesen */
  Call ReadPDSMember whitelist_dsn, 'wlist.'

  /* Prüfen ob Whitelist leer ist */
  If wlist.0 = 0 Then Do
    use_whitelist = 0
    Say "Whitelist ist leer - alle Member werden verwendet"
  End
  Else Do
    use_whitelist = 1
    Say "Whitelist geladen: " wlist.0 "Einträge"
  End

  /* Blacklist einlesen */
  Call ReadPDSMember blacklist_dsn, 'blist.'
  Say "Blacklist geladen: " blist.0 "Einträge"

Return

/*------------------------------------------------------------------*/
/* PDS-Member einlesen und in Stem speichern                        */
/*------------------------------------------------------------------*/
ReadPDSMember: Procedure
  Parse Arg dsname, stem_name

  /* Stem initialisieren */
  Call VALUE stem_name || '0', 0

  /* Prüfen ob Dataset existiert */
  x = LISTDSI(dsname)
  If x > 0 Then Do
    Say "Warnung: " dsname " nicht gefunden oder nicht zugreifbar"
    Say "SYSREASON: " SYSREASON
    Return
  End

  /* Dataset allokieren und lesen */
  "ALLOC FI(INDD) DA(" || dsname || ") SHR REUSE"
  If RC <> 0 Then Do
    Say "Fehler beim Allokieren von: " dsname
    Return
  End

  "EXECIO * DISKR INDD (STEM lines. FINIS"
  read_rc = RC

  "FREE FI(INDD)"

  If read_rc <> 0 Then Do
    Say "Fehler beim Lesen von: " dsname
    Return
  End

  /* Zeilen verarbeiten - leere Zeilen und Kommentare ignorieren */
  counter = 0
  Do i = 1 to lines.0
    line = Strip(lines.i)

    /* Leerzeilen überspringen */
    If line = "" Then Iterate

    /* Kommentarzeilen überspringen (beginnen mit * oder #) */
    If Left(line, 1) = "*" | Left(line, 1) = "#" Then Iterate

    /* Mehrere Member pro Zeile möglich (durch Blank getrennt) */
    Do j = 1 to Words(line)
      member = Word(line, j)
      If member <> "" Then Do
        counter = counter + 1
        Call VALUE stem_name || counter, member
      End
    End
  End

  /* Anzahl setzen */
  Call VALUE stem_name || '0', counter

Return

/*------------------------------------------------------------------*/
/* Library-Member auslesen und nach Regeln filtern                  */
/*------------------------------------------------------------------*/
GetFilteredMembers:
  filtered.0 = 0

  /* LISTDSI für Library-Informationen */
  x = LISTDSI(library)
  If x > 0 Then Do
    Say "Fehler beim Zugriff auf Library: " library
    Say "SYSREASON: " SYSREASON
    Say "SYSMSGLVL1: " SYSMSGLVL1
    Say "SYSMSGLVL2: " SYSMSGLVL2
    Exit 8
  End

  /* OUTTRAP zum Abfangen der LISTDS-Ausgabe */
  x = OUTTRAP('members.')
  "LISTDS" library "MEMBERS"
  x = OUTTRAP('OFF')

  If RC <> 0 Then Do
    Say "LISTDS fehlgeschlagen für: " library
    Exit 8
  End

  /* Member-Liste durchgehen (überspringt Header-Zeilen) */
  parse_started = 0
  Do i = 1 to members.0
    line = Strip(members.i)

    /* Startpunkt der Member-Liste finden */
    If Pos('--MEMBERS--', line) > 0 Then Do
      parse_started = 1
      Iterate
    End

    /* Member-Namen verarbeiten */
    If parse_started & line <> "" Then Do
      member = Strip(line)

      /* Filterlogik anwenden */
      If ShouldIncludeMember(member) Then Do
        filtered.0 = filtered.0 + 1
        filtered.filtered.0 = member
      End
    End
  End
Return

/*------------------------------------------------------------------*/
/* Prüfen ob Member included werden soll                            */
/*------------------------------------------------------------------*/
ShouldIncludeMember: Procedure Expose wlist. blist. use_whitelist
  Parse Arg member

  /* Wenn Whitelist gesetzt: nur diese Member nehmen */
  If use_whitelist Then Do
    found = 0
    Do i = 1 to wlist.0
      If MatchPattern(member, wlist.i) Then Do
        found = 1
        Leave
      End
    End
    If \found Then Return 0  /* Nicht in Whitelist */
  End

  /* Blacklist prüfen */
  Do i = 1 to blist.0
    If MatchPattern(member, blist.i) Then
      Return 0  /* Auf Blacklist gefunden */
  End

Return 1  /* Member soll included werden */

/*------------------------------------------------------------------*/
/* Pattern-Matching mit Wildcard-Unterstützung (*)                  */
/*------------------------------------------------------------------*/
MatchPattern: Procedure
  Parse Arg string, pattern

  /* Exakte Übereinstimmung */
  If string = pattern Then Return 1

  /* Wildcard-Pattern mit * */
  If Pos('*', pattern) = 0 Then Return 0

  /* Pattern mit * am Ende (z.B. "TEST*") */
  If Right(pattern, 1) = '*' Then Do
    prefix = Left(pattern, Length(pattern) - 1)
    If Left(string, Length(prefix)) = prefix Then Return 1
  End

  /* Pattern mit * am Anfang (z.B. "*TEST") */
  If Left(pattern, 1) = '*' Then Do
    suffix = Substr(pattern, 2)
    If Right(string, Length(suffix)) = suffix Then Return 1
  End

  /* Pattern mit * in der Mitte (z.B. "PRE*POST") */
  If Pos('*', pattern) > 1 & Pos('*', pattern) < Length(pattern) Then Do
    Parse Var pattern prefix '*' suffix
    If Left(string, Length(prefix)) = prefix & ,
       Right(string, Length(suffix)) = suffix Then Return 1
  End

Return 0