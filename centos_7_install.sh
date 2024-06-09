#!/bin/zsh
echo "创建tmux配置文件软连接"
ln -s ~/dotfiles/tmux/linux/tmux.conf ~/.tmux.conf
# 判断是否正确执行
if [ $? -eq 0 ]; then
     echo "创建tmux配置文件软连接 成功"
else
     echo "创建tmux配置文件软连接 失败"
fi

if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
     ~/.tmux/plugins/tpm/bin/install_plugins
     echo "如果有插件安装失败，那么大概率是应为网络问题导致拉取 github 失败"
     echo "可以配置上代理后重试"
fi

echo "创建nvim配置文件软连接"
mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/
if [ $? -eq 0 ]; then
     echo "创建nvim配置文件软连接 成功"
else
     echo "创建nvim配置文件软连接 失败"
fi

# echo "创建p10k配置文件软连接"
# ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh
# if [ $? -eq 0 ]; then
#      echo "创建p10k配置文件软连接 成功"
# else
#      echo "创建p10k配置文件软连接 失败"
# fi

# 加载zsh配置
echo "source ~/dotfiles/zsh/load.zsh" >> ~/.zshrc