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

## NVIDIA DRIVER

[ref](http://cn.download.nvidia.com/XFree86/Linux-x86_64/375.20/README/installdriver.html)

To install it, should have no `graphic applications`.


It seems not so easy, so searched find a proper ppa:

* [ref1](http://askubuntu.com/questions/838959/ubuntu-nvidia-drivers-vs-nvidia-drivers-from-the-website)
* [ref2](http://www.webupd8.org/2016/06/how-to-install-latest-nvidia-drivers-in.html)

* [ref3, just to make sure we installed ok](http://www.binarytides.com/install-nvidia-drivers-ubuntu-14-04/), this file provide another ppa.

$ lspci -vnn | grep -i VGA -A 12
$ glxinfo | grep OpenGL | grep renderer

### When I first do it, failed, and cannot enter the system via `graphic loginn`.

So `Ctrl+Alt+F1` and [remove all corresponding settings](ubuntu 12.04安装nvidia显卡驱动后无法进入图形界面的解决办法):

``` vi
$ sudo apt-get --purge remove nvidia-*
$ sudo apt-get --purge remove xserver-xorg-video-nouveau
$ sudo rm ~/.Xauthority
$ sudo reboot
```


So [back to command line](http://blog.csdn.net/bxd1314/article/details/47302759):

``` vi
# remove all things as above
sudo init 3(Ctrl+Alt+F3)
sudo /etc/init.d/lightdm stop # 退出x界面进入命令行控制台

./NVIDIA-Linux-x86_64-352.30.run
sudo /etc/init.d/lightdm start #  启动x界面
```

And succeed.




## ROS

## SLAM
