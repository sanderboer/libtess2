#!/bin/bash
DIR="$( cd -P "$( dirname "$0" )" && pwd )"
TYPE=linux
SRC_DIR=${DIR}/Source
BUILD_DIR=${DIR}/build_${TYPE}
TOOLCHAIN=${DIR}/dist

[[ ! -e ${BUILD_DIR} ]] && mkdir -p ${BUILD_DIR}
[[ ! -e ${TOOLCHAIN} ]] && mkdir -p ${TOOLCHAIN}/{include,lib}

echo "---------------------------- building libtess linux --------------------------------"
echo "DIR          : ${DIR}"
echo "TYPE         : ${TYPE}"
echo "SRC_DIR      : ${SRC_DIR}"
echo "BUILD_DIR    : ${BUILD_DIR}"
echo "------------------------------------------------------------------------------------"


pushd ${BUILD_DIR}

gcc -I ../Include -c ../Source/*.c
ar rcs libtess2.a *.o
cp libtess2.a ${TOOLCHAIN}/lib/
cp ../Include/tesselator.h ${TOOLCHAIN}/include/
rm *.o

popd

