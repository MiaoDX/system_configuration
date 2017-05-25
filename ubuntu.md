# List of what have changed after a fresh install

* firefox (Chinese version), can synchronize between windows and linux.
* 搜狗拼音
* youdao
* [fonts](https://www.ostechnix.com/install-microsoft-windows-fonts-ubuntu-16-04/)
And [很简单的在Ubuntu系统下安装字体和切换默认字体的方法](https://my.oschina.net/itblog/blog/278566)

## ssh
``` vi
sudo apt-get install openssh-server
sudo ps -e | grep ssh
sudo service ssh start
```

## util

* vim
* git
* zsh & [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

set `oh-my-zsh` theme to `random` by change `~/.zshrc` file with `ZSH_THEME="random"`, since I have not find the prefer one to use.

## su

`$ sudo passwd` to set the `su` password

## subl Chinese support

[sublime-imfix](https://github.com/youngzhu/sublime-imfix.git)

As in [another blog](http://www.jianshu.com/p/bf05fb3a4709), we can just set a new `subl` (After copy .so int /opt/sublime_text):



``` vi
$ sudo vi /usr/bin/subl_cn

## copy these into subl_cn:
LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so /opt/sublime_text/sublime_text

$ sudo chmod +x subl_cn
```

And then, we can just use `sub_cn` to launch `sublime with chinese support`.


## Green VPN

[Ubuntu 设置 (OpenVPN方式)](https://www.getgreenjsq.me/shiyong/88.html)

`sudo apt-get install network-manager-gnome network-manager-pptp network-manager-openvpn`


## tmux

`sudo apt-get install tmux`

Want to find a `multi screen`, found `screen` and `tmux`, I don't think it's so good.

## terminator

`sudo apt-get install terminator`

Ugly, but what I want. ->

Customerize it, `right click -> preference -> Profiles -> Colors -> Build-in schemes -> choose 'WHAT_YOU_LIKE'`