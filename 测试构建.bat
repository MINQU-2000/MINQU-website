@echo off
chcp 65001 >nul
echo ================================
echo   测试构建脚本
echo ================================
echo.

echo [1/3] 检查Node.js版本...
node --version
npm --version

echo.
echo [2/3] 检查依赖...
if not exist node_modules (
    echo 正在安装依赖...
    npm install
) else (
    echo 依赖已存在
)

echo.
echo [3/3] 尝试构建...
echo 开始构建项目...
npm run build

if %errorlevel% equ 0 (
    echo.
    echo ✅ 构建成功！
    echo 构建文件位于 dist/ 目录
    dir dist
) else (
    echo.
    echo ❌ 构建失败
    echo 请检查错误信息
)

echo.
pause 