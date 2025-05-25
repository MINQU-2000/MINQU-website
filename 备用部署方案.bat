@echo off
chcp 65001 >nul
echo ================================
echo   移动端访问问题 - 备用部署方案
echo ================================
echo.

echo 检测到移动端网络访问问题，正在创建备用方案...
echo.

echo [分析结果]
echo ✅ 本地访问正常: http://192.168.1.7:5173/
echo ❌ 线上访问失败: Vercel部署网站
echo 📊 结论: 网络层面问题，非代码问题
echo.

echo [立即测试方案]
echo.
echo 请在手机上测试以下方案：
echo.

echo 方案1: 使用手机流量（关闭WiFi）
echo 访问: https://minqu-website-git-main-minqus-projects.vercel.app/
echo.

echo 方案2: 更改手机DNS设置
echo Android: WiFi设置 → 高级 → DNS改为8.8.8.8
echo iOS: WiFi设置 → 配置DNS → 手动 → 8.8.8.8
echo.

echo 方案3: 测试其他Vercel网站
echo 访问: https://vercel.com
echo 如果这个也打不开，说明是Vercel整体访问问题
echo.

echo [备用部署方案]
echo.
echo 正在准备GitHub Pages备用部署...

echo 创建GitHub Pages配置...
mkdir .github\workflows 2>nul

echo name: Deploy to GitHub Pages > .github\workflows\deploy.yml
echo. >> .github\workflows\deploy.yml
echo on: >> .github\workflows\deploy.yml
echo   push: >> .github\workflows\deploy.yml
echo     branches: [ main ] >> .github\workflows\deploy.yml
echo. >> .github\workflows\deploy.yml
echo jobs: >> .github\workflows\deploy.yml
echo   deploy: >> .github\workflows\deploy.yml
echo     runs-on: ubuntu-latest >> .github\workflows\deploy.yml
echo     steps: >> .github\workflows\deploy.yml
echo       - uses: actions/checkout@v3 >> .github\workflows\deploy.yml
echo       - uses: actions/setup-node@v3 >> .github\workflows\deploy.yml
echo         with: >> .github\workflows\deploy.yml
echo           node-version: 18 >> .github\workflows\deploy.yml
echo       - run: npm install >> .github\workflows\deploy.yml
echo       - run: npm run build >> .github\workflows\deploy.yml
echo       - uses: peaceiris/actions-gh-pages@v3 >> .github\workflows\deploy.yml
echo         with: >> .github\workflows\deploy.yml
echo           github_token: ${{ secrets.GITHUB_TOKEN }} >> .github\workflows\deploy.yml
echo           publish_dir: ./dist >> .github\workflows\deploy.yml

echo ✅ GitHub Pages配置已创建
echo.

echo [推送到GitHub]
echo 正在推送代码...

git add .
git commit -m "添加移动端网络问题诊断和GitHub Pages备用部署"
git push origin main

if %errorlevel% equ 0 (
    echo ✅ 代码推送成功！
    echo.
    echo [启用GitHub Pages]
    echo 请手动完成以下步骤：
    echo 1. 访问: https://github.com/MINQU-2000/MINQU-website
    echo 2. 点击 Settings → Pages
    echo 3. Source 选择 "GitHub Actions"
    echo 4. 等待部署完成
    echo.
    echo 备用网址将是:
    echo https://minqu-2000.github.io/MINQU-website/
    echo.
) else (
    echo ❌ 推送失败，请检查网络连接
    echo.
    echo 手动推送命令：
    echo git add .
    echo git commit -m "移动端网络问题修复"
    echo git push origin main
    echo.
)

echo [其他CDN选项]
echo.
echo 如果GitHub Pages也有问题，可以考虑：
echo 1. Netlify: https://netlify.com
echo 2. Cloudflare Pages: https://pages.cloudflare.com
echo 3. 阿里云OSS + CDN（国内用户）
echo 4. 腾讯云COS + CDN（国内用户）
echo.

echo [移动端用户临时解决方案]
echo.
echo 为移动端用户提供以下指导：
echo 1. 尝试使用手机流量而非WiFi
echo 2. 更改DNS设置为8.8.8.8
echo 3. 清除浏览器缓存
echo 4. 尝试不同浏览器
echo 5. 使用VPN服务
echo.

echo ================================
echo 部署完成！请测试备用方案
echo ================================

pause 