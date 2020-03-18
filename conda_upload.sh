#!/bin/bash

# Only need to change these two variables
PKG_NAME=test_release
USER=acwikla-novela

OS=linux-64

mkdir ~/conda-bld
conda config --set anaconda_upload no
export CONDA_BLD_PATH=~/conda-bld
export VERSION=`date +%Y.%m.%d`
conda build .
#ToDO Change date to version
ls $CONDA_BLD_PATH
echo "Converting conda package..."
conda convert --platform all $CONDA_BLD_PATH/linux-64/$PKG_NAME-*.tar.bz2 --output-dir $CONDA_BLD_PATH/
ls $CONDA_BLD_PATH

echo "Deploying to Anaconda.org..."
anaconda -t $CONDA_UPLOAD_TOKEN upload $CONDA_BLD_PATH/**/$PKG_NAME-*.tar.bz2 --force