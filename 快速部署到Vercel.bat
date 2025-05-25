@echo off
chcp 65001 >nul
echo ================================
echo   快速部署到Vercel
echo   国内可访问，完全免费！
echo ================================
echo.

echo 🎯 Vercel优势：
echo ✅ 完全免费
echo ✅ 自动部署
echo ✅ 国内访问速度不错
echo ✅ 无需复杂配置
echo.

echo 🚀 开始部署...
echo.

echo [步骤1] 配置Git用户信息...
git config user.name "MINQU-2000"
git config user.email "2217476349@qq.com"
echo ✅ Git配置完成
echo.

echo [步骤2] 构建项目...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ 构建失败，请检查项目配置
    pause
    exit /b 1
)
echo ✅ 项目构建成功
echo.

echo [步骤3] 推送到GitHub...
git remote remove origin 2>nul
git remote add origin https://github.com/MINQU-2000/MINQU-website.git

git add .
git commit -m "Deploy personal website to Vercel"
git push origin main

if %errorlevel% equ 0 (
    echo ✅ 代码已推送到GitHub
) else (
    echo ⚠️  推送可能失败，但可以继续手动部署
)
echo.

echo ================================
echo 🎉 准备工作完成！
echo ================================
echo.
echo 📋 接下来请手动完成以下步骤：
echo.
echo 1. 🌐 访问 https://vercel.com
echo 2. 🔑 点击 "Sign up" 或 "Log in"
echo 3. 📱 选择 "Continue with GitHub"
echo 4. ➕ 点击 "New Project"
echo 5. 📂 选择 "MINQU-website" 仓库
echo 6. ⚙️  确认配置：
echo    - Project Name: minqu-website
echo    - Framework Preset: Vue.js
echo    - Build Command: npm run build
echo    - Output Directory: dist
echo 7. 🚀 点击 "Deploy"
echo 8. ⏱️  等待2-3分钟部署完成
echo.
echo 🌐 您将获得网址：
echo https://minqu-website.vercel.app
echo.
echo 📱 部署完成后：
echo - 用手机访问测试
echo - 分享给朋友测试访问速度
echo - 如果访问慢，可以尝试其他方案
echo.

echo 🔄 自动更新：
echo 以后只需要推送代码到GitHub，Vercel会自动更新网站！
echo.

echo ================================
echo 💡 其他备选方案：
echo ================================
echo.
echo 如果Vercel访问速度不理想，可以尝试：
echo.
echo 🥇 Coding Pages（腾讯云）：
echo    - 访问 https://coding.net
echo    - 完全免费，国内访问快
echo.
echo 🥈 阿里云OSS：
echo    - 访问 https://oss.console.aliyun.com
echo    - 成本极低，专业稳定
echo.
echo 📞 需要帮助？联系：2217476349@qq.com
echo.
pause 