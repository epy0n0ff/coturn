#!/bin/bash

# Common settings script.

TURNVERSION=4.6.1
BUILDDIR=~/rpmbuild
ARCH=`uname -p`

WGETOPTIONS="--no-check-certificate"
RPMOPTIONS="-ivh --force"


