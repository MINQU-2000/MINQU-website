# 瞿敏个人简历网站 - GitHub部署指南

## 📋 部署步骤

### 1. 准备工作

确保您已经：
- 安装了Git
- 有GitHub账号
- 项目已经在本地完成开发

### 2. 创建GitHub仓库

1. 登录GitHub
2. 点击右上角的 "+" 号，选择 "New repository"
3. 仓库名称填写：`MINQU-website`
4. 设置为Public（公开）
5. 不要勾选"Add a README file"（因为本地已有）
6. 点击"Create repository"

### 3. 本地Git配置

打开命令行，在项目根目录执行：

```bash
# 初始化Git仓库（如果还没有）
git init

# 添加所有文件
git add .

# 提交更改
git commit -m "初始提交：瞿敏个人简历网站"

# 添加远程仓库
git remote add origin https://github.com/MINQU-2000/MINQU-website.git

# 推送到GitHub
git branch -M main
git push -u origin main
```

### 4. 配置GitHub Pages

1. 进入您的GitHub仓库页面
2. 点击 "Settings" 选项卡
3. 在左侧菜单中找到 "Pages"
4. 在 "Source" 部分选择 "GitHub Actions"
5. 保存设置

### 5. 自动部署

项目已经配置了GitHub Actions，当您推送代码到main分支时会自动：
- 安装依赖
- 构建项目
- 部署到GitHub Pages

### 6. 访问网站

部署完成后，您的网站将在以下地址可用：
```
https://minqu-2000.github.io/MINQU-website/
```

## 🔧 快速部署脚本

我们提供了一个自动化脚本 `deploy-github.bat`，双击运行即可完成大部分部署步骤。

## 📝 更新网站

当您需要更新网站内容时：

```bash
# 添加更改
git add .

# 提交更改
git commit -m "更新网站内容"

# 推送到GitHub
git push
```

GitHub Actions会自动重新构建和部署您的网站。

## 🚀 项目特性

- ✅ 响应式设计，支持各种设备
- ✅ 现代化UI设计，深色科技风格
- ✅ 自动化部署，推送即更新
- ✅ 快速加载，优化的构建配置
- ✅ SEO友好的结构

## 📞 技术支持

如果在部署过程中遇到问题，请检查：
1. Git是否正确安装
2. GitHub仓库权限设置
3. GitHub Actions是否正常运行
4. 网络连接是否稳定

---

**项目作者**: 瞿敏  
**技术栈**: Vue.js 3 + Vite + SCSS  
**部署平台**: GitHub Pages 