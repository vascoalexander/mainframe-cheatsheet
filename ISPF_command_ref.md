## ISPF Editor Commands – Übersichtstabelle

| **Command**         | **Syntax / Optionen**                 | **Beschreibung**                                                            |
| ------------------- | ------------------------------------- | --------------------------------------------------------------------------- |
| **SAVE**            | `SAVE`                                | Speichert die aktuellen Änderungen. Datei bleibt geöffnet.                  |
| **CANCEL**          | `CANCEL`                              | Verwirft alle Änderungen seit dem letzten Save.                             |
| **RESET**           | `RESET`                               | Hebt Temporär-Flags (X, F, COLS-Highlight, Pending Commands) im Editor auf. |
| **DELETE**          | `D`, `DEL`, `DD`                      | Löscht eine oder mehrere Zeilen. `DD` markiert Block.                       |
| **RENAME**          | *nur im DSLIST/3.2*                   | Benennt ein Dataset / Member um. Im Editor nicht als Command verfügbar.     |
| **FIND**            | `FIND string` oder `F string`         | Sucht nach einem String. `NEXT` wiederholt.                                 |
| **SORT**            | `SORT COL n m`                        | Sortiert Zeilen nach Spaltenbereich `n` bis `m`.                            |
| **EXCLUDE**         | `X string`, `X all`, `XFIND`          | Blendet Zeilen aus, die den String enthalten.                               |
| **CHANGE**          | `CHANGE old new` oder `C old new ALL` | Ersetzt Strings. Mit `ALL` in allen Zeilen.                                 |
| **START**           | `START n`                             | Springt zu Zeile `n`.                                                       |
| **SWAP**            | `SWAP`                                | Wechselt zwischen zwei parallelen Edit-Sessions.                            |
| **SPLIT**           | `SPLIT`                               | Öffnet eine zweite Session (unterteilt den Bildschirm).                     |
| **HEX ON**          | `HEX ON/OFF`                          | Hex-Modus für Binärdaten.                                                   |
| **CUT**             | `CUT`, `CUT prefix`, `CUT APPEND`     | Schneidet markierte Zeilen in den Edit-Clipboard.                           |
| **PASTE**           | `PASTE`, `PASTE BEFORE/AFTER`         | Fügt Inhalte aus Clipboard wieder ein.                                      |
| **COPY**            | `COPY dataset(member)`                | Kopiert Inhalt eines anderen Members in die aktuelle Session.               |
| **MOVE**            | `MOVE dataset(member)`                | Verschiebt Inhalt eines anderen Members in die aktuelle Session.            |
| **REPLACE**         | `REPLACE dataset(member)`             | Überschreibt den Inhalt des Members mit dem aktuellen Editor-Inhalt.        |
| **TS**              | `TS n`                                | Scrollt um `n` Bildschirmseiten nach unten.                                 |
| **UP / DOWN**       | `UP n`, `DOWN n`                      | Scrollt `n` Zeilen rauf oder runter.                                        |
| **LEFT / RIGHT**    | `LEFT n`, `RIGHT n`                   | Scrollt horizontal.                                                         |
| **COLS**            | `COLS`                                | Zeigt Spaltenlineal an.                                                     |
| **MASK**            | `MASK ON/OFF`                         | Aktiviert/Deaktiviert Eingabemaske.                                         |
| **PROFILE**         | `PROFILE`                             | Zeigt Editoreinstellungen (Numbers, Autosave, Recovery).                    |
| **UNDO**            | `UNDO`                                | Macht die letzte Änderung rückgängig (nur wenn aktiv erlaubt).              |
| **REPEAT**          | `R`, `RR`                             | Wiederholt vorherige Änderung oder Anwendung auf Block.                     |
| **UNNUM**           | `UNNUM`                               | Entfernt Zeilennummern im DATA-Modus.                                       |
| **NUM ON/OFF**      | `NUM ON/OFF`                          | Zeigt/unterdrückt Zeilennummern.                                            |
| **TOP**             | `TOP`                                 | Springt an den Anfang der Datei.                                            |
| **BOTTOM**          | `BOTTOM`                              | Springt an das Ende der Datei.                                              |
| **LOCATE**          | `LOCATE string`                       | Springt direkt zur ersten Fundstelle.                                       |
| **TFIND**           | `TFIND string`                        | Sucht in **sichtbaren** Zeilen (Skip excluded).                             |
| **COMPARE**         | `COMPARE dataset(member)`             | Vergleicht zwei Members im Editor.                                          |
| **DSLIST**          | `DSLIST`                              | Öffnet Dataset-Liste aus dem Editor heraus.                                 |
| **RECOVERY ON/OFF** | `RECOVERY ON/OFF`                     | Aktiviert/Deaktiviert Recovery-Funktionen.                                  |
| **SAVEAS**          | `SAVEAS dataset(member)`              | Speichert unter neuem Name.                                                 |
| **VIEW**            | `VIEW dataset(member)`                | Öffnet Datei nur lesend aus dem Editor heraus.                              |

## Line-Commands (Zeilenkommandos)

| **Line Cmd** | **Beschreibung**                     |
| ------------ | ------------------------------------ |
| `I`          | Insert: neue Zeile einfügen          |
| `II`         | Block einfügen                       |
| `D`          | Delete – löscht Zeile                |
| `DD`         | Markiert Block zum Löschen           |
| `R`          | Repeat – wiederholt vorherige Zeile  |
| `RR`         | Wiederholt Block                     |
| `C`          | Copy eine Zeile                      |
| `CC`         | Markiert Block zum Kopieren          |
| `M`          | Move eine Zeile                      |
| `MM`         | Markiert Block zum Verschieben       |
| `A`          | Paste after                          |
| `B`          | Paste before                         |
| `O`          | Overlay – überschreibt Zeilenbereich |
| `OO`         | Overlay blockweise                   |
| `X`          | Exclude Zeile                        |
| `XX`         | Exclude Block                        |
