@echo off
chcp 65001 >nul
echo ================================
echo     瞿敏个人简历网站部署脚本
echo ================================
echo.

echo [1/6] 检查Git状态...
if not exist .git (
    echo 初始化Git仓库...
    git init
    echo Git仓库初始化完成
) else (
    echo Git仓库已存在
)

echo.
echo [2/6] 添加所有文件到Git...
git add .

echo.
echo [3/6] 提交更改...
set /p commit_msg="请输入提交信息 (默认: 更新网站内容): "
if "%commit_msg%"=="" set commit_msg=更新网站内容
git commit -m "%commit_msg%"

echo.
echo [4/6] 检查远程仓库...
git remote -v
if errorlevel 1 (
    echo 请手动添加远程仓库:
    echo git remote add origin https://github.com/你的用户名/MINQU-website.git
    echo.
    echo 然后运行: git push -u origin main
    pause
    exit /b 1
)

echo.
echo [5/6] 推送到GitHub...
git branch -M main
git push -u origin main

echo.
echo [6/6] 构建项目...
npm run build

echo.
echo ================================
echo 部署完成！
echo ================================
echo.
echo 请到GitHub仓库设置中启用GitHub Pages:
echo 1. 进入仓库 Settings
echo 2. 找到 Pages 选项
echo 3. Source 选择 "GitHub Actions"
echo 4. 网站将在几分钟后可用
echo.
echo 网站地址: https://你的用户名.github.io/MINQU-website/
echo.
pause 