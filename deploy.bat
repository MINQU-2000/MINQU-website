@echo off
echo ========================================
echo 个人网站部署脚本
echo ========================================
echo.

echo [1/3] 安装依赖...
call npm install
if %errorlevel% neq 0 (
    echo 错误：依赖安装失败！
    pause
    exit /b 1
)

echo.
echo [2/3] 构建项目...
call npm run build
if %errorlevel% neq 0 (
    echo 错误：项目构建失败！
    pause
    exit /b 1
)

echo.
echo [3/3] 构建完成！
echo.
echo ========================================
echo 部署文件已生成在 dist 目录中
echo ========================================
echo.
echo 接下来您可以：
echo 1. 将 dist 文件夹拖拽到 Netlify 进行部署
echo 2. 将项目推送到 GitHub 并连接 Vercel
echo 3. 使用其他部署方式（详见部署指南.md）
echo.
echo 部署指南文档：部署指南.md
echo.
pause 