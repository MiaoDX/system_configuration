Maybe it's better to note `program` settings here.

## trabsmissionbt to use tju_pt

[ref:](https://github.com/transmission/transmission/wiki/Building-Transmission)

``` vi
$ sudo apt-get install build-essential automake autoconf libtool pkg-config intltool libcurl4-openssl-dev libglib2.0-dev libevent-dev libminiupnpc-dev libminiupnpc5 libappindicator-dev
```

then got:
``` vi
Package libminiupnpc5 is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source
However the following packages replace it:
  libminiupnpc-dev:i386 libminiupnpc-dev

E: Package 'libminiupnpc5' has no installation candidate
```

so change with libminiupnpc-dev


## openjdk-8

**Chances are that use openjdk can have some problems, but it's `openjdk`~~ **

[ref](http://ubuntuhandbook.org/index.php/2015/01/install-openjdk-8-ubuntu-14-04-12-04-lts/)

``` vi
$ sudo add-apt-repository ppa:openjdk-r/ppa
$ sudo apt-get update
$ sudo apt-get install openjdk-8-jdk
$ sudo update-alternatives --config java  # when we only have one java, this is not necessary.
$ sudo update-alternatives --config javac
$ java -version

```

## oracle Java

[how-to-install-java-with-apt-get-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04)

``` vi
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

## NVIDIA DRIVER AND CUDA

We will install both, the cuda and the driver.



[The official installation guide is excellent!!](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/), and I highly suggest the [package-manager-installation](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#package-manager-installation) way, since it's clear and no pain.

Fill the blanks in [https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads), and download the file (the **`deb`** one!!!).

``` vi
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
```

And that's it, no black window stuff. Oh, and `reboot` is necessary.

When `make` the examples, we will encounter something like 

``` vi
collect2: error: ld returned 1 exit status

Makefile:381: recipe for target 'cudaDecodeGL' failed

make[1]: *** [cudaDecodeGL] Error 1
```


And [the answer to failure-in-running-cuda-sample-after-cuda-8-0-installation is straightforward](https://askubuntu.com/questions/891003/failure-in-running-cuda-sample-after-cuda-8-0-installation)

>The makefiles of the samples have wrong nvidia-xxx version numbers. Substitute them with: sed -i "s/nvidia-367/nvidia-375/g" `grep "nvidia-367" -r ./ -l` and try to make again.

So just type fellowing command under `NVIDIA_CUDA-8.0_Samples` folder:

``` vi
sed -i "s/nvidia-367/nvidia-375/g" `grep "nvidia-367" -r ./ -l`
```

There is another blog seem nice, except the separate installation of Nvidia driver and Cuda is totally unnecessary!!

[ref4,  Ubuntu14.04 + Nvidia Cuda8.0 + Caffe ](http://blog.csdn.net/yan_song_/article/details/53154611)

To check our installation (except building the examples):

``` vi
$ lspci -vnn | grep -i VGA -A 12
$ glxinfo | grep OpenGL | grep renderer
$ nvidia-smi
$ glxgears
```


No matter how you did it and find that you just cannot enter the system (no matter it's a black screen or just login again and again but won't login), Or, you want to reinstall the cuda or nvidia driver, besides the [official uninstall instruction](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#handle-uninstallation):

`Ctrl+Alt+F1` and [remove all corresponding settings:ubuntu 12.04 安装 nvidia 显卡驱动后无法进入图形界面的解决办法](http://blog.csdn.net/dxuehui/article/details/45874693):

``` vi
$ sudo apt-get --purge remove nvidia-*
$ sudo apt-get --purge remove xserver-xorg-video-nouveau
$ sudo rm ~/.Xauthority
$ sudo reboot
```

And install again, not so hard if use `deb` way.

## cudnn

[How to verify CuDNN installation?](https://stackoverflow.com/questions/31326015/how-to-verify-cudnn-installation)

``` vi
$ cd folder/extracted/contents
$ sudo cp include/cudnn.h /usr/local/cuda/include
$ sudo cp lib64/libcudnn* /usr/local/cuda/lib64
$ sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
```

And [official doc](http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html) is pretty straight forward.


## Nvidia docker

[NVIDIA/nvidia-docker](https://github.com/NVIDIA/nvidia-docker/wiki)

## Arch when building with cuda

[matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/](http://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/)

## opencv for python

[pyimagesearch guide](http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/)

I really want to not build from source, but the default `conda` will have trouble when show the image. Luckily, there is an wonder project called [menpo](http://www.menpo.org/)

>The Python framework for deformable modelling

It have several conda repos and especially the [opencv3 one ](https://anaconda.org/menpo/opencv3), use it really seems nice.

### possible problems

* `GLib-GIO-Message: Using the 'memory' GSettings backend.  Your settings will not be saved or shared with other applications.`

It seems not influence us too much. If that annoys you, checkout [my-dconf-gsettings-installation-is-broken-how-can-i-fix-it-without-ubuntu-reins](https://askubuntu.com/questions/558446/my-dconf-gsettings-installation-is-broken-how-can-i-fix-it-without-ubuntu-reins). [NOT TESTED]

* version `GLIBCXX_3.4.21' not found 

[According to the answer of libstdc++.so.6: version `GLIBCXX_3.4.21' not found](https://github.com/BVLC/caffe/issues/4953), just `conda install libgcc`

## ipython/jupyter notebook

For python2.7, this is a known issue:

``` vi
 File "/home/miao/py_env/conda_env/ALL_cv2_py27/lib/python2.7/site-packages/IPython/utils/terminal.py", line 22, in <module>
    from backports.shutil_get_terminal_size import get_terminal_size as _get_terminal_size
ImportError: No module named shutil_get_terminal_size
```

The isolated solution will be [ipython-console-cant-locate-backports-shutil-get-terminal-size-and-wont-load](https://stackoverflow.com/questions/37232446/ipython-console-cant-locate-backports-shutil-get-terminal-size-and-wont-load)

``` vi
conda install -c conda-forge backports.shutil_get_terminal_size
```
## ROS

[Follow the offical website](http://wiki.ros.org/indigo/Installation/Ubuntu)

Note, for possible speed up, use [USTC (China) mirror](http://wiki.ros.org/ROS/Installation/UbuntuMirrors)

## SLAM

[LSD-SLAM 编译过程（Ubuntu 14.04 + ROS Indigo）](http://blog.csdn.net/xueyinhualuo/article/details/48490939), nice artical.

[LSD_SLAM](https://github.com/tum-vision/lsd_slam)

First build, failed:

``` vi
  [rosbuild] Building package lsd_slam_viewer
  Failed to invoke /opt/ros/indigo/bin/rospack deps-manifests lsd_slam_viewer
  [rospack] Error: the rosdep view is empty: call 'sudo rosdep init' and 'rosdep update'
```

This error msg is clear enough, just call 'sudo rosdep init' and 'rosdep update' to resolve it.


Again, fialed, cannot link `-lGL`, `ls /usr/lib | grep GL` only find `libGL.so.1` and doesn't have `libGL.so`. And in the `/usr/lib32`, a `libGL.so` exists. So, it should be the Nvidia GPU's problem.

Just `sudo copy libGL.so.1 libGL.so` solve this problem, it's ugly.

## Docker

[reference:gym-unrealcv](https://github.com/zfw1226/gym-unrealcv)

``` vi
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
```

After installation, please note:

``` vi
If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:

  sudo usermod -aG docker miao

Remember that you will have to log out and back in for this to take effect!
```

And it is what we really need (of course, your output should your user name), if it's possible, we shall keep away from `sudo` as much as possible !!
