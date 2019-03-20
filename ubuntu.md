# Change rm behavior

Put below into `.profile`

``` vi
alias rm="echo Try Use 'mv' to specific paths, or the full path i.e. '/bin/rm'"
```

# List of what have changed after a fresh install

* firefox (Chinese version), can synchronize between windows and linux.
* 搜狗拼音 [Ubuntu16.04安装搜狗拼音输入法（中文输入法）](https://www.cnblogs.com/darklights/p/7722861.html)
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

Set `oh-my-zsh` theme to `random` by change `~/.zshrc` file with `ZSH_THEME="random"`, since I have not found the better one to use.

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


## tmux

`sudo apt-get install tmux`

Want to find a `multi screen`, found `screen` and `tmux`, I don't think it's so good.

## terminator

`sudo apt-get install terminator`

Ugly, but what I want. ->

Customerize it, `right click -> preference -> Profiles -> Colors -> Build-in schemes -> choose 'WHAT_YOU_LIKE'`

## f.lux

[the linux verison](https://justgetflux.com/linux.html)

## rabbitvcs

[The alternative tool of tortoisegit in windows for linux](http://rabbitvcs.org/)

When only need to install the `rabbitvcs-nautilus` and `rabbitvcs-cli` (others are also doing no harm), [installation instructions can be found at official website](http://wiki.rabbitvcs.org/wiki/install/ubuntu)

## Virtual console

The virtual console of ubuntu (`Ctrl+Alt+F(1-6)`, note, `F7` is GUI windows and `F8-12` will bring black window to us) seems not bad, a nice way to separate different console windows apart.

But the default console font is rather annoying, after some tweaking, we finally choose `UTF-8 -> Cuess optimal character set -> TerminusBold -> 11x22(framebuffer only)` after `sudo dpkg-reconfigure console-setup`. The font is acceptable.

Refer to [how-do-i-increase-the-text-size-of-the-text-on-a-console](https://askubuntu.com/questions/29328/how-do-i-increase-the-text-size-of-the-text-on-a-console) for some in-depth discussion.
