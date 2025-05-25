@echo off
chcp 65001 >nul
echo ================================
echo   瞿敏个人简历网站 - GitHub部署
echo ================================
echo.
echo 目标仓库: https://github.com/MINQU-2000/MINQU-website
echo.

echo [1/7] 检查Git状态...
if not exist .git (
    echo 初始化Git仓库...
    git init
    if errorlevel 1 (
        echo 错误: Git初始化失败，请确保已安装Git
        pause
        exit /b 1
    )
    echo ✓ Git仓库初始化完成
) else (
    echo ✓ Git仓库已存在
)

echo.
echo [2/7] 配置Git用户信息...
git config user.name "MINQU-2000"
git config user.email "2217476349@qq.com"
echo ✓ Git用户信息配置完成

echo.
echo [3/7] 添加所有文件到Git...
git add .
if errorlevel 1 (
    echo 错误: 添加文件失败
    pause
    exit /b 1
)
echo ✓ 文件添加完成

echo.
echo [4/7] 提交更改...
git commit -m "初始提交：瞿敏个人简历网站 - 现代化UI/UX设计师作品集"
if errorlevel 1 (
    echo 注意: 可能没有新的更改需要提交
)
echo ✓ 提交完成

echo.
echo [5/7] 添加远程仓库...
git remote remove origin 2>nul
git remote add origin https://github.com/MINQU-2000/MINQU-website.git
if errorlevel 1 (
    echo 错误: 添加远程仓库失败
    pause
    exit /b 1
)
echo ✓ 远程仓库添加完成

echo.
echo [6/7] 设置主分支并推送...
git branch -M main
echo 正在推送到GitHub...
echo 注意: 如果是第一次推送，可能需要GitHub身份验证
git push -u origin main
if errorlevel 1 (
    echo.
    echo ⚠️  推送失败，可能的原因：
    echo 1. 需要GitHub身份验证
    echo 2. 网络连接问题
    echo 3. 仓库权限问题
    echo.
    echo 请手动执行以下命令：
    echo git push -u origin main
    echo.
    pause
    exit /b 1
)
echo ✓ 代码推送完成

echo.
echo [7/7] 构建项目...
npm run build
if errorlevel 1 (
    echo 警告: 项目构建失败，但代码已成功推送
)

echo.
echo ================================
echo 🎉 部署完成！
echo ================================
echo.
echo ✅ 代码已推送到: https://github.com/MINQU-2000/MINQU-website
echo.
echo 📋 接下来的步骤：
echo 1. 访问您的GitHub仓库
echo 2. 进入 Settings → Pages
echo 3. Source 选择 "GitHub Actions"
echo 4. 等待自动部署完成（约2-3分钟）
echo.
echo 🌐 网站将在以下地址可用：
echo https://minqu-2000.github.io/MINQU-website/
echo.
echo 📚 如需帮助，请查看 "GitHub部署指南.md"
echo.
pause 