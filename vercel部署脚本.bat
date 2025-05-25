@echo off
chcp 65001 >nul
echo ================================
echo   瞿敏个人简历网站 - Vercel部署
echo ================================
echo.

echo [1/4] 推送代码到GitHub...
git add .
git commit -m "准备Vercel部署：瞿敏个人简历网站"
git push origin main

echo.
echo [2/4] 接下来请访问 Vercel 网站进行部署：
echo https://vercel.com/
echo.
echo [3/4] 部署步骤：
echo 1. 使用GitHub账号登录Vercel
echo 2. 点击 "New Project"
echo 3. 选择 MINQU-website 仓库
echo 4. 点击 "Deploy"
echo.
echo [4/4] 部署完成后，您将获得一个 .vercel.app 域名
echo.
echo ================================
echo 准备完成！请访问 Vercel 继续部署
echo ================================
pause 