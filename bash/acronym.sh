#!/bin/bash

# a="Liquid-crystal display"
# a="The Road __Not__ Taken"
a="Two * Words"
echo "$(echo "$a" | sed 's/-/ /' | sed 's/[^a-zA-Z0-9 ]//g' | sed 's/\(.\)[^ ]* */\1/g' | tr '[:lower:]' '[:upper:]')"
