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

## 安装oh-my-zsh

首先安装zsh

```bash
yum -y install zsh
```

下载 oh-my-zsh 项目来帮我们配置 zsh，采用wget安装(需要先安装git)

```bash
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```

**安装powerlevel10k主题**

```bash
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

切换zsh

```bash
sudo chsh -s /bin/zsh
```

首先下载 autojump 源码

```bash
git clone git://github.com/joelthelion/autojump.git
然后可安装或卸载
```


```bash
cd autojump
./install.py or ./uninstall.py
由于Linux 下 Shell 启动会自动读取 ~/.bashrc 文件，所以将下面一行添加到该文件中
```

```bash
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
```
然后，运行source ~/.bashrc即可。

安装完成后，使用查看autojump版本。

```bash
$ autojump --version
autojump release-v21.1.2
```

安装zinit

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

安装 tmux

// todo

安装neovim

https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-download

```bash
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim
# you might need python2-neovim as well on older Fedora releases
```

