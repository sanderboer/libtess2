#!/bin/bash
#Dir of this file
FILEDIR="$( cd -P "$( dirname "$0" )" && pwd )"
BUILD=${FILEDIR}/build_example
SRC=${FILEDIR}/Example/example.c
TOOLCHAIN=${FILEDIR}/dist
[[ ! -e ${BUILD} ]] && mkdir -p ${BUILD}

GLFW=`pkg-config --static --libs glfw3`
clang++ $SRC \
	-Wno-deprecated \
	${FILEDIR}/Contrib/nanosvg.c \
	-L${TOOLCHAIN}/lib/ \
	-I${TOOLCHAIN}/include \
	-I${FILEDIR}/Contrib \
	-o ${BUILD}/example \
	-ltess2 -lGL $GLFW

