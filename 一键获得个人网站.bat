@echo off
chcp 65001 >nul
echo ================================
echo   瞿敏个人网站一键部署工具
echo   快速获得您的专属网址！
echo ================================
echo.

echo 🎯 选择部署方式：
echo.
echo [1] Gitee Pages（国内访问快，推荐）
echo [2] Vercel（国际化，自动部署）
echo [3] GitHub Pages（开发者首选）
echo [4] 全部部署（获得多个网址）
echo.
set /p choice=请输入选择 (1-4): 

if "%choice%"=="1" goto gitee
if "%choice%"=="2" goto vercel
if "%choice%"=="3" goto github
if "%choice%"=="4" goto all
goto invalid

:gitee
echo.
echo 🚀 正在部署到 Gitee Pages...
echo.

echo [步骤1] 构建项目...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ 构建失败
    pause
    exit /b 1
)

echo [步骤2] 推送到Gitee...
git config user.name "MINQU2000"
git config user.email "2217476349@qq.com"
git remote remove gitee 2>nul
git remote add gitee https://gitee.com/minqu2000/minqu-website.git

git add .
git commit -m "Deploy personal website"
git push gitee main

echo [步骤3] 部署Pages文件...
cd dist
git init
git config user.name "minqu2000"
git config user.email "2217476349@qq.com"
git add -A
git commit -m "deploy to gitee pages"
git push -f https://gitee.com/minqu2000/minqu-website.git HEAD:gh-pages
cd ..

echo.
echo ✅ Gitee 部署完成！
echo.
echo 🌐 您的个人网站地址：
echo https://minqu2000.gitee.io/minqu-website
echo.
echo 📋 后续步骤：
echo 1. 访问 https://gitee.com/minqu2000/minqu-website
echo 2. 点击 "服务" → "Gitee Pages"
echo 3. 选择分支: gh-pages
echo 4. 点击 "启动"
echo 5. 等待3分钟后访问您的网站
echo.
goto end

:vercel
echo.
echo 🌟 Vercel 部署指南：
echo.
echo 1. 访问 https://vercel.com
echo 2. 使用GitHub账号登录
echo 3. 点击 "New Project"
echo 4. 选择 MINQU-website 仓库
echo 5. 点击 "Deploy"
echo.
echo 🌐 您将获得网址：https://minqu-website.vercel.app
echo.
goto end

:github
echo.
echo 📱 正在部署到 GitHub Pages...
echo.

git config user.name "MINQU-2000"
git config user.email "2217476349@qq.com"
git remote remove github 2>nul
git remote add github https://github.com/MINQU-2000/MINQU-website.git

git add .
git commit -m "Deploy to GitHub Pages"
git push github main

echo.
echo ✅ GitHub 部署完成！
echo.
echo 🌐 您的个人网站地址：
echo https://minqu-2000.github.io/MINQU-website
echo.
echo 📋 后续步骤：
echo 1. 访问 GitHub 仓库设置
echo 2. 点击 "Pages"
echo 3. 选择 "GitHub Actions"
echo.
goto end

:all
echo.
echo 🚀 全平台部署中...
echo.
call :gitee
call :github
echo.
echo 🎉 全部部署完成！您现在拥有多个网址：
echo.
echo 🇨🇳 国内访问：https://minqu2000.gitee.io/minqu-website
echo 🌍 国际访问：https://minqu-2000.github.io/MINQU-website
echo 💫 Vercel：请手动部署到 https://vercel.com
echo.
goto end

:invalid
echo ❌ 无效选择，请重新运行脚本
pause
exit /b 1

:end
echo.
echo ================================
echo 🎉 恭喜！您的个人网站即将上线
echo ================================
echo.
echo 📱 移动端测试：
echo - 用手机访问上述网址
echo - 测试加载速度和响应式效果
echo.
echo 🔄 更新网站：
echo - 修改代码后重新运行此脚本
echo - 或使用 git push 命令
echo.
echo 📞 技术支持：2217476349@qq.com
echo.
pause 