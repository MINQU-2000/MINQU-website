@echo off
echo ========================================
echo 视觉感知技术路线图项目启动脚本
echo ========================================
echo.

echo 正在检查Node.js环境...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误: 未检测到Node.js，请先安装Node.js
    echo 下载地址: https://nodejs.org/
    pause
    exit /b 1
)

echo Node.js环境检查通过
echo.

echo 正在安装项目依赖...
npm install

if %errorlevel% neq 0 (
    echo 错误: 依赖安装失败
    pause
    exit /b 1
)

echo.
echo 依赖安装完成！
echo.

echo 正在启动开发服务器...
echo 项目将在浏览器中自动打开: http://localhost:5173
echo.
echo 按 Ctrl+C 可停止服务器
echo.

npm run dev

pause