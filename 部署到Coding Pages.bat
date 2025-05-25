@echo off
chcp 65001 >nul
echo ================================
echo   Coding Pages 自动部署工具
echo   腾讯云 - 国内访问快速！
echo ================================
echo.

echo 🌟 Coding Pages 优势：
echo ✅ 腾讯云提供，稳定可靠
echo ✅ 完全免费，无任何费用
echo ✅ 国内访问快，无需VPN
echo ✅ 自动部署，推送即更新
echo ✅ 免费SSL证书
echo.

echo 📋 部署前准备：
echo 1. 请先访问 https://coding.net 注册账号
echo 2. 创建项目和代码仓库
echo 3. 获取仓库地址
echo.

set /p ready=您是否已完成Coding账号注册和项目创建？(y/n): 
if /i not "%ready%"=="y" (
    echo.
    echo 🔗 请先完成以下步骤：
    echo 1. 访问 https://coding.net
    echo 2. 注册账号（可用微信/QQ登录）
    echo 3. 创建DevOps项目：minqu-website
    echo 4. 创建代码仓库：minqu-website
    echo 5. 重新运行此脚本
    echo.
    pause
    exit /b 1
)

echo.
echo 🚀 开始自动部署...
echo.

echo [步骤1] 配置Git用户信息...
git config user.name "MINQU-2000"
git config user.email "2217476349@qq.com"
echo ✅ Git配置完成
echo.

echo [步骤2] 构建项目...
echo 正在执行 npm run build...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ 构建失败，请检查项目配置
    echo.
    echo 💡 常见问题：
    echo - 检查 package.json 中的构建脚本
    echo - 确保所有依赖已安装：npm install
    echo - 检查代码语法错误
    echo.
    pause
    exit /b 1
)
echo ✅ 项目构建成功
echo.

echo [步骤3] 配置Coding远程仓库...
echo.
echo 📝 请输入您的Coding仓库信息：
set /p username=请输入您的Coding用户名: 
set /p project=请输入项目名称（默认：minqu-website）: 
if "%project%"=="" set project=minqu-website

set coding_url=https://e.coding.net/%username%/%project%/%project%.git

echo.
echo 🔗 仓库地址：%coding_url%
echo.

git remote remove coding 2>nul
git remote add coding %coding_url%

echo ✅ Coding远程仓库配置完成
echo.

echo [步骤4] 推送代码到Coding...
git add .
git commit -m "部署瞿敏个人简历网站到Coding Pages"

echo 正在推送代码...
git push coding main

if %errorlevel% equ 0 (
    echo ✅ 代码推送成功！
) else (
    echo ⚠️  推送失败，可能需要身份验证
    echo.
    echo 💡 解决方案：
    echo 1. 检查用户名是否正确
    echo 2. 确认仓库地址是否正确
    echo 3. 可能需要在Coding网站上手动推送
    echo.
)

echo.
echo ================================
echo 🎉 代码推送完成！
echo ================================
echo.
echo 📋 接下来请在Coding网站完成静态网站配置：
echo.
echo 1. 🌐 访问您的Coding项目：
echo    https://coding.net/u/%username%/p/%project%
echo.
echo 2. 📂 进入"持续部署" → "静态网站"
echo.
echo 3. ⚙️  配置构建设置：
echo    - 代码源：选择您的代码仓库
echo    - 分支：main
echo    - 构建命令：npm install && npm run build
echo    - 发布目录：dist
echo    - Node.js版本：16.x 或 18.x
echo.
echo 4. 🚀 点击"开始部署"
echo.
echo 5. ⏱️  等待2-5分钟构建完成
echo.
echo 🌐 您将获得网站地址：
echo https://%username%.coding-pages.com
echo 或
echo https://%project%-%username%.coding-pages.com
echo.

echo ================================
echo 📱 部署完成后的测试步骤：
echo ================================
echo.
echo 1. 🖥️  桌面端测试：
echo    - 在电脑浏览器访问网站
echo    - 检查所有功能是否正常
echo.
echo 2. 📱 移动端测试：
echo    - 用手机访问网站
echo    - 测试响应式效果
echo    - 检查加载速度
echo.
echo 3. 👥 分享测试：
echo    - 分享给朋友访问
echo    - 确认无需VPN即可访问
echo.

echo ================================
echo 🔄 后续更新网站：
echo ================================
echo.
echo 修改代码后，只需运行：
echo git add .
echo git commit -m "更新网站内容"
echo git push coding main
echo.
echo Coding会自动检测代码变化并重新部署！
echo.

echo ================================
echo 💡 有用的链接：
echo ================================
echo.
echo 🔗 Coding官网：https://coding.net
echo 📚 Coding文档：https://help.coding.net
echo 📧 技术支持：2217476349@qq.com
echo 👩‍💼 项目作者：瞿敏
echo.

echo 🎉 恭喜！您的个人网站即将上线！
echo.
pause 