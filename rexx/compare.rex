/* REXX - Dataset Member Vergleich mit Report */
/* Vergleicht zwei Dataset Members und schreibt Report */

PARSE ARG DSN1 DSN2

/* --- Initialisierung --- */
IF DSN1 = '' | DSN2 = '' THEN DO
  SAY 'FEHLER: Unvollständige Parameter'
  SAY 'Aufruf: TSO COMPARE dsn1 dsn2'
  EXIT 8
END

SEP = copies('-',72)

/* Dateiinhalte */
FILE1. = ''
FILE2. = ''
FILE1.0 = 0
FILE2.0 = 0

/* Report Dataset */
RPTDSN = 'XXXXXX.PROGRAMM.COBOL(COMPRPT)'

/*-------------------------------------------------------------------*/
/* MAIN                                                              */
/*-------------------------------------------------------------------*/

CALL READFILE DSN1, 'FILE1.'
CALL READFILE DSN2, 'FILE2.'

CALL COMPARE_FILES
CALL CREATE_REPORT

EXIT RC_FINAL

/*-------------------------------------------------------------------*/
/* Subroutine: Datei einlesen                                        */
/*-------------------------------------------------------------------*/

READFILE: PROCEDURE EXPOSE FILE1. FILE2.
  PARSE ARG DATASET, STEMNAME

  SAY 'Lese ' || DATASET
  ADDRESS TSO
  "ALLOC F(INFILE1) DA('"DATASET"') SHR REUSE"
  IF RC <> 0 THEN DO
    SAY 'FEHLER beim Allokieren von ' || DATASET || ' RC=' || RC
    EXIT RC
  END

  "EXECIO * DISKR INFILE1 (STEM" STEMNAME "FINIS"
  IF RC <> 0 THEN DO
    SAY 'Fehler beim Lesen von ' || DATASET || ' RC=' || RC
    "FREE F(INFILE1)"
    EXIT RC
  END
  "FREE F(INFILE1)"

RETURN

/*-------------------------------------------------------------------*/
/* Subroutine: Dateivergleich                                        */
/*-------------------------------------------------------------------*/

COMPARE_FILES: PROCEDURE EXPOSE FILE1. FILE2. DIFFERENCES IDENTICAL
  DIFFERENCES = 0
  IDENTICAL   = 0
  MAXLINES    = MAX(FILE1.0, FILE2.0)

  DO I = 1 TO MAXLINES
    LINE1 = FILE1.I
    LINE2 = FILE2.I

    IF LINE1 = LINE2 THEN DO
      IDENTICAL = IDENTICAL + 1
    END
    ELSE DO
      DIFFERENCES = DIFFERENCES + 1
    END
  END

  IF DIFFERENCES = 0 THEN DO
    SAY 'Die Dateien sind identisch'
  END
  ELSE DO
    SAY 'Unterschiede gefunden: ' DIFFERENCES
  END

RETURN

/*-------------------------------------------------------------------*/
/* Subroutine: Report erstellen und schreiben                        */
/*-------------------------------------------------------------------*/

CREATE_REPORT: PROCEDURE EXPOSE DSN1 DSN2 RPTDSN SEP FILE1. FILE2. ,
                                DIFFERENCES IDENTICAL RC_FINAL

  SAY 'Bereite Report vor: ' RPTDSN

  PDS    = 'XXXXXX.PROGRAMM.COBOL'
  MEMBER = 'COMPRPT'

  X = LISTDSI("'"PDS"'")
  IF X <> 0 THEN DO
    SAY 'FEHLER: PDS ' PDS ' existiert nicht'
    SAY 'Bitte erstellen Sie das Dataset zuerst'
    EXIT 8
  END

  ADDRESS TSO
  "ALLOC F(REPORT) DA('"RPTDSN"') SHR REUSE"
  IF RC <> 0 THEN DO
    SAY 'FEHLER beim Allokieren von ' RPTDSN ' RC=' RC
    EXIT RC
  END

  /* Report Array aufbauen */
  REPORT. = ''
  IDX     = 0

  /* Header */
  CALL ADD_REPORT_LINE 'DATEI VERGLEICH REPORT'
  CALL ADD_REPORT_LINE SEP
  CALL ADD_REPORT_LINE 'Datum/Zeit: ' DATE('E') ' ' TIME()
  CALL ADD_REPORT_LINE 'Dataset 1: ' DSN1
  CALL ADD_REPORT_LINE 'Dataset 2: ' DSN2
  CALL ADD_REPORT_LINE SEP
  CALL ADD_REPORT_LINE ''

  /* Auflistung der Unterschiede */
  MAXLINES = MAX(FILE1.0, FILE2.0)
  DO I = 1 TO MAXLINES
    LINE1 = FILE1.I
    LINE2 = FILE2.I

    IF LINE1 <> LINE2 THEN DO
      CALL ADD_REPORT_LINE 'UNTERSCHIED in Zeile ' RIGHT(I, 5, '0')
      CALL ADD_REPORT_LINE '   FILE 1: ' LINE1
      CALL ADD_REPORT_LINE '   FILE 2: ' LINE2
      CALL ADD_REPORT_LINE ''
    END
  END

  /* Zusammenfassung */
  CALL ADD_REPORT_LINE SEP
  CALL ADD_REPORT_LINE 'ZUSAMMENFASSUNG'
  CALL ADD_REPORT_LINE SEP
  CALL ADD_REPORT_LINE 'Zeilen in Dataset 1    : ' RIGHT(FILE1.0, 6)
  CALL ADD_REPORT_LINE 'Zeilen in Dataset 2    : ' RIGHT(FILE2.0, 6)
  CALL ADD_REPORT_LINE 'Identische Zeilen      : ' RIGHT(IDENTICAL, 6)
  CALL ADD_REPORT_LINE 'Unterschiedliche Zeilen: ' RIGHT(DIFFERENCES, 6)
  CALL ADD_REPORT_LINE SEP

  IF DIFFERENCES = 0 THEN DO
    CALL ADD_REPORT_LINE 'ERGEBNIS: Dateien sind identisch'
    RC_FINAL = 0
  END
  ELSE DO
    CALL ADD_REPORT_LINE 'ERGEBNIS: Dateien haben Unterschiede'
    RC_FINAL = 4
  END

  REPORT.0 = IDX

  /* Report schreiben */
  "EXECIO" IDX "DISKW REPORT (STEM REPORT. FINIS"
  IF RC <> 0 THEN DO
    SAY 'FEHLER beim schreiben des Reports RC= ' RC
    "FREE F(REPORT)"
    EXIT RC
  END

  "FREE F(REPORT)"
  SAY 'Report geschrieben nach: ' RPTDSN

RETURN

/*-------------------------------------------------------------------*/
/* Hilfsfunktion: Zeile zum Report hinzufügen                        */
/*-------------------------------------------------------------------*/

ADD_REPORT_LINE: PROCEDURE EXPOSE REPORT. IDX
  PARSE ARG LINE
  IDX        = IDX + 1
  REPORT.IDX = LINE
RETURN