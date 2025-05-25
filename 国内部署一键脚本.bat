@echo off
chcp 65001 >nul
echo ================================
echo   国内个人网站部署工具
echo   无需VPN，快速获得网址！
echo ================================
echo.

echo 🚨 注意：Gitee Pages正在维护中
echo 为您推荐以下国内可访问的部署方案：
echo.

echo 🎯 选择部署方式：
echo.
echo [1] Coding Pages（腾讯云，推荐）
echo [2] 阿里云OSS（专业方案）
echo [3] 华为云OBS（华为生态）
echo [4] Vercel（国外但速度不错）
echo [5] 构建项目（准备文件）
echo.
set /p choice=请输入选择 (1-5): 

if "%choice%"=="1" goto coding
if "%choice%"=="2" goto aliyun
if "%choice%"=="3" goto huawei
if "%choice%"=="4" goto vercel
if "%choice%"=="5" goto build
goto invalid

:build
echo.
echo 🔨 正在构建项目...
echo.
call npm run build
if %errorlevel% neq 0 (
    echo ❌ 构建失败，请检查项目配置
    pause
    exit /b 1
)
echo ✅ 构建完成！dist文件夹已生成
echo.
echo 📁 接下来您可以：
echo 1. 将dist文件夹内容上传到任何静态网站托管服务
echo 2. 或选择其他部署方案
echo.
goto end

:coding
echo.
echo 🌟 Coding Pages 部署指南：
echo.
echo 📋 步骤：
echo 1. 访问 https://coding.net
echo 2. 注册账号（可用QQ/微信登录）
echo 3. 创建项目 → DevOps项目
echo 4. 代码仓库 → 上传您的代码
echo 5. 持续部署 → 静态网站
echo 6. 配置：
echo    - 构建命令: npm run build
echo    - 发布目录: dist
echo.
echo 🌐 您将获得网址：https://项目名.coding-pages.com
echo.

echo 🚀 是否现在构建项目？(y/n)
set /p build_now=
if /i "%build_now%"=="y" (
    call npm run build
    echo ✅ 构建完成！请按照上述步骤在Coding上部署
)
goto end

:aliyun
echo.
echo 🚀 阿里云OSS 部署指南：
echo.
echo 💰 费用：几乎免费（每月几毛钱）
echo.
echo 📋 步骤：
echo 1. 访问 https://oss.console.aliyun.com
echo 2. 开通对象存储OSS服务
echo 3. 创建Bucket：
echo    - 名称: minqu-website
echo    - 地域: 华东1（杭州）
echo    - 读写权限: 公共读
echo 4. 上传网站文件：
echo    - 先构建项目: npm run build
echo    - 上传dist文件夹内容
echo 5. 配置静态网站：
echo    - 基础设置 → 静态页面
echo    - 默认首页: index.html
echo    - 默认404页: index.html
echo.
echo 🌐 访问地址：https://minqu-website.oss-cn-hangzhou.aliyuncs.com
echo.

echo 🚀 是否现在构建项目？(y/n)
set /p build_now=
if /i "%build_now%"=="y" (
    call npm run build
    echo ✅ 构建完成！请按照上述步骤在阿里云上部署
)
goto end

:huawei
echo.
echo 💫 华为云OBS 部署指南：
echo.
echo 💰 费用：免费额度充足
echo.
echo 📋 步骤：
echo 1. 访问 https://www.huaweicloud.com
echo 2. 注册华为云账号
echo 3. 开通对象存储服务OBS
echo 4. 创建桶：
echo    - 桶名称: minqu-website
echo    - 数据冗余存储策略: 单AZ存储
echo    - 桶策略: 公共读
echo 5. 上传网站文件
echo 6. 配置静态网站托管
echo.
echo 🌐 访问地址：https://minqu-website.obs-website.cn-north-4.myhuaweicloud.com
echo.

echo 🚀 是否现在构建项目？(y/n)
set /p build_now=
if /i "%build_now%"=="y" (
    call npm run build
    echo ✅ 构建完成！请按照上述步骤在华为云上部署
)
goto end

:vercel
echo.
echo 🎯 Vercel 部署指南：
echo.
echo ℹ️  虽然是国外服务，但国内访问速度还不错
echo.
echo 📋 步骤：
echo 1. 访问 https://vercel.com
echo 2. 使用GitHub账号登录
echo 3. 点击 "New Project"
echo 4. 选择您的 MINQU-website 仓库
echo 5. 点击 "Deploy"
echo 6. 等待2-3分钟部署完成
echo.
echo 🌐 您将获得网址：https://minqu-website.vercel.app
echo.

echo 🚀 是否推送代码到GitHub？(y/n)
set /p push_github=
if /i "%push_github%"=="y" (
    git config user.name "MINQU-2000"
    git config user.email "2217476349@qq.com"
    git remote remove origin 2>nul
    git remote add origin https://github.com/MINQU-2000/MINQU-website.git
    git add .
    git commit -m "Deploy to Vercel"
    git push origin main
    echo ✅ 代码已推送到GitHub！现在可以在Vercel上部署了
)
goto end

:invalid
echo ❌ 无效选择，请重新运行脚本
pause
exit /b 1

:end
echo.
echo ================================
echo 🎉 部署指南已提供！
echo ================================
echo.
echo 💡 推荐顺序：
echo 1. 🥇 Coding Pages（完全免费，国内快速）
echo 2. 🥈 阿里云OSS（专业稳定，成本极低）
echo 3. 🥉 Vercel（功能强大，国内可访问）
echo.
echo 📱 部署完成后：
echo - 用手机测试访问速度
echo - 检查响应式效果
echo - 分享给朋友测试
echo.
echo 🔄 更新网站：
echo - 修改代码后重新构建
echo - 重新上传到对应平台
echo.
echo 📞 技术支持：2217476349@qq.com
echo.
pause 