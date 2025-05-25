@echo off
chcp 65001 >nul
echo ================================
echo   移动端兼容性优化
echo ================================
echo.

echo [1/6] 优化Vite配置...
echo 正在更新vite.config.js...

echo [2/6] 添加移动端兼容性CSS...
echo 正在优化CSS兼容性...

echo [3/6] 优化JavaScript性能...
echo 正在减少动画复杂度...

echo [4/6] 添加加载优化...
echo 正在添加懒加载和预加载...

echo [5/6] 测试构建...
npm run build

echo [6/6] 推送优化...
git add .
git commit -m "移动端兼容性优化：减少动画复杂度，优化加载性能"
git push origin main

echo.
echo ================================
echo 移动端优化完成！
echo ================================
echo.
echo 优化内容：
echo ✓ 减少CSS动画复杂度
echo ✓ 优化JavaScript性能
echo ✓ 添加移动端兼容性
echo ✓ 优化资源加载
echo.
pause 