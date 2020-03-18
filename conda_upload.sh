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
anaconda -t $CONDA_UPLOAD_TOKEN upload $CONDA_BLD_PATH/$OS/$PKG_NAME-`date +%Y.%m.%d`-0.tar.bz2 --force

