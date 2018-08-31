#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "Must provide the .docx file and the name of the markdown file (i.e. file.md)"
elif [ "$#" -eq 1 ]; then
    pandoc -o "$1.docx" --extract-media images "$1.md" --no-wrap --normalize --smart
else
    pandoc -o "$1.docx" --extract-media images "$2.md" --no-wrap --normalize --smart
fi

exit 0