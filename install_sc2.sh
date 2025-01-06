#!/bin/bash
# Install SC2 and add the custom maps

# Clone the source code.
#git clone git@github.com:tjuHaoXiaotian/pymarl3.git
export PYMARL3_CODE_DIR=$(pwd)

# 1. Install StarCraftII
echo 'Install StarCraftII...'
mkdir "$(pwd)/3rdparty"
export SC2PATH="$(pwd)/3rdparty/StarCraftII"
echo 'SC2PATH is set to '$SC2PATH
if [ ! -d $SC2PATH ]; then
        echo 'StarCraftII is not installed. Installing now ...';
        wget http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.10.zip
        unzip -P iagreetotheeula SC2.4.10.zip -d "$(pwd)/3rdparty"
        rm -f SC2.4.10.zip
else
        echo 'StarCraftII is already installed.'
fi

# 2. Install the custom maps

# Copy the maps to the target dir.
echo 'Install SMACV1 and SMACV2 maps...'
MAP_DIR="$SC2PATH/Maps/"
if [ ! -d "$MAP_DIR/SMAC_Maps" ]; then
    echo 'MAP_DIR is set to '$MAP_DIR
    if [ ! -d $MAP_DIR ]; then
            mkdir -p $MAP_DIR
    fi
    cp -r "$PYMARL3_CODE_DIR/src/envs/smac_v2/official/maps/SMAC_Maps" $MAP_DIR
else
    echo 'SMACV1 and SMACV2 maps are already installed.'
fi
echo 'StarCraft II and SMAC maps are installed.'