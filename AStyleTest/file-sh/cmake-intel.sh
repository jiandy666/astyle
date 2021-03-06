#!/bin/bash

# USE ONE OF THESE OPTIONS
opts=
# opts=-DCMAKE_VERBOSE_MAKEFILE=1
# opts="-DCMAKE_BUILD_TYPE=Debug  -DCMAKE_VERBOSE_MAKEFILE=1"
# opts=-DCMAKE_BUILD_TYPE="MinSizeRel"
# echo $opts

# Executable
echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "*                AStyle Intel Executable                *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
cd  "$HOME/Projects/AStyle"
rm --recursive --force  as-intel
mkdir  --parents  as-intel
cd  as-intel
CXX=icpc  cmake  $opts   ../
make

# So
echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "*                    AStyle Intel So                    *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
cd  "$HOME/Projects/AStyle"
rm --recursive --force  as-intel-so
mkdir  --parents  as-intel-so
cd  as-intel-so
CXX=icpc  cmake  -DBUILD_SHARED_LIBS=1  $opts   ../
make

# Java
echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "*                   AStyle Intel Java                   *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
cd  "$HOME/Projects/AStyle"
rm --recursive --force  as-intel-java
mkdir  as-intel-java
cd  as-intel-java
CXX=icpc  cmake  -DBUILD_JAVA_LIBS=1  $opts   ../
make

# Static
echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "*                  AStyle Intel Static                  *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
cd  "$HOME/Projects/AStyle"
rm --recursive --force  as-intel-a
mkdir  --parents  as-intel-a
cd  as-intel-a
CXX=icpc  cmake  -DBUILD_STATIC_LIBS=1  $opts   ../
make

copy=true
if [ "$copy" = "true" ]; then
	echo
	echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
	echo "*      Copy Release Files to AStyleDev for Testing      *"
	echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
	cd  "$HOME/Projects/AStyle"
	cp  -fpv --no-dereference  as-intel/astyle               ../AStyleDev/src-p/
	cp  -fpv --no-dereference  as-intel-so/libastyle.so*     ../AStyleDev/src-c/
	cp  -fpv --no-dereference  as-intel-so/libastyle.so*     ../AStyleDev/src-o/
	cp  -fpv --no-dereference  as-intel-so/libastyle.so*     ../AStyleDev/src-p/
	cp  -fpv --no-dereference  as-intel-so/libastyle.so*     ../AStyleDev/src-s/
	cp  -fpv --no-dereference  as-intel-so/libastyle.so*     ../AStyleDev/src-s2/
	cp  -fpv --no-dereference  as-intel-java/libastylej.so*  ../AStyleDev/src-j/
fi


echo
echo "* * * * * *  end of cmake  * * * * * *"
read -sn1 -p "Press any key to end . . ."
echo
