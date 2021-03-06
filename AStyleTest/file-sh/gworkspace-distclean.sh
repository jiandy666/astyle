#!/bin/bash
# distclean gworkspace test files

# load library file
if [ -f libTYSP.sh ]; then source  libTYSP.sh
else  source  $HOME/bin/libTYSP.sh
fi

projdir=$HOME/Projects/TestData/GWorkspace

cd $projdir
if [ ! -d GWorkspace ]; then
	echo "GWorkspace not installed!"
	read -sn1 -p "Press Enter to end . . ."; echo; exit;
fi

# check for "source  /usr/share/GNUstep/Makefiles/GNUstep.sh" in profile
if [ -z $GNUSTEP_MAKEFILES ]; then
	echo "GNUstep.sh not sourced in profile!"
	read -sn1 -p "Press Enter to end . . ."; echo; exit;
fi

echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "*                      DIST cleaning gworkspace                       *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
if [ ! -f GNUmakefile ]; then
	echo "No file GNUmakefile"
	read -sn1 -p "Press Enter to end . . ."
	exit
fi

promptYESNO  "Do you want to distclean gworkspace" "y"
if [ ! $YESNO ] || [ $YESNO = "y" ]; then
    cd $projdir
    make  distclean
else
    echo "gworkspace not distcleaned"
fi

echo
read -sn1 -p "Press Enter to end . . ."
