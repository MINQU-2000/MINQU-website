@echo off
chcp 65001 >nul
echo ================================
echo   Gitee Pages 自动部署脚本
echo   解决移动端VPN访问问题
echo ================================
echo.

echo 🎯 部署目标：Gitee Pages（国内访问，无需VPN）
echo.

echo [第一步] 检查环境...
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 未找到npm，请先安装Node.js
    pause
    exit /b 1
)
echo ✅ npm环境正常

where git >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 未找到git，请先安装Git
    pause
    exit /b 1
)
echo ✅ git环境正常
echo.

echo [第二步] 构建项目...
echo 正在执行 npm run build...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ 构建失败，请检查项目配置
    pause
    exit /b 1
)
echo ✅ 项目构建成功
echo.

echo [第三步] 准备部署到Gitee...
echo.
echo 📋 请先完成以下准备工作：
echo 1. 访问 https://gitee.com 注册账号
echo 2. 创建名为 MINQU-website 的公开仓库
echo 3. 记录您的Gitee用户名
echo.

set /p GITEE_USERNAME="请输入您的Gitee用户名: "
if "%GITEE_USERNAME%"=="" (
    echo ❌ 用户名不能为空
    pause
    exit /b 1
)

echo.
echo 🚀 开始部署到 https://gitee.com/%GITEE_USERNAME%/MINQU-website
echo.

echo [第四步] 配置Gitee远程仓库...
git remote remove gitee 2>nul
git remote add gitee https://gitee.com/%GITEE_USERNAME%/MINQU-website.git
echo ✅ Gitee远程仓库配置完成

echo.
echo [第五步] 推送源代码到Gitee...
git add .
git commit -m "部署到Gitee Pages - 解决移动端访问问题"
git push gitee main
if %errorlevel% neq 0 (
    echo ⚠️ 推送源代码可能失败，继续部署构建文件...
)

echo.
echo [第六步] 部署构建文件到gh-pages分支...
cd dist

git init
git add -A
git commit -m "deploy to gitee pages"

echo 推送到Gitee Pages分支...
git push -f https://gitee.com/%GITEE_USERNAME%/MINQU-website.git main:gh-pages

if %errorlevel% equ 0 (
    echo ✅ 部署成功！
    echo.
    echo ================================
    echo 🎉 部署完成！
    echo ================================
    echo.
    echo 📱 移动端访问地址（无需VPN）：
    echo https://%GITEE_USERNAME%.gitee.io/MINQU-website
    echo.
    echo 📋 后续步骤：
    echo 1. 访问 https://gitee.com/%GITEE_USERNAME%/MINQU-website
    echo 2. 点击 "服务" → "Gitee Pages"
    echo 3. 选择分支: gh-pages
    echo 4. 点击 "启动" 开启Pages服务
    echo 5. 等待几分钟后即可访问
    echo.
    echo 🔄 更新网站：
    echo 修改代码后，重新运行此脚本即可更新
    echo.
) else (
    echo ❌ 部署失败
    echo.
    echo 🔧 可能的解决方案：
    echo 1. 检查Gitee用户名是否正确
    echo 2. 确认已创建MINQU-website仓库
    echo 3. 检查网络连接
    echo 4. 尝试手动推送：
    echo    git push -f https://gitee.com/%GITEE_USERNAME%/MINQU-website.git main:gh-pages
    echo.
)

cd ..

echo.
echo ================================
echo 其他国内部署选项：
echo ================================
echo 1. Coding Pages: https://coding.net
echo 2. 阿里云OSS: https://oss.console.aliyun.com
echo 3. 腾讯云COS: https://console.cloud.tencent.com/cos
echo 4. 华为云OBS: https://console.huaweicloud.com/obs
echo.

pause 