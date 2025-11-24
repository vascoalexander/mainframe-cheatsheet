## ISPF Panel / System Commands

| **Command**      | **Beschreibung**                                        |
| ---------------- | ------------------------------------------------------- |
| **TSO**          | Führt TSO-Befehle aus (`TSO LISTA`, `TSO ALLOC`, …).    |
| **ISPF**         | Startet ISPF.                                           |
| **END**          | Verlässt aktuelles Panel / kehrt zurück.                |
| **RETURN**       | Kehrt direkt zur vorherigen Bereichsebene zurück.       |
| **EXIT**         | Verlässt ISPF vollständig.                              |
| **HELP**         | Öffnet Hilfefenster.                                    |
| **UP / DOWN**    | Scrollt im Panel/Listings.                              |
| **LEFT / RIGHT** | Horizontales Scrollen.                                  |
| **HOME**         | Cursor auf erste Position.                              |
| **PF1–PF24**     | Standard-Funktionstasten für Scrolling, Hilfe, Befehle. |
| **DSLIST**       | Öffnet Dataset-Liste (Option 3.4).                      |
| **LISTCAT**      | Zeigt Katalogeinträge an (TSO LISTCAT).                 |
| **RENAME**       | Benennt Dataset im 3.2-Menü um.                         |
| **DELETE**       | Löscht Dataset im 3.2-Menü mit Bestätigung.             |
| **COPY**         | Kopiert Dataset/Member (ISPF Utility 3.3).              |
| **MOVE**         | Verschiebt Dataset/Member.                              |
| **BROWSE**       | Öffnet Dataset im Lesemodus.                            |
| **EDIT**         | Öffnet Dataset im Editmodus.                            |
| **VIEW**         | Öffnet Dataset schreibgeschützt.                        |
| **ALLOC**        | TSO Allocate – erstellt Datasets.                       |
| **FREE**         | TSO Free – gibt DD-Namen frei.                          |
| **SUBMIT**       | Job absetzen: `SUBMIT 'DSN(JCL)'`.                      |
| **PRINT**        | Druckt Dataset über Spool.                              |
| **SDSF**         | Öffnet SDSF (JES2/3 Job Monitoring).                    |
| **OMVS**         | Startet UNIX-Shell (z/OS UNIX).                         |
| **ISPVCALL**     | Aufruf von Visual ISPF Panels.                          |

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

