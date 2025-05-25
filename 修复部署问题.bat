@echo off
chcp 65001 >nul
echo ================================
echo   修复Vercel部署白屏问题
echo ================================
echo.

echo [1/5] 清理旧的构建文件...
if exist dist rmdir /s /q dist
if exist node_modules\.vite rmdir /s /q node_modules\.vite

echo [2/5] 重新安装依赖...
npm install

echo [3/5] 本地测试构建...
npm run build

echo [4/5] 检查构建结果...
if exist dist\index.html (
    echo ✓ 构建成功！index.html已生成
    dir dist
) else (
    echo ✗ 构建失败！请检查错误信息
    pause
    exit /b 1
)

echo [5/5] 推送修复到GitHub...
git add .
git commit -m "修复Vercel部署白屏问题：更新vite配置和vercel路由"
git push origin main

echo.
echo ================================
echo 修复完成！
echo ================================
echo.
echo 接下来：
echo 1. Vercel会自动重新部署
echo 2. 等待2-3分钟
echo 3. 重新访问您的网站
echo.
pause 