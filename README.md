# Obs-Research-CLI

在终端中快速创建和管理 Obsidian 研究笔记。无需记忆复杂操作。

## 安装

```bash
git clone https://github.com/kkkevinky/obs-research-cli.git
cd obs-research-cli
bash install.sh
```

安装后重新打开终端，或运行 `source ~/.zshrc`。

## 快速开始

```bash
# 1. cd 至 Obsidian vault
cd ~/your-obsidian-vault

# 2. 初始化（只需一次）
obs init

# 3. 开始使用
obs quick "your idea"    # 零交互快速记录
obs bib <DOI>          # 用 DOI 自动创建文献笔记
obs lit                # 手动创建文献笔记
obs idea               # 记录研究想法
obs status             # 查看研究仪表盘
```

## 全部命令

### 笔记创建

| 命令 | 说明 |
|------|------|
| `obs quick "想法"` | 零交互快速记录，追加到今日 Inbox |
| `obs lit` | 交互式创建文献笔记 |
| `obs bib <DOI>` | 从 DOI 自动获取论文信息，生成文献笔记 |
| `obs idea` | 创建研究想法笔记 |
| `obs concept` | 创建概念卡片 |

### 查找与浏览

| 命令 | 说明 |
|------|------|
| `obs find` | 按 tag 或关键词搜索笔记 |
| `obs list` | 查看最近修改的 10 篇笔记 |
| `obs status` | 研究仪表盘：统计、待办、孤立笔记 |

### 知识整理

| 命令 | 说明 |
|------|------|
| `obs moc <tag>` | 自动生成某个 tag 的索引笔记 (Map of Content) |
| `obs links` | 扫描笔记，发现提到但没有 `[[链接]]` 的概念 |
| `obs export <tag>` | 导出文献为 Markdown |

### 初始化与帮助

| 命令 | 说明 |
|------|------|
| `obs init` | 首次使用时初始化 vault；已初始化时进入更新模式（项目/tag 管理） |
| `obs tag` | 管理 CLI 的 tag 列表：添加、删除、从 vault 自动同步 |
| `obs help` | help — show all commands and their purposes |

#### `obs tag` 同步流程

- 扫描 vault 所有笔记，提取 YAML frontmatter（`tags:` / `tag:` 三种格式）和正文里的 `#tag`
- **自动排除**：fenced 代码块、inline code、markdown 锚点链接（`](#anchor)`）里的 `#`
- **大小写不敏感去重**：`#Theta` 和 `#theta` 为同一个，保留首次出现的tag
- 展示发现的新 tag，支持按编号**剔除多余/误建的 tag**，最终由本人二次确认

## 典型工作流

```
读论文 → obs bib <DOI> → 自动创建笔记 → 在 Obsidian 中填写想法
有idea → obs quick "idea" → 零摩擦记录到 Inbox
写综述 → obs moc <tag> → 自动生成tag文献索引
查遗漏 → obs links → 发现没有链接的概念
导表格 → obs export perception → 生成文献对比表
```

## 自定义

### 模板

模板文件在 vault 的 `templates/` 目录中，直接在 Obsidian 里编辑即可。

### 配置

配置文件 `.obs-config` 在 vault 根目录：

```
VAULT_NAME=你的vault名称
FOLDERS=Literature,Project-1,Project-2,Concepts
TAGS=tag1,tag2,tag3
```

## 要求

- macOS 或 Linux（macOS 自带 `open`；Linux 需 `xdg-open`）
- Bash 3.2+（macOS 自带）
- Python 3（`obs bib` / `obs init` / `obs tag` 用到，macOS 自带）
- curl（`obs bib` 查 Crossref 用，macOS 自带）
- [Obsidian](https://obsidian.md)

## 写笔记的小技巧

用双括号 `[[concept]]`包裹重要概念 （例如 `[[concept name]]`）。Obsidian 会自动追踪所有引用，随着笔记积累，知识网络会自然形成。

## License

MIT
