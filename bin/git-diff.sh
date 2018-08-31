#!/usr/bin/env bash

if [[ "$1" = "--help" ]] || [[ "$1" = "-h" ]]; then
    print_usage
    exit 0
fi

FROM="$1"
TO="$2"
if [[ -z "$FROM" ]] || [[ -z "$TO" ]]; then
    echo "Error: missing arguments"
    echo ""
    echo "Usage"
    echo "  gitdiff <branch|tag|commit> <branch|tag|commit>"
    echo ""
    echo "Example"
    echo "  git diff develop master"
    exit 1
fi

if [[ ! -d .git ]]; then # .git folder exists?
    echo "Error: current directory is not a git root directory"
    exit 1
fi

DIR=${TMPDIR%/}/gitdiff # `%/` removes trailing slash
rm -rf "$DIR"
for i in $(git diff --name-only $FROM $TO); do
    # setup folder structure
    mkdir -p $DIR/"$FROM"/"$(dirname $i)";
    mkdir -p $DIR/"$TO"/"$(dirname $i)";

    # Get revision of files
    git show "$FROM":"$i" > "$DIR"/"$FROM"/$i;
    git show "$TO":"$i" > "$DIR"/"$TO"/$i;
done

# Use git's difftool or opendiff as alternative
DIFFTOOL=$(expr "$(git config --get diff.tool)" '|' "colordiff")

$($DIFFTOOL "$DIR"/"$FROM" "$DIR"/"$TO")
