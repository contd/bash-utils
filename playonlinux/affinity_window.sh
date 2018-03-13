#!/usr/bin/env playonlinux-bash

# Date : (2017-12-13)
# Distribution used to test : Ubuntu 17.10 x64
# Author : Jason Kumpf
# Licence : GPLv3
# PlayOnLinux: 4.2.12

[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

PREFIX="AffinityDesigner"
WINEVERSION="2.22"
TITLE="Affinity Designer"
EDITOR="Affinity"
GAME_URL="https://affinity.serif.com/en-us/"
AUTHOR="Jason Kumpf"

POL_SetupWindow_Init
POL_SetupWindow_SetID 3251

POL_Debug_Init

# Presentation
POL_SetupWindow_presentation "$TITLE" "$EDITOR" "$GAME_URL" "$AUTHOR" "$PREFIX"

# Create prefix and temporary download folder
POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WINEVERSION"
POL_System_TmpCreate "AppManagerTmp"

# Install dependencies
POL_Call POL_Install_atmlib
POL_Call POL_Install_corefonts
POL_Call POL_Install_FontsSmoothRGB
POL_Call POL_Install_gdiplus

# Get the installer
POL_SetupWindow_message "$(eval_gettext 'On the next screen, you can choose between automatically downloading the Creative Cloud installer, or selecting it from your computer.\n\nIt is HIGHLY RECOMMENDED to let the script download the Creative Cloud installer for you, since the downloaded version has been verified to work.')" "$TITLE"
POL_SetupWindow_InstallMethod "LOCAL"

# The normal Creative Cloud setup requires Windows 7 or higher
Set_OS "win7"
POL_SetupWindow_browse "Please select the Affinity Designer install program." "$TITLE"
POL_SetupWindow_wait "Installation in progress..." "$TITLE"
INSTALLER="$APP_ANSWER"

# Installation
POL_SetupWindow_message "$(eval_gettext 'Installation is running...')" "$TITLE"
POL_Wine_WaitBefore "$TITLE"
POL_Wine "$INSTALLER"
#POL_Shortcut "AffinityDesigner.exe" "Affinity Designer"
POL_System_TmpDelete

# All done
POL_SetupWindow_message "$(eval_gettext 'The installation is now complete.')" "$TITLE"

POL_SetupWindow_Close
exit 0
