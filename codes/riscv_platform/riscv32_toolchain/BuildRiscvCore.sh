#!/bin/bash -f
#------------------------------------------------------
# Copyright (c) 2024 by Ando Ki
#------------------------------------------------------
# VERSION: 2024.08.20.
#------------------------------------------------------
# verbose: verbose mode when 1
#------------------------------------------------------
SHELL=/bin/bash
verbose=0
#PREFIX=/opt/riscv
PREFIX=${HOME}/riscv
HOST=riscv32-unknown-elf
ARCH=rv32im
MULTI=0   # to check $ riscv32-unknown-elf-gcc --print-multi-lib
COMP=1
GDB=0
SIM=0
PK=0
BUILD=build
CLEAN=0
PREREQUISITES=0

#------------------------------------------------------
function help() {
   echo "Usage : $0 [options]"
   echo "            -prefix    prefix   (default directory: ${PREFIX})"
   echo "            -host      host     (default: ${HOST})"
   echo "            -arch      arch     (default isa: ${ARCH})"
   echo "            -multi     1|0      multilib (default: ${MULTI})"
   echo "            -compiler  1|0      build compiler (default: ${COMP})"
   echo "            -gdb       1|0      build gdb (default: ${GDB})"
   echo "            -simulator 1|0      build spike simulator (default: ${SIM})"
   echo "            -pk        1|0      build proxy kernel (default: ${PK})"
   echo "            -build     build    build directory (default: ${BUILD})"
   echo "            -clean     2|1|0    clean (default: ${CLEAN})"
   echo "                                2: remove all directories"
   echo "                                1: remove all build directories"
   echo "                                0: do nothing"
   echo "            -h/-?      printf help"
   echo "            -v         verbose mode on"
   echo ""
   echo "$0 -prefix ${PREFIX} -host ${HOST} -multi ${MULTI} -compiler 1 -simulator 1 -pk 1"
}

#------------------------------------------------------
function func_set_env_path() {
    if [ ! -n "${RISCV}" ]; then
        export RISCV=${PREFIX}
    fi
    if [ -n "${PATH}" ]; then
      if [[ "${PATH}" != *"${PREFIX}/bin"* ]]; then
          export PATH=${PREFIX}/bin:${PATH}
      fi
    else
      export PATH=${PREFIX}/bin
    fi
    if [ -n "${PATH}" ]; then
      if [[ "${PATH}" != *"${PREFIX}/${HOST}/bin"* ]]; then
          export PATH=${PREFIX}/${HOST}/bin:${PATH}
      fi
    else
      export PATH=${PREFIX}/${HOST}/bin
    fi
}

#------------------------------------------------------
function func_clear() {
    if [[ ${CLEAN} -eq 1 ]]; then
        if [[ -d $1/${BUILD} ]]; then
            /bin/rm -rf $1/${BUILD}
        fi
    elif [[ ${CLEAN} -eq 2 ]]; then
        if [[ -d $1 ]]; then
            /bin/rm -rf $1
        fi
    fi
}

#------------------------------------------------------
if [[ $# -eq 0 ]]; then
   help
   exit -1
fi

while [ "`echo $1|cut -c1`" = "-" ]; do
   case $1 in
      -prefix) shift
            if [ ! "$1" ]; then
               echo "-prefix need directory name"
               help
               exit -1
            fi
            PREFIX=$1
            ;;
      -host) shift
            if [ ! "$1" ]; then
               echo "-host need name"
               help
               exit -1
            fi
            HOST=$1
            ;;
      -arch) shift
            if [ ! "$1" ]; then
               echo "-arch need name"
               help
               exit -1
            fi
            ARCH=$1
            ;;
      -multi) shift
            if [ ! "$1" ]; then
               echo "-multi 1|0"
               help
               exit -1
            fi
            MULTI=$1
            ;;
      -compiler) shift
            if [ ! "$1" ]; then
               echo "-compiler 1|0"
               help
               exit -1
            fi
            COMP=$1
            ;;
      -gdb) shift
            if [ ! "$1" ]; then
               echo "-gdb 1|0"
               help
               exit -1
            fi
            GDB=$1
            ;;
      -simulator) shift
            if [ ! "$1" ]; then
               echo "-simulator 1|0"
               help
               exit -1
            fi
            SIM=$1
            ;;
      -pk) shift
            if [ ! "$1" ]; then
               echo "-pk 1|0"
               help
               exit -1
            fi
            PK=$1
            ;;
      -build) shift
            if [ ! "$1" ]; then
               echo "-build 1|0"
               help
               exit -1
            fi
            BUILD=$1
            ;;
      -clean) shift
            if [ ! "$1" ]; then
               echo "-clean 1|0"
               help
               exit -1
            fi
            CLEAN=$1
            ;;
      -h|-\?) help
              exit -1
              ;;
      -v)   verbose=1
            OPT="${OPT} $1"
            ;;
      *)
            echo "Unknown option: $1"
            help
            exit -1
            ;;
   esac
   shift
done

echo "verbose=${verbose}"
echo "PREFIX =${PREFIX}"
echo "HOST   =${HOST}"
echo "ARCH   =${ARCH}"
echo "MULTI  =${MULTI}"
echo "COMP   =${COMP}"
echo "GDB    =${GDB}"
echo "SIM    =${SIM}"
echo "PK     =${PK}"
echo "CLEAN  =${CLEAN}"

#------------------------------------------------------
if [[ ${PREREQUISITES} -eq 1 ]]; then
    sudo apt-get install autoconf automake autotools-dev\
                         curl python3 python3-pip libmpc-dev\
                         libmpfr-dev libgmp-dev gawk\
                         build-essential bison flex texinfo\
                         gperf libtool patchutils bc\
                         zlib1g-dev libexpat-dev ninja-build\
                         git cmake libglib2.0-dev libslirp-dev
    sudo apt-get install autoconf automake autotools-dev\
                         curl python3 libmpc-dev libmpfr-dev\
                         libgmp-dev gawk build-essential\
                         bison flex texinfo gperf libtool\
                         patchutils bc zlib1g-dev libexpat-dev
fi

#------------------------------------------------------
if [[ ${COMP} -eq 1 ]]; then
    func_clear riscv-gnu-toolchain

    git clone https://github.com/riscv/riscv-gnu-toolchain --branch 2024.08.06
    if [[ ! -d riscv-gnu-toolchain ]]; then
        echo "riscv-gnu-toolchain not created."
        exit -1
    fi

    pushd riscv-gnu-toolchain
    mkdir -p ${BUILD} && cd ${BUILD}
   #options="--prefix=${PREFIX} --with-arch=${ARCH} --with-sim=spike --disable-linux"
    options="--prefix=${PREFIX} --with-arch=${ARCH} --with-sim=spike"
    if [[ ${MULTI} -eq "1" ]]; then
        options="${options} --enable-multilib"
    fi
    if [[ ${GDB} -eq "0" ]]; then
        options="${options} --disable-gdb"
    fi
    ../configure ${options}
    make -j`nproc` newlib 2>&1 | tee build_riscv-gnu-toolchain.log
    retVal=$?
    if [[ $retVal -ne 0 ]]; then
        exit $retVal
    fi

   #if [[ ${SIM} -eq "1" ]]; then
   #    SIM=spike make -j`nproc` build-sim 2>&1 | tee build_spike.log
   #    if [ $retVal -ne 0 ]; then
   #        exit $retVal
   #    fi
   #fi

    popd
fi

#------------------------------------------------------
if [[ ${SIM} -eq "1" ]]; then
    func_clear riscv-isa-sim
   #func_set_env_path

    git clone https://github.com/riscv/riscv-isa-sim --branch v1.1.0
    if [[ ! -d riscv-isa-sim ]]; then
        echo "riscv-isa-sim not created."
        exit -1
    fi

    pushd riscv-isa-sim
    mkdir -p ${BUILD} && cd ${BUILD}
    ../configure --prefix=${PREFIX}
    make -j`nproc` 2>&1 | tee build_spike.log
    retVal=$?
    if [[ $retVal -ne 0 ]]; then
        exit $retVal
    fi

    make install 2>&1 | tee -a build_spike.log
    if [[ ! -f ${PREFIX}/bin/spike ]]; then
        echo "Could not find ${PREFIX}/bin/spike"
    fi
    popd
fi

#------------------------------------------------------
if [[ ${PK} -eq "1" ]]; then
    func_clear riscv-pk
    func_set_env_path

   #git clone https://github.com/riscv-software-src/riscv-pk --branch v1.0.0
    git clone https://github.com/riscv-software-src/riscv-pk
    if [[ ! -d riscv-pk ]]; then
        echo "riscv-pk not created."
        exit -1
    fi

    #------------------------------------------------
    pushd riscv-pk
    mkdir -p ${BUILD} && cd ${BUILD}
    ../configure --prefix=${PREFIX} --host=${HOST} --with-arch=${ARCH}
    make -j`nproc` 2>&1 | tee build_pk.log
    retVal=$?
    if [[ $retVal -ne 0 ]]; then
        exit $retVal
    fi
   #sudo PATH=${PATH} make install 2>&1 | tee -a build_pk.log
    make install 2>&1 | tee -a build_pk.log
    if [[ ! -f ${PREFIX}/${HOST}/bin/pk ]]; then
        echo "Could not find ${PREFIX}/${HOST}/bin/pk"
    fi
    popd

   #echo "========================"
   ##------------------------------------------------
   #pushd riscv-pk
   #mkdir -p build32 && cd build32
   #../configure --prefix=${PREFIX} --host=${HOST} --with-arch=rv32imafczicsr_zifencei
   #make -j`nproc` 2>&1 | tee build_pk.log
   #retVal=$?
   #if [[ $retVal -ne 0 ]]; then
   #    exit $retVal
   #fi
   #sudo PATH=${PATH} make install 2>&1 | tee -a build_pk.log
   #make install 2>&1 | tee -a build_pk.log
   #if [[ ! -f ${PREFIX}/${HOST}/bin/pk ]]; then
   #    echo "Could not find ${PREFIX}/${HOST}/bin/pk"
   #fi
   #popd
fi

#------------------------------------------------------
# Revision history:
#
# 2024.08.20: Started by Ando Ki (andoki@gmail.com)
#------------------------------------------------------
