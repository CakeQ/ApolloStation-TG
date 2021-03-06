#!/bin/bash

#nb: must be bash to support shopt globstar
set -e
shopt -s globstar

if [ "$BUILD_TOOLS" = false ]; then
    (! grep 'step_[xy]' _maps/**/*.dmm)
    source $HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}/byond/bin/byondsetup
	if [ "$BUILD_TESTING" = true ]; then
		tools/travis/dm.sh -DTRAVISBUILDING -M${DM_MAPFILE} $DME_NAME
	else
		tools/travis/dm.sh -DTRAVISBUILDING -DTRAVISTESTING -Mruntimestation $DME_NAME
	fi;
fi;
