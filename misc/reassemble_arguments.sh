#!/usr/bin/env bash

## Reassemble arguments (support-most-cases implementation)
## Author: Przemyslaw Pawelczyk

ARGC=$#
argcon=
argkey=
argval=
while [ $ARGC -gt 0 ]; do
	arg=$1
	shift
	ARGC=$((ARGC - 1))
	case "$arg" in
	'"'*'"')
		if [ "$argcon" = "'" ]; then
			argval="$argval $arg"
		elif [ "$argcon" = '"' ]; then
			echo "$0: Unsupported syntax!" >&2
		else
			arg=${arg#\"}
			arg=${arg%\"}
			set -- "$@" "$arg"
		fi
		;;
	"'"*"'")
		if [ "$argcon" = '"' ]; then
			argval="$argval $arg"
		elif [ "$argcon" = "'" ]; then
			echo "$0: Unsupported syntax!" >&2
		else
			arg=${arg#\'}
			arg=${arg%\'}
			set -- "$@" "$arg"
		fi
		;;
	'"'|"'")
		if [ -n "$argcon" ]; then
			if [ "$argcon" = "$arg" ]; then
				argval="$argval ${arg%$argcon}"
				set -- "$@" "$argkey$argval"
				argcon=
				argkey=
				argval=
			else
				argval="$argval $arg"
			fi
		else
			argcon=$arg
			argkey=
			argval=
		fi
		;;
	'"'*)
		if [ "$argcon" = "'" ]; then
			if [ "${arg%$argcon}" != "$arg" ] && [ "${arg%$argcon}" = "${arg%%$argcon*}" ]; then
				argval="$argval ${arg%$argcon}"
				set -- "$@" "$argkey$argval"
				argcon=
				argkey=
				argval=
			else
				argval="$argval $arg"
			fi
		elif [ "$argcon" = '"' ]; then
			echo "$0: Unsupported syntax!" >&2
		else
			argcon='"'
			argkey=
			argval=${arg#\"}
		fi
		;;
	"'"*)
		if [ "$argcon" = '"' ]; then
			if [ "${arg%$argcon}" != "$arg" ] && [ "${arg%$argcon}" = "${arg%%$argcon*}" ]; then
				argval="$argval ${arg%$argcon}"
				set -- "$@" "$argkey$argval"
				argcon=
				argkey=
				argval=
			else
				argval="$argval $arg"
			fi
		elif [ "$argcon" = "'" ]; then
			echo "$0: Unsupported syntax!" >&2
		else
			argcon="'"
			argkey=
			argval=${arg#\'}
		fi
		;;
	*=*)
		if [ -n "$argcon" ]; then
			if [ "${arg%$argcon}" != "$arg" ] && [ "${arg%$argcon}" = "${arg%%$argcon*}" ]; then
				argval="$argval ${arg%$argcon}"
				set -- "$@" "$argkey$argval"
				argcon=
				argkey=
				argval=
			else
				argval="$argval $arg"
			fi
		else
			argkey="${arg%%=*}="
			argval=${arg#*=}
			case "$argval" in
			'"'*'"')
				argval=${argval#\"}
				argval=${argval%\"}
				set -- "$@" "$argkey$argval"
				;;
			"'"*"'")
				argval=${argval#\'}
				argval=${argval%\'}
				set -- "$@" "$argkey$argval"
				;;
			'"'*)
				argcon='"'
				argval=${argval#\"}
				;;
			"'"*)
				argcon="'"
				argval=${argval#\'}
				;;
			*)
				set -- "$@" "$argkey$argval"
				;;
			esac
		fi
		;;
	*)
		if [ -n "$argcon" ]; then
			if [ "${arg%$argcon}" != "$arg" ] && [ "${arg%$argcon}" = "${arg%%$argcon*}" ]; then
				argval="$argval ${arg%$argcon}"
				set -- "$@" "$argkey$argval"
				argcon=
				argkey=
				argval=
			else
				argval="$argval $arg"
			fi
		else
			set -- "$@" "$arg"
		fi
		;;
	esac
done
if [ -n "$argcon" ]; then
	set -- "$@" "$argkey$argval"
	echo "$0: Unsupported syntax!" >&2
fi

# show current arguments

for I in "$@"; do
	echo ">$I<"
done
