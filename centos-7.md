# centos 7开发环境配置

使用linux系统主要多是使用一些命令行工具，这里记录一下centos7安装配置一些命令行工具

首先要保证一些初始化的工作已经做完了，启动包含如下几个事情：

## contos7 最小化安装后配置

### 配置网络

**查看网卡：**

```bash
ip addr
```

**修改网络配置文件**

```bash
vi /etc/sysconfig/network-scripts/ifcfg-enp33
```

```
BOOTPROTO=dhcp
ONBOOT=yes
```

**重启网络服务**

```bash
servicer network restart
```

**静态ip设置，修改ifcfg文件**: `/etc/sysconfig/network-scripts/ifcfg-enp33：`

```
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.7.106 　　#静态IP  
GATEWAY=192.168.7.1 　　#默认网关  
NETMASK=255.255.255.0　　 #子网掩码  
DNS1=192.168.7.1　　 #DNS 配置
```

**DHCP状态下查看网关地址：**

```bash
netstat -rn
route -n
ip route show
```

### sshd 服务

我们可以使用如下命令来查看sshd服务的状态：

```bash
systemctl status sshd
```

如果提示没有ssh服务可以用如下命令来安装：

```bash
yum install -y openssl openssh-server
```

如果sshd服务没有启动，我们可以用如下命令来启动

```bash
systemctl status sshd
```

### 安装ifconfig

最小化安装CentOS7后，想查看我的IP，发现 ifconfig命令不存在。

在最小化的CentOS7中，查看网卡信息

```bash
ip addr  
```

ifconfig命令依赖于net-tools，如果需要可以用如下命令来安装。

```bash
yum install -y net-tools  
```

### 关闭防火墙

```bash
systemctl stop firewalld  
systemctl disable firewalld  
```

### selinux

```bash
setenforce 0  
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config  
```

### 安装wget

```bash
yum install -y wget  
```

### 更换yum源

备份系统旧配置文件

```bash
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak  
```

获取yum配置文件到/etc/yum.repos.d/

```bash
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
```

更新缓存

```bash
yum clean all  
yum makecache  
```

### 安装unzip

```bash
yum install -y unzip  
```

### 安装git

```bash
yum install -y git
```

### 安装命令自动补全

Centos7在使用最小化安装的时候，没有安装自动补全的包，需要自己手动安装。

```bash
yum install -y  bash-completion  
```

安装好后，重新登陆即可（刷新bash环境）

### 复制公钥到远程主机

```bash
ssh-keygen -t rsa  
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.2 #复制公钥到远程主机  
```

> 参考 https://blog.csdn.net/weixin_42000303/article/details/106027827

## 安装网络代理工具 clash

https://blog.zzsqwq.cn/posts/how-to-use-clash-on-linux/

https://github.com/haishanh/yacd

## golang 安装

**安装golang 多版本工具**

```bash
curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
mv ~/bin/g /usr/local/bin/g
```

```bash
g ls-remote
g install 1.15.8
go version # check
```

## 安装 linuxbrew

[homebrew](https://brew.sh/)

```bash
# 安装依赖工具
sudo yum install epel-release
sudo make clen all
sudo makecache
sudo yum install procps-ng curl file git

# 从本镜像下载安装脚本并安装 Homebrew / Linuxbrew
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
/bin/bash brew-install/install.sh
rm -rf brew-install

# 也可从 GitHub 获取官方安装脚本安装 Homebrew / Linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

设置 homebrew 镜像，可以加速 homebrew 安装包

```bash
# 代理后更快：https_proxy
brew install lsd \
              btop \
              trash-cli \
              autojump \
              neovim \
              tmux \
              xclip \
              ranger

```

## 安装 pbcopy

在 ./tools 目录下


## neovim 安装

> 官网
> wiki https://github.com/neovim/neovim/wiki/Installing-Neovim
> 参考
> https://blog.csdn.net/liyelool/article/details/107895707

install

```bash
yum install -y python36-neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar zxvf nvim-linux64.tar.gz -C /usr/local/
rm -rf /usr/bin/nvim
ln -s /usr/local/nvim-linux64/bin/nvim /usr/bin/nvim
```

### 安装 neovim 插件管理器 vim-plug

https://github.com/junegunn/vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## 安装oh-my-zsh

首先安装zsh

> 参考 https://blog.csdn.net/weixin_42000303/article/details/106027827?utm_source=ld246.com

执行如下命令可以看到`zsh`的下载地址：

```bash
$ yum info zsh
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirrors.aliyun.com
 * extras: mirrors.aliyun.com
 * updates: mirrors.aliyun.com
Installed Packages
Name        : zsh
Arch        : x86_64
Version     : 5.0.2
Release     : 34.el7_8.2
Size        : 5.6 M
Repo        : installed
From repo   : base
Summary     : Powerful interactive shell
URL         : http://zsh.sourceforge.net/
License     : MIT
Description : The zsh shell is a command interpreter usable as an interactive login
            : shell and as a shell script command processor.  Zsh resembles the ksh
            : shell (the Korn shell), but includes many enhancements.  Zsh supports
            : command line editing, built-in spelling correction, programmable
            : command completion, shell functions (with autoloading), a history
            : mechanism, and more.
```

下载最新的zsh-5.8.tar.xz包，并上传到Linux系统中

```bash
# 安装依赖
yum -y install gcc perl-ExtUtils-MakeMaker
yum -y install ncurses-devel
# 编译安装
tar xvf zsh-5.9.tar.xz
cd zsh-5.9
./configure
make
sudo make install
# 将zsh加入/etc/shells
sudo vim /etc/shells # 添加：/usr/local/bin/zsh
```

下载 oh-my-zsh 项目来帮我们配置 zsh，采用wget安装(需要先安装git)

```bash
# 下载安装脚本
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# 执行安装脚本
sh install.sh
```

## 安装 zi (zsh 插件管理工具)

原 zinit 项目被作者直接删除了

https://sdl.moe/post/zsh-conf/

可参考博文作者的配置 https://gist.github.com/Colerar/64edef4633d2fcede456170d3bd2f67e

https://wiki.zshell.dev/zh-Hans/docs/getting_started/installation

## 安装exa 替换默认的ls(Deprecated)

> 参考 https://www.jianshu.com/p/3a31a90c3451

依赖安装

```bash
yum install gcc
wget http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz
tar zxf glibc-2.18.tar.gz 
cd glibc-2.18/
mkdir build && cd build/
../configure --prefix=/usr
make -j4 && make install
```

下载编译好的 `exa` 二进制文件，然后把 `exa` 放到对应的目录中，[官网](https://the.exa.website/)

切换zsh

```bash
sudo chsh -s /bin/zsh
```

## 拉取配置

```bash
git clone https://github.com/alpha-baby/dotfiles.git ~/dotfiles
# 进入nvim 安装插件
# :PlugInstall
```

## 安装中文支持

```
yum install kde-l10n-Chinese
```

执行对应系统的脚本

## nvm node.js

> 参考 https://github.com/nvm-sh/nvm#installing-and-updating

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
or
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

一些极限情况下如果不能使用 nvm 那么可以手动下载 nodejs 的 release 包，手动解压安装的方式。[nodejs下载地址](https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/)
