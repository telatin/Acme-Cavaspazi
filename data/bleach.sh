#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

SOURCE="$SCRIPT_DIR"/../bin/cavaspazi
DEST="$SCRIPT_DIR"/../bin/solospazi
cp "$SOURCE" "$DEST"
empty_line_number=$(grep -n -m 1 '^$' "$DEST" | cut -d ':' -f 1)
if [[ -n "$empty_line_number" ]]; then
    new_string="use Acme::Bleach;"
    sed -i "${empty_line_number}s/.*/${new_string}/" "$DEST"
    echo "Replaced the first empty line with: $new_string"
  else
    echo "No empty line found in the file."
fi

perl "$DEST"
