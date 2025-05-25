@echo off
chcp 65001 >nul
echo ================================
echo   GitHub上传和Vercel部署
echo ================================
echo.

echo [1/6] 检查Git状态...
git status

echo.
echo [2/6] 添加所有文件...
git add .

echo.
echo [3/6] 提交更改...
git commit -m "移动端兼容性优化：减少动画复杂度，优化加载性能"

echo.
echo [4/6] 推送到GitHub...
git push origin main

echo.
echo [5/6] 构建项目...
npm run build

echo.
echo [6/6] 部署到Vercel...
vercel --prod

echo.
echo ================================
echo 部署完成！
echo ================================
echo.
echo 您的网站将在以下地址可用：
echo GitHub: https://github.com/MINQU-2000/MINQU-website
echo Vercel: https://minqu-website.vercel.app
echo.
echo 移动端测试页面：
echo https://minqu-website.vercel.app/mobile-test.html
echo.
pause 