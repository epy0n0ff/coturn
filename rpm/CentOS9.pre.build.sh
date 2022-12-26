#!/bin/bash

# CentOS9 preparation script.

CPWD=`pwd`

# Common preparation script.
. ./build.settings.sh

# DIRS

rm -rf ${BUILDDIR}

mkdir -p ${BUILDDIR}
mkdir -p ${BUILDDIR}/SOURCES
mkdir -p ${BUILDDIR}/SPECS
mkdir -p ${BUILDDIR}/RPMS
mkdir -p ${BUILDDIR}/tmp

# Common packs

PACKS="make gcc redhat-rpm-config rpm-build doxygen openssl-devel git wget"
sudo dnf -y install --enablerepo=crb ${PACKS}
ER=$?
if ! [ ${ER} -eq 0 ] ; then
    echo "Cannot install packages ${PACKS}"
    exit -1
fi


cd ${CPWD}

PACKS="libevent-devel mariadb-devel sqlite sqlite-devel"
sudo dnf -y install --enablerepo=crb ${PACKS}
ER=$?
if ! [ ${ER} -eq 0 ] ; then
    echo "Cannot install package(s) ${PACKS}"
    cd ${CPWD}
    exit -1
fi

# EPEL (for hiredis)

cd ${CPWD}
./epel9.install.sh
 
# Platform file

echo "CentOS9" > ${BUILDDIR}/platform

cp ${CPWD}/epel9.install.sh ${BUILDDIR}/install.sh

cd ${CPWD}
