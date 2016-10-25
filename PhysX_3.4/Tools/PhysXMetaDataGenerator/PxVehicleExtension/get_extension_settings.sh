#!/bin/bash

SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! "$SDK_ROOT" ]; then
	sdk_root=$SCRIPT_DIR;
	while [ ! -e $sdk_root"/Source" ]; do
			sdk_root="$sdk_root""/.."
	done
	export SDK_ROOT="$sdk_root"
fi

source "$SDK_ROOT/Tools/PhysXMetaDataGenerator/get_common_settings.sh"

SRCPATH=PxVehicleExtensionAPI.h

if [ ! "$TARGETDIR" ]; then
  TARGETDIR="$SDK_ROOT/Source/PhysXVehicle/src/PhysXMetaData"
fi

TARGETNAME=PxVehicle

AUTOFILENAME1=$TARGETDIR/include/${TARGETNAME}AutoGeneratedMetaDataObjectNames.h
AUTOFILENAME2=$TARGETDIR/include/${TARGETNAME}AutoGeneratedMetaDataObjects.h
AUTOFILENAME3=$TARGETDIR/src/${TARGETNAME}AutoGeneratedMetaDataObjects.cpp

echo. 2>$AUTOFILENAME1
echo. 2>$AUTOFILENAME2
echo. 2>$AUTOFILENAME3

INCLUDES="$INCLUDES -I"$SDK_ROOT/Include/vehicle""
INCLUDES="$INCLUDES -I"$SDK_ROOT/Source/PhysXVehicle/src""
INCLUDES="$INCLUDES -I"$PX_SHARED/include/foundation""