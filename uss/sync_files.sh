#!/bin/sh
# sync_git.sh - Production version with IBM-1147 support

SYNC_DIR="$HOME/sync"
PDS="USER.PROGRAMM.COBOL"
EBCDIC_CODEPAGE="IBM-1147"  # Deutsche EBCDIC-Codepage

echo "============================================"
echo "COBOL Sync Script"
echo "Source: $SYNC_DIR"
echo "Target: $PDS"
echo "Target Codepage: $EBCDIC_CODEPAGE"
echo "============================================"
echo ""

# Methode 1: Versuche _BPXK_AUTOCVT
export _BPXK_AUTOCVT=ON

success=0
failed=0
method_used=""

for file in $SYNC_DIR/*.cbl; do
    if [ ! -f "$file" ]; then
        echo "No .cbl files found in $SYNC_DIR"
        break
    fi

    member=$(basename "$file" .cbl | tr '[:lower:]' '[:upper:]')

    echo "Processing: $(basename "$file") -> $member"

    # Versuche zuerst mit AUTOCVT
    cp "$file" "//'$PDS($member)'" 2>/dev/null

    if [ $? -eq 0 ]; then
        method_used="AUTOCVT"
        echo "  SUCCESS (using $_BPXK_AUTOCVT)"
        success=$((success + 1))
    else
        # Fallback: Manuelle Konvertierung mit IBM-1147
        echo "  AUTOCVT failed, trying manual conversion..."
        tmpfile="/tmp/${member}.ebcdic"

        iconv -f UTF-8 -t $EBCDIC_CODEPAGE "$file" > "$tmpfile" 2>/dev/null

        if [ $? -ne 0 ]; then
            # Fallback zu ISO8859-1 wenn UTF-8 nicht funktioniert
            iconv -f ISO8859-1 -t $EBCDIC_CODEPAGE "$file" > "$tmpfile" 2>/dev/null
        fi

        if [ $? -eq 0 ]; then
            cp "$tmpfile" "//'$PDS($member)'"

            if [ $? -eq 0 ]; then
                method_used="iconv+IBM-1147"
                echo "  SUCCESS (using manual conversion)"
                success=$((success + 1))
            else
                echo "  FAILED"
                failed=$((failed + 1))
            fi
        else
            echo "  FAILED (conversion error)"
            failed=$((failed + 1))
        fi

        rm -f "$tmpfile"
    fi

    echo ""
done

echo "============================================"
echo "Summary: $success succeeded, $failed failed"
echo "Method: $method_used"
echo "============================================"