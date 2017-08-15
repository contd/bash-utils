#!/usr/bin/env bash

# check if stdout is a terminal
if test -t 1; then

  # see if it supports colors
  ncolors=$(tput colors)

  if test -n "$ncolors" && test $ncolors -ge 2; then
    HILIGHT='\033[0;32m'
    COMMENT='\033[0;33m'
    INFO='\033[0;36m'
    ERROR='\033[1;31m'
    B='\033[1;38m'
    U='\033[4;37m'
    C='\033[0m' # Clear (no color)
  fi

  printf "$INFO
  ┌──┐ │ ┌──┐┌──┐╶┼╴┌──┐┌──┐
  │──┘ │ │──┘│    │ │   │  │
  └──┘ └╴└──┘└──┘ └╴╵   └──┘
              ${C}Installer v1.0
"
fi

syntax()
{
  printf "
${B}SYNTAX$C
    ${B}electro$C ${U}command$C [${U}arguments$C] [${U}options$C]

${B}COMMAND$C
    ${HILIGHT}${B}create$C  - Creates a new, blank project.

        ${B}SYNTAX$C
            ${B}electro create$C ${U}project name$C [${B}--unstable$C] [${B}--framework-dev$C] [${U}other Composer options$C]

        ${B}ARGUMENTS$C
            ${U}project name$C     A relative (or absolute) path to the folder that will be created for the project.
                             If it's a simple name, a folder with that name will be created on the current directory.

        ${B}OPTIONS$C
            ${B}--unstable$C       Installs the latest development versions of all packages.
                             Use this if you want the bleeding edge features. Warning: your project MAY BREAK!

            ${B}--framework-dev$C  This is only for framework developers.
                             Installs all framework-related packages from source, to allow committing changes to their repos.
                             3rd-party packages are still installed in 'distribution' mode.

${B}COMMAND$C
    ${HILIGHT}${B}self-update$C - Updates the tool to the latest version.

"
  exit 1
}

syntax-error ()
{
  echo -e "
${ERROR}Syntax error!$C"
  syntax
}

command=$1
shift
case "$command" in

  "create")
    prefer="--prefer-dist"
    stability="stable"

    if [[ -n "$1" && ! "$1" =~ ^-- ]]; then
      name="$1"
      shift
    else
      syntax-error
    fi

    while true; do
      case "$1" in
        "--framework-dev")
          prefer=""
          ;;
        "--unstable")
          stability="dev"
          ;;
        *)
          break
      esac
      shift
    done

#------------------------------------------------------------------------------------
    if [ "$stability" == "stable" ]; then
      printf "
${COMMENT}Note: until the framework reaches v1.0, stability mode is forced to --unstable.${C}
"
      stability="dev"
    fi
#------------------------------------------------------------------------------------

    printf "
Creating project ${HILIGHT}$name${C} in ${HILIGHT}$stability${C} mode"
if [ -z "$prefer" ]; then
  printf ", optimized for framework development"
fi
echo "...
"
    composer create-project -s $stability --no-progress --profile $prefer electro/electro $name "$@"
    ;;
  "self-update")
    echo -e "
${ERROR}Sorry, this is not implemented yet.$C
"
    ;;
  "--help"|"")
  printf "
${B}NAME$C
    ${B}electro$C -- command line tool to create new ${INFO}electro framework$C projects
"
    syntax
    ;;
  *)
    syntax-error
esac
