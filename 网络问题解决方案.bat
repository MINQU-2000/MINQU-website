@echo off
chcp 65001 >nul
echo ================================
echo   GitHub推送网络问题解决方案
echo ================================
echo.

echo 检测到推送失败：Connection was reset
echo 这通常是网络连接问题，以下是解决方案：
echo.

echo [方案1] 检查网络连接...
ping github.com -n 4

echo.
echo [方案2] 尝试使用SSH方式推送...
echo 检查是否已配置SSH密钥...
if exist "%USERPROFILE%\.ssh\id_rsa.pub" (
    echo ✅ 发现SSH密钥
    echo 尝试切换到SSH方式...
    git remote set-url origin git@github.com:MINQU-2000/MINQU-website.git
    echo 现在尝试推送...
    git push origin main
) else (
    echo ❌ 未找到SSH密钥
    echo 继续使用HTTPS方式...
)

echo.
echo [方案3] 重新配置远程仓库...
echo 当前远程仓库配置：
git remote -v

echo.
echo 重新设置远程仓库URL...
git remote set-url origin https://github.com/MINQU-2000/MINQU-website.git

echo.
echo [方案4] 尝试强制推送...
echo 添加所有文件...
git add .
git commit -m "修复构建配置，网络问题重新推送"

echo.
echo 尝试推送（可能需要等待）...
git push origin main --force-with-lease

if %errorlevel% equ 0 (
    echo.
    echo ✅ 推送成功！
    echo 现在可以访问 https://vercel.com 进行部署
) else (
    echo.
    echo ❌ 推送仍然失败
    echo 请尝试以下备用方案：
    echo.
    echo 1. 检查网络代理设置
    echo 2. 尝试使用手机热点
    echo 3. 稍后重试（可能是GitHub服务器问题）
    echo 4. 使用GitHub Desktop客户端
)

echo.
pause 