# 瞿敏个人简历网站 - Vercel部署指南

## 🌟 为什么选择Vercel？

- ✅ **免费部署** - 个人项目完全免费
- ✅ **自动部署** - 推送代码自动更新网站
- ✅ **全球CDN** - 访问速度极快
- ✅ **自定义域名** - 支持绑定自己的域名
- ✅ **HTTPS** - 自动配置SSL证书

## 🚀 部署步骤

### 方法一：网页部署（推荐）

#### 1. 访问Vercel官网
打开 [https://vercel.com/](https://vercel.com/)

#### 2. 注册/登录账号
- 点击 "Sign Up" 或 "Login"
- **推荐使用GitHub账号登录**，这样可以直接访问您的仓库

#### 3. 创建新项目
1. 登录后点击 "New Project" 按钮
2. 在 "Import Git Repository" 部分找到 `MINQU-website`
3. 点击仓库右侧的 "Import" 按钮

#### 4. 配置项目设置
Vercel会自动检测到这是一个Vue.js项目，默认配置通常是正确的：

- **Framework Preset**: Vite
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm install`

#### 5. 部署
点击 "Deploy" 按钮，等待部署完成（通常1-3分钟）

#### 6. 获取网站地址
部署成功后，您将获得一个类似这样的地址：
```
https://minqu-website-xxx.vercel.app
```

### 方法二：命令行部署

#### 1. 安装Vercel CLI
```bash
npm install -g vercel
```

#### 2. 登录Vercel
```bash
vercel login
```

#### 3. 部署项目
在项目根目录执行：
```bash
vercel
```

按照提示完成配置即可。

## 🔧 自定义配置

### 自定义域名
1. 在Vercel项目设置中点击 "Domains"
2. 添加您的自定义域名
3. 按照提示配置DNS记录

### 环境变量
如果项目需要环境变量：
1. 在项目设置中点击 "Environment Variables"
2. 添加所需的环境变量

## 🔄 自动部署

配置完成后，每次您推送代码到GitHub的main分支，Vercel都会自动：
1. 检测到代码更改
2. 自动构建项目
3. 部署到生产环境
4. 发送部署通知

## 📊 部署状态监控

在Vercel控制台中，您可以：
- 查看部署历史
- 监控网站性能
- 查看访问统计
- 管理域名和SSL证书

## 🌐 预期结果

部署成功后，您的网站特性：
- ✅ 全球CDN加速，访问速度极快
- ✅ 自动HTTPS加密
- ✅ 移动端完美适配
- ✅ 现代化UI设计展示
- ✅ 个人简历完整呈现

## 🎯 网站地址示例

部署完成后，您的网站将类似：
```
https://minqu-website.vercel.app
或
https://minqu-2000-website.vercel.app
```

## ⚠️ 常见问题

### 问题1：构建失败
**解决方案**：
- 检查package.json中的依赖
- 确保本地可以正常运行 `npm run build`

### 问题2：页面空白
**解决方案**：
- 检查vite.config.js中的base路径配置
- 确保设置为 `base: '/'`

### 问题3：路由404错误
**解决方案**：
- 确保vercel.json配置正确
- 检查路由重写规则

## 📞 技术支持

如果遇到问题：
1. 查看Vercel部署日志
2. 检查项目配置
3. 联系技术支持：2217476349@qq.com

---

**项目作者**: 瞿敏  
**部署平台**: Vercel  
**最后更新**: 2024年12月 