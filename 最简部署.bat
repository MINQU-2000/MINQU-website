@echo off
chcp 65001 >nul
echo ================================
echo   最简部署方案（跳过本地构建）
echo ================================
echo.

echo [1/3] 添加所有文件到Git...
git add .

echo.
echo [2/3] 提交更改...
git commit -m "修复构建配置，优化部署流程"

echo.
echo [3/3] 推送到GitHub...
git push origin main

echo.
echo ================================
echo GitHub推送完成！
echo ================================
echo.
echo 🎯 下一步：使用Vercel网页部署
echo.
echo 1. 访问: https://vercel.com
echo 2. 使用GitHub账号登录
echo 3. 点击 "New Project"
echo 4. 选择 "MINQU-website" 仓库
echo 5. 点击 "Deploy"
echo.
echo ✨ Vercel会自动：
echo   - 检测Vue.js项目
echo   - 安装依赖
echo   - 构建项目
echo   - 部署到CDN
echo.
echo 🌐 预期网站地址：
echo https://minqu-website-git-main-minqus-projects.vercel.app/
echo.
pause 