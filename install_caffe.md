# Caffe installation on server

Building caffe from source is not that easy and straightforward, especially when we do not have the privilege of installing packages on our server. Luckily, we have CONDA!!

Any problem can be solved by installing **PROPER** libraries by conda (at least in my situation), even the Cmake can be installed! We use [SeokjuLee/VPGNet](https://github.com/SeokjuLee/VPGNet) as one demo.

## python path

We create one fresh conda env at `/home/users/dongxu.miao/py_env/py36_dl_caffe_self`.

Change python path Makefile.config to:

``` vi
ANACONDA_HOME := /home/users/dongxu.miao/py_env/py36_dl_caffe_self
PYTHON_INCLUDE := $(ANACONDA_HOME)/include \
                 $(ANACONDA_HOME)/include/python3.6m \
                 $(ANACONDA_HOME)/lib/python3.6/site-packages/numpy/core/include \
```

And `PYTHON_LIB := $(ANACONDA_HOME)/lib`

## Necessary libs

After trying `make` we will get errors, just install the missed libs via conda:

And as said in [Errors including std::__cxx11 or [abi:cxx11] or Linux with Anaconda #1980](https://github.com/caffe2/caffe2/issues/1980), to make things easier, we will use libs from `conda-forge` directly, `conda install -c conda-forge`. (Or by adding `conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/` twice, make sure it is at the top of the search)

``` vi
numpy protobuf blas hdf5 leveldb lmdb opencv

cudatoolkit=8.0 # for cuda version, and conda search LIB_NAME can find all possible versions of lib

scikit-image

boost # for python binding

conda update numpy opencv # repair incompatible libs by installing scikit-image
```

~~And when install blas, openblas will also installed automatically, but this will case error like `_gfortran_etime@GFORTRAN_7`, we should manually delete the openblas lib from path (`/home/users/dongxu.miao/py_env/py36_dl_caffe_self/lib` here) by `rm libopenblas*`.~~ (Not so sure why, this is not necessary when I did a fresh installation with all libs from conda-forge)

Before running, `export LD_LIBRARY_PATH=/home/users/dongxu.miao/py_env/py36_dl_caffe_self/lib:$LD_LIBARY_PATH` to make sure that the libs can be founded.

And do not forget to `make py` for python binding..

## TEST

``` vi
./build/tools/caffe device_query -gpu all
```
