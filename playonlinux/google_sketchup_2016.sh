#!/bin/bash
# Date : (2011-11-06 21-34)
# Last revision : (2013-07-11 23-38)
 
[ "$PLAYONLINUX" = "" ] && exit
source "$PLAYONLINUX/lib/sources"
 
TITLE="Google SketchUp"
PREFIX="GoogleSketchUp"
WORKING_WINE_VERSION="2.17"
LOCALE="en_EN.utf8" #default localisation

#Initialization
POL_SetupWindow_Init
POL_SetupWindow_SetID 3251
POL_Debug_Init
 
POL_SetupWindow_presentation "$TITLE" "Google" "http://sketchup.google.com/" "NSLW" "$PREFIX"
POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WORKING_WINE_VERSION" 
POL_System_TmpCreate "$PREFIX"
Set_OS "win7"

# Install dependencies
POL_Call POL_Install_atmlib
POL_Call POL_Install_corefonts
POL_Call POL_Install_FontsSmoothRGB
POL_Call POL_Install_gdiplus

#POL_Call POL_Install_gecko
POL_SetupWindow_InstallMethod "LOCAL,DOWNLOAD"
 
if [ "$INSTALL_METHOD" = "LOCAL" ]
then
    POL_SetupWindow_browse "Please select the SketchUp install program." "$TITLE"
    POL_SetupWindow_wait "Installation in progress..." "$TITLE"
    INSTALLER="$APP_ANSWER"
elif [ "$INSTALL_METHOD" = "DOWNLOAD" ]
then
    cd "$POL_System_TmpDir"
    #DOWNLOAD_LINK="http://dl.google.com/sketchup/GoogleSketchUpWEN.exe"
    DOWNLOAD_LINK="https://download.flexnetoperations.com/439214/1540/167/12522167/SketchUpPro-2016-1-1450-80430-en-x86.exe?ftpRequestID=5903717297&server=download.flexnetoperations.com&dtm=DTM20180401153437NTY0ODI2NzI1&authparam=1522622077_b8b653d9287042066998675df5164922&ext=.exe"
    #DOWNLOAD_LINK="https://download.flexnetoperations.com/439214/1540/687/12521687/sketchupmake-2017-2-2555-90782-en-x64.exe?ftpRequestID=5903717847&server=download.flexnetoperations.com&dtm=DTM20180401153441NDY5ODQ0NTYx&authparam=1522622082_caaf5b02d9e38cdac52fe0be15243f84&ext=.exe"
    cd "$POL_System_TmpDir"
    POL_SetupWindow_wait "Installation in progress..." "$TITLE"
    POL_Download "$DOWNLOAD_LINK" ""
    EXE_FILE="${DOWNLOAD_LINK##*/}"
    INSTALLER="$POL_System_TmpDir/CreativeCloudSet-Up.exe"
    cd "$HOME"
fi

POL_Wine_WaitBefore "$TITLE"
POL_Wine "$INSTALLER"
POL_Wine start /unix "$APP_ANSWER"
POL_Wine_WaitExit "$TITLE"

POL_SetupWindow_message "$(eval_gettext 'If you are using localised binary, you must
have the correct locale package installed.\n\n
If the Google SketchUp language differs from your desktop setting you
must prefix the launch by forcing your locale.\n
   - Go to : Configure > Google Sketchup (Shortcut) > Miscellaneous \n\n
   - Write and adapt the following line depending on your locale in the "Command to exec before running the program" field:\n\n
      export LANG=<set_your_locale_here>
')" "$TITLE" 
cat << EOF > "$POL_System_TmpDir/RegModif.reg"
[HKEY_CURRENT_USER\Software\Google\SketchUp8\GLConfig\Display]
"HW_OK"="1"
EOF
POL_Wine regedit "$POL_System_TmpDir/RegModif.reg"

POL_Wine_SetVideoDriver
POL_System_TmpDelete
POL_Shortcut "SketchUp.exe" "$TITLE" # "SketchUp.png"
#POL_Shortcut_InsertBeforeWine "$TITLE" "export LANG=$LOCALE" # Force localisation
POL_SetupWindow_Close
exit
