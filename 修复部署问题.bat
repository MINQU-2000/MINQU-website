@echo off
chcp 65001 >nul
echo ================================
echo   修复版 Gitee Pages 部署脚本
echo   用户: minqu2000
echo ================================
echo.

echo [第一步] 配置Git用户信息...
git config user.name "MINQU2000"
git config user.email "2217476349@qq.com"
echo Git用户信息配置完成
echo.

echo [第二步] 构建项目...
echo 正在执行 npm run build...
call npm run build
if %errorlevel% neq 0 (
    echo 构建失败，请检查项目配置
    pause
    exit /b 1
)
echo 项目构建成功
echo.

echo [第三步] 配置Gitee远程仓库...
git remote remove gitee 2>nul
git remote add gitee https://gitee.com/minqu2000/minqu-website.git
echo Gitee远程仓库配置完成
echo.

echo [第四步] 推送源代码到Gitee...
git add .
git commit -m "Deploy to Gitee Pages"
git push gitee main
if %errorlevel% neq 0 (
    echo 推送源代码可能失败，继续部署构建文件...
)
echo.

echo [第五步] 部署构建文件到gh-pages分支...
cd dist

echo 初始化dist目录的git...
git init
git config user.name "minqu2000"
git config user.email "2217476349@qq.com"
git add -A
git commit -m "deploy to gitee pages"

echo 推送到Gitee Pages分支...
git push -f https://gitee.com/minqu2000/minqu-website.git HEAD:gh-pages

if %errorlevel% equ 0 (
    echo 部署成功！
    echo.
    echo ================================
    echo 部署完成！
    echo ================================
    echo.
    echo 移动端访问地址（无需VPN）：
    echo https://minqu2000.gitee.io/minqu-website
    echo.
    echo 后续步骤：
    echo 1. 访问 https://gitee.com/minqu2000/minqu-website
    echo 2. 点击 "服务" - "Gitee Pages"
    echo 3. 选择分支: gh-pages
    echo 4. 点击 "启动" 开启Pages服务
    echo 5. 等待几分钟后即可访问
    echo.
) else (
    echo 部署失败
    echo.
    echo 可能的解决方案：
    echo 1. 检查网络连接
    echo 2. 确认Gitee仓库已创建且为公开
    echo 3. 手动推送命令：
    echo    git push -f https://gitee.com/minqu2000/minqu-website.git HEAD:gh-pages
    echo.
)

cd ..

echo.
echo ================================
echo 移动端访问测试指南：
echo ================================
echo 1. 在手机上访问：https://minqu2000.gitee.io/minqu-website
echo 2. 无需VPN，国内直接访问
echo 3. 如果无法访问，请等待几分钟后重试
echo.

pause 