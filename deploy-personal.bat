@echo off
chcp 65001 >nul
echo ========================================
echo 瞿敏个人简历网站 - 自动部署脚本
echo ========================================
echo.

echo [1/5] 检查环境...
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误: 未找到 Node.js，请先安装 Node.js
    pause
    exit /b 1
)

where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误: 未找到 npm，请先安装 npm
    pause
    exit /b 1
)

echo ✅ Node.js 和 npm 环境检查通过

echo.
echo [2/5] 安装依赖...
call npm install
if %errorlevel% neq 0 (
    echo ❌ 依赖安装失败
    pause
    exit /b 1
)
echo ✅ 依赖安装完成

echo.
echo [3/5] 构建项目...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ 项目构建失败
    pause
    exit /b 1
)
echo ✅ 项目构建完成

echo.
echo [4/5] 检查构建结果...
if not exist "dist" (
    echo ❌ 构建目录不存在
    pause
    exit /b 1
)
echo ✅ 构建文件检查通过

echo.
echo [5/5] 部署选项...
echo 请选择部署方式:
echo 1. 本地预览 (推荐)
echo 2. 复制到指定目录
echo 3. 仅构建，不部署
echo.
set /p choice="请输入选择 (1-3): "

if "%choice%"=="1" (
    echo.
    echo 🚀 启动本地预览服务器...
    echo 预览地址: http://localhost:4173
    echo 按 Ctrl+C 停止服务器
    echo.
    call npm run preview
) else if "%choice%"=="2" (
    set /p target_dir="请输入目标目录路径: "
    if not exist "!target_dir!" (
        mkdir "!target_dir!"
    )
    echo 📁 复制文件到: !target_dir!
    xcopy /E /I /Y "dist\*" "!target_dir!"
    echo ✅ 文件复制完成
) else if "%choice%"=="3" (
    echo ✅ 构建完成，文件位于 dist 目录
) else (
    echo ❌ 无效选择
    pause
    exit /b 1
)

echo.
echo ========================================
echo 🎉 瞿敏个人简历网站部署完成！
echo ========================================
echo.
echo 📊 项目统计:
echo - 组件数量: 5个
echo - 页面模块: 7个
echo - 技能类别: 4个
echo - 获奖项目: 45项
echo.
echo 💡 提示:
echo - 网站已优化移动端体验
echo - 支持现代浏览器
echo - 包含SEO优化
echo.
pause 