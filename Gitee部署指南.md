# 🚀 Gitee Pages 部署指南

## 🎯 您的仓库信息
- **Gitee仓库**: https://gitee.com/minqu2000/minqu-website
- **用户名**: minqu2000
- **预期访问地址**: https://minqu2000.gitee.io/minqu-website

## 📋 部署步骤

### 方法1：自动部署（推荐）
1. **双击运行**: `部署到gitee.bat`
2. **等待完成**: 脚本会自动构建和部署
3. **启用Pages**: 按照脚本提示操作

### 方法2：手动部署
如果自动脚本失败，请按以下步骤手动操作：

#### 第1步：构建项目
```bash
npm run build
```

#### 第2步：配置Git远程仓库
```bash
git remote add gitee https://gitee.com/minqu2000/minqu-website.git
```

#### 第3步：推送源代码
```bash
git add .
git commit -m "部署到Gitee Pages"
git push gitee main
```

#### 第4步：部署构建文件
```bash
cd dist
git init
git add -A
git commit -m "deploy to gitee pages"
git push -f https://gitee.com/minqu2000/minqu-website.git main:gh-pages
cd ..
```

## 🔧 启用Gitee Pages服务

### 在Gitee网站上操作：
1. **访问仓库**: https://gitee.com/minqu2000/minqu-website
2. **点击"服务"**: 在仓库页面顶部菜单
3. **选择"Gitee Pages"**: 在服务列表中
4. **配置Pages**:
   - 分支选择: `gh-pages`
   - 目录选择: `/` (根目录)
   - 点击"启动"按钮
5. **等待部署**: 通常需要1-3分钟

## 📱 测试访问

### 桌面端测试
访问: https://minqu2000.gitee.io/minqu-website

### 移动端测试（关键）
1. **在手机上访问**: https://minqu2000.gitee.io/minqu-website
2. **无需VPN**: 国内直接访问
3. **测试功能**: 确保所有功能正常

## ✅ 成功标志

如果部署成功，您应该能够：
- ✅ 在桌面端正常访问网站
- ✅ 在移动端无需VPN访问网站
- ✅ 网站功能完全正常
- ✅ 加载速度快（国内CDN）

## 🔄 更新网站

当您修改代码后：
1. **重新运行**: `部署到gitee.bat`
2. **或手动执行**: 上述手动部署步骤
3. **等待更新**: Gitee Pages会自动更新

## 🆘 故障排除

### 如果部署失败：
1. **检查网络**: 确保能访问Gitee
2. **检查仓库**: 确认仓库存在且为公开
3. **重新尝试**: 运行部署脚本

### 如果Pages无法访问：
1. **等待时间**: 首次启用需要几分钟
2. **检查分支**: 确认选择了gh-pages分支
3. **检查状态**: 在Gitee Pages设置中查看状态

### 如果移动端仍无法访问：
1. **清除缓存**: 清除手机浏览器缓存
2. **尝试不同浏览器**: Chrome、Safari、Firefox
3. **检查网络**: 尝试不同的网络环境

## 🎯 预期结果

完成部署后：
- **桌面端**: 继续使用Vercel版本（需VPN）
- **移动端**: 使用Gitee版本（无需VPN）
- **双重保障**: 两个平台同时可用

---

**立即行动**: 双击运行 `部署到gitee.bat` 开始部署！ 