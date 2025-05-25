@echo off
chcp 65001 >nul
echo ================================
echo   修正版GitHub上传和Vercel部署
echo ================================
echo.

echo [1/8] 检查Git状态...
git status

echo.
echo [2/8] 检查是否有未提交的更改...
git diff --quiet
if %errorlevel% neq 0 (
    echo 发现未提交的更改，正在添加...
    git add .
    git commit -m "移动端兼容性优化：减少动画复杂度，优化加载性能"
) else (
    echo 没有新的更改需要提交
)

echo.
echo [3/8] 检查远程仓库连接...
git remote -v

echo.
echo [4/8] 推送到GitHub...
git push origin main

echo.
echo [5/8] 安装必要依赖...
echo 正在安装terser（构建优化工具）...
npm install --save-dev terser

echo.
echo [6/8] 安装Vercel CLI（如果需要）...
where vercel >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在安装Vercel CLI...
    npm install -g vercel
) else (
    echo Vercel CLI已安装
)

echo.
echo [7/8] 构建项目...
npm run build

echo.
echo [8/8] 部署到Vercel...
echo 请按照以下步骤操作：
echo 1. 在浏览器中访问: https://vercel.com
echo 2. 使用GitHub账号登录
echo 3. 点击 "New Project"
echo 4. 选择 "MINQU-website" 仓库
echo 5. 点击 "Deploy"
echo.
echo 或者使用命令行（需要先登录）：
echo vercel login
echo vercel --prod

echo.
echo ================================
echo 部署流程完成！
echo ================================
echo.
echo 您的网站地址：
echo GitHub: https://github.com/MINQU-2000/MINQU-website
echo Vercel: https://minqu-website-git-main-minqus-projects.vercel.app/
echo.
echo 移动端测试页面：
echo https://minqu-website-git-main-minqus-projects.vercel.app/mobile-test.html
echo.
pause 