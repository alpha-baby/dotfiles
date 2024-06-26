echo "创建tmux配置文件软连接"
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local
# 判断是否正确执行
if [ $? -eq 0 ]; then
     echo "创建tmux配置文件软连接 成功"
else
     echo "创建tmux配置文件软连接 失败"
fi

echo "创建nvim配置文件软连接"
mkdir -p ~/.config/nvim/
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/
if [ $? -eq 0 ]; then
     echo "创建nvim配置文件软连接 成功"
else
     echo "创建nvim配置文件软连接 失败"
fi

echo "创建p10k配置文件软连接"
ln -sf ~/dotfiles/p10k.zsh ~/.p10k.zsh
if [ $? -eq 0 ]; then
     echo "创建p10k配置文件软连接 成功"
else
     echo "创建p10k配置文件软连接 失败"
fi

