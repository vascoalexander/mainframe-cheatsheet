## ISPF Panel / System Commands

| **Command / Aktion**           | **Syntax / Shortcut**          | **Beschreibung**                                               |
| ------------------------------ | ------------------------------ | -------------------------------------------------------------- |
| **TSO-Befehl ausführen**       | `TSO <cmd>`                    | Führt TSO-Kommandos aus (ALLOC, LISTCAT, PROFILE, FREE, etc.). |
| **ISPF starten**               | `ISPF`                         | Startet die ISPF-Umgebung.                                     |
| **END (Panel verlassen)**      | `END`, `PF3`                   | Geht ein Panel zurück.                                         |
| **RETURN (Bereich verlassen)** | `RETURN`                       | Springt auf obere Ebene des aktuellen Bereichs.                |
| **EXIT (ISPF verlassen)**      | `EXIT`, `PF3` mehrfach         | Beendet ISPF vollständig.                                      |
| **HELP**                       | `HELP`, `PF1`                  | Öffnet kontextbezogene Hilfe.                                  |
| **Scrollen: Down**             | `DOWN`, `PF8`                  | Eine Seite nach unten.                                         |
| **Scrollen: Up**               | `UP`, `PF7`                    | Eine Seite nach oben.                                          |
| **Scrollen: Left**             | `LEFT`, `PF10`                 | Horizontal nach links.                                         |
| **Scrollen: Right**            | `RIGHT`, `PF11`                | Horizontal nach rechts.                                        |
| **Home Position**              | `HOME`, `PF4` (je nach System) | Cursor an Zeilenanfang.                                        |
| **DSLIST öffnen**              | `3.4` oder `DSLIST`            | Datasetliste anzeigen.                                         |
| **Dataset: Edit**              | `E` (auf Zeile)                | Öffnet Member/Dataset im Editor.                               |
| **Dataset: Browse**            | `B`                            | Öffnet im Nur-Lese-Modus.                                      |
| **Dataset: View**              | `V`                            | Öffnet Dataset schreibgeschützt.                               |
| **Dataset: Copy**              | `C`                            | Kopiert Dataset/Member (innerhalb DSLIST).                     |
| **Dataset: Move**              | `M`                            | Verschiebt Dataset/Member.                                     |
| **Dataset: Rename**            | `R`                            | Benennt Dataset/Member um.                                     |
| **Dataset: Delete**            | `D`                            | Löscht Dataset/Member (mit Bestätigung).                       |
| **Dataset: Create (ALLOC)**    | `A` oder `TSO ALLOC`           | Erstellt/Allokiert ein neues Dataset.                          |
| **Dataset-Informationen**      | `I`                            | Zeigt Dataset-Attribute an.                                    |
| **Member-Liste (in PDS)**      | `S` auf dem Dataset            | Listet Member auf.                                             |
| **Submit JCL**                 | `SUBMIT` / `SUB 'ds(member)'`  | Sendet Job an JES.                                             |
| **SDSF öffnen**                | `SDSF`                         | Job-Monitoring, JES-Ausgaben.                                  |
| **OMVS starten**               | `OMVS`                         | Öffnet z/OS UNIX Shell.                                        |
| **COPY Utility**               | `3.3`                          | ISPF Copy Utility (Datensätze kopieren).                       |
| **MOVE Utility**               | `3.3 M`                        | Datensätze verschieben.                                        |
| **RENAME Utility**             | `3.2 R`                        | Dataset umbenennen.                                            |
| **DELETE Utility**             | `3.2 D`                        | Dataset löschen.                                               |
| **LISTCAT**                    | `TSO LISTCAT`                  | Zeigt Kataloginformationen.                                    |
| **PRINT Dataset**              | `PRINT`                        | Sendet Dataset an definierten Drucker/Spool.                   |
| **RECFM/DSORG anzeigen**       | `TSO LISTDSI`                  | Details zum Dataset.                                           |
| **ISPVCALL**                   | `ISPVCALL PANEL(pname)`        | Ruft Visual/Custom-Panel auf.                                  |

## ISPF Editor Commands – Übersichtstabelle

| **Command**      | **Syntax / Optionen**             | **Beschreibung**                                            |
| ---------------- | --------------------------------- | ----------------------------------------------------------- |
| **SAVE**         | `SAVE`                            | Speichert die aktuellen Änderungen.                         |
| **SAVEAS**       | `SAVEAS dsname(member)`           | Speichert unter neuem Dataset oder Member.                  |
| **CANCEL**       | `CANCEL`                          | Verwirft Änderungen seit letztem SAVE.                      |
| **RESET**        | `RESET`                           | Entfernt Excludes, Marker und Pending-Commands.             |
| **FIND**         | `FIND string`, `F string`         | Sucht String vorwärts.                                      |
| **FIND PREV**    | `FIND string PREV`                | Sucht rückwärts.                                            |
| **CHANGE**       | `CHANGE old new`, `C old new ALL` | Ersetzt Strings (einmal oder alle Vorkommen).               |
| **TFIND**        | `TFIND string`                    | Sucht nur in sichtbaren (nicht-excluded) Zeilen.            |
| **LOCATE**       | `LOCATE string`                   | Springt direkt zur nächsten Fundstelle.                     |
| **HEX ON/OFF**   | `HEX ON`                          | Aktiviert Hex-Ansicht.                                      |
| **START**        | `START n`                         | Springt zu Zeile `n`.                                       |
| **TOP**          | `TOP`                             | Springt an den Anfang der Datei.                            |
| **BOTTOM**       | `BOTTOM`                          | Springt ans Ende der Datei.                                 |
| **UP / DOWN**    | `UP n`, `DOWN n`                  | Scrollt `n` Zeilen rauf/runter.                             |
| **LEFT / RIGHT** | `LEFT n`, `RIGHT n`               | Horizontales Scrollen.                                      |
| **TS**           | `TS n`                            | Scrollt `n` Bildschirmseiten nach unten.                    |
| **PROFILE**      | `PROFILE`                         | Zeigt Editorprofil (NUM, AUTOSAVE etc.).                    |
| **NUM ON/OFF**   | `NUM ON`, `NUM OFF`               | Aktiviert/Deaktiviert Zeilennummern.                        |
| **UNNUM**        | `UNNUM`                           | Entfernt vorhandene Zeilennummern permanent.                |
| **COLS**         | `COLS`                            | Zeigt Spaltenlineal an.                                     |
| **SORT**         | `SORT COL n m`                    | Sortiert Zeilen nach Spaltenbereich.                        |
| **EXCLUDE**      | `X string`, `X ALL`               | Blendet Zeilen aus, die passen.                             |
| **DISPLAY**      | `DISPLAY ALL/NX`                  | Zeigt alle oder nur nicht-excluded Zeilen.                  |
| **CUT**          | `CUT`, `CUT APPEND`               | Schneidet Zeilen in Editor-Clipboard.                       |
| **PASTE**        | `PASTE`, `PASTE BEFORE/AFTER`     | Fügt Clipboard ein.                                         |
| **COPY**         | `COPY dsname(member)`             | Importiert Inhalt eines anderen Members.                    |
| **MOVE**         | `MOVE dsname(member)`             | Importiert + löscht Original.                               |
| **REPLACE**      | `REPLACE dsname(member)`          | Überschreibt ein anderes Member mit aktuellem Inhalt.       |
| **COMPARE**      | `COMPARE ds(m)`                   | Vergleicht zwei Member im Editor.                           |
| **SPLIT**        | `SPLIT`                           | Rastert Bildschirm und startet zweite Session.              |
| **SWAP**         | `SWAP`                            | Wechselt zwischen parallelen Edit-Sessions.                 |
| **VIEW**         | `VIEW ds(m)`                      | Öffnet anderes Dataset im View-Modus aus dem Editor heraus. |
| **UNDO**         | `UNDO`                            | Macht letzte Änderung rückgängig (falls aktiviert).         |

## Line-Commands (Zeilenkommandos)

| **Line Cmd** | **Beschreibung**                                                 |
| ------------ | ---------------------------------------------------------------- |
| **I**        | Fügt eine neue Zeile ein.                                        |
| **II**       | Fügt mehrere neue Zeilen ein (Block).                            |
| **D**        | Löscht eine Zeile.                                               |
| **DD**       | Markiert Block zum Löschen.                                      |
| **R**        | Wiederholt vorherige Zeile.                                      |
| **RR**       | Wiederholt Block.                                                |
| **C**        | Kopiert eine Zeile.                                              |
| **CC**       | Markiert Block zum Kopieren.                                     |
| **M**        | Verschiebt eine Zeile.                                           |
| **MM**       | Markiert Block zum Verschieben.                                  |
| **A**        | Einfügen *nach* markiertem Block.                                |
| **B**        | Einfügen *vor* markiertem Block.                                 |
| **O**        | Overlay – überschreibt Zeile.                                    |
| **OO**       | Overlay-Block.                                                   |
| **X**        | Exclude Zeile.                                                   |
| **XX**       | Exclude Block.                                                   |
| **S**        | Select – öffnet Member im Browse/Edit/View abhängig vom Kontext. |
| **F**        | Fold – klappt lange Zeilen.                                      |
| **TF**       | Temporäres Folden von Block.                                     |
| **K**        | Keep – hebt Exclude für eine Zeile auf.                          |
| **A n**      | Dupliziert Zeile *n*-mal *nach* der aktuellen.                   |
| **B n**      | Dupliziert Zeile *n*-mal *vor* der aktuellen.                    |
| **<**        | Shift Left (ein Zeichen).                                        |
| **<<**       | Shift Left Block.                                                |
| **>**        | Shift Right (ein Zeichen).                                       |
| **>>**       | Shift Right Block.                                               |

