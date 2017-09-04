---
title: Install OpenCV once for all
date: 2017-09-04 23:00:00
tags:
  - opencv
---

I once wrote a blog shows how to [install OpenCV in windows 10 with vs2015](https://miaodx.github.io/2017/02/26/blogs/opencv/How_to_install_opencv_in_WINDOWS/), that one is good enough for ordinary usage, however, recently I am trying to compile some libraries (SfM module in OpenCV) needs some additional libraries -- GLOGS, GFLAGS and VTK, suitesparse and Ceres, etc. And the CUDA support is another option. So, there can be many many ways to build this libraries. If we specify all the necessary variables in each and every build configuration, we will definitely loose our mind and that's surely error prone. So, here this blog is -- install OpenCV **ONCE FOR ALL**.


# Mechanism

`cmake-gui` will make our change of variables in cmake with ease, however, the need to change the variables manually will be not so good, so, it is better we can do something like:

``` vi
source configure_for_build.sh
Open *.sln & BUILD & INSTALL
```

So, the magic all happens in the `configure_for_build.sh` file. To be more specific, we are using `.bat` files in windows. We specify **ALL** necessary variables and way to run cmake in the `.bat` file, and run that file is all we need then. The problem is how can we make sure we have specified **ALL** needed variables, and the values are what we need? Quick answer, we do not know, if you want to build OpenCV with VTK support, you need to set `WITH_VTK=ON`, if you want to use CUDA, `WITH_CUDA=ON` is needed. So, there will be tons of potential configurations, so, all depends on you. I have already make some of the files to make things more easy. There are four files in [config_bat](config_bat) folder, the [`opencv_common.bat`](config_bat/opencv_common.bat) contains the common variables, like OpenCV source folder, PYTHON2/3_PATH, opencv_contrib module dir and some CMAKE_PARAMS, the [`opencv_minimal.bat`](config_bat/opencv_minimal.bat) contains the minimal configuration for OpenCV -- no CUDA support, no SfM module, with python2/3  and matlab binding. And other files are pretty self-explained.

# Step by step tutorial

[TODO]