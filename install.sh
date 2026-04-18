#!/bin/bash
mkdir -p ~/.local/bin
cp "$(dirname "$0")/obs" ~/.local/bin/obs
chmod +x ~/.local/bin/obs
echo "✓ 安装完成"
echo ""
echo "如果命令找不到，请将以下行添加到 ~/.zshrc 或 ~/.bashrc："
echo '  export PATH="$HOME/.local/bin:$PATH"'
echo ""
echo "然后 cd 到你的 Obsidian vault 目录，运行 obs init 开始使用。"
