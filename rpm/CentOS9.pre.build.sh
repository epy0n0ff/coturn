#!/bin/bash

# CentOS9 preparation script.

CPWD=`pwd`

. ./common.pre.build.sh

cd ${CPWD}

PACKS="libevent-devel mysql-devel sqlite sqlite-devel"
sudo yum -y install ${PACKS}
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
