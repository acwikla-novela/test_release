#!/bin/bash

export PKG_NAME=test_release
export VERSION=0.0.001
# ToDo Version from script make_relase_github

conda config --set anaconda_upload no
export ANACONDA_API_TOKEN=$CONDA_UPLOAD_TOKEN

echo "Building conda package..."
conda build .
export CONDA_BUILD_PATH=/home/travis/miniconda/envs/test-environment/conda-bld

echo "Converting conda package..."
#conda convert --platform all $CONDA_BUILD_PATH/linux-64/***.tar.bz2 --output-dir $CONDA_BUILD_PATH
conda convert --platform {osx-64,linux-32,linux-64,win-32,win-64} $CONDA_BUILD_PATH/linux-64/***.tar.bz2 --output-dir $CONDA_BUILD_PATH
#conda convert --platform {osx-64, linux-32, linux-64, win-32, win-64} $CONDA_BUILD_PATH/linux-64/***.tar.bz2 --output-dir $CONDA_BUILD_PATH
#conda convert --platform osx-64,linux-32,linux-64,win-32,win-64 $CONDA_BUILD_PATH/linux-64/***.tar.bz2 --output-dir $CONDA_BUILD_PATH
#conda convert --platform osx-64, linux-32, linux-64, win-32, win-64 $CONDA_BUILD_PATH/linux-64/***.tar.bz2 --output-dir $CONDA_BUILD_PATH

echo "Deploying to Anaconda.org..."
anaconda upload $CONDA_BUILD_PATH/**/test_release-*.tar.bz2 --force