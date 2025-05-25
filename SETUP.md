# 项目启动指南

## 🚀 快速开始

### 环境要求
- Node.js >= 16.0.0
- npm >= 8.0.0 或 yarn >= 1.22.0

### 安装步骤

1. **克隆项目**
```bash
git clone <项目地址>
cd visual-perception-tech-roadmap
```

2. **安装依赖**
```bash
npm install
# 或者使用 yarn
yarn install
```

3. **启动开发服务器**
```bash
npm run dev
# 或者
yarn dev
```

4. **访问应用**
打开浏览器访问：http://localhost:5173

### 构建生产版本

```bash
npm run build
# 或者
yarn build
```

生产文件将生成在 `dist` 目录中。

### 预览生产版本

```bash
npm run preview
# 或者
yarn preview
```

## 📁 项目结构说明

```
visual-perception-tech-roadmap/
├── public/                 # 静态资源
├── src/
│   ├── components/         # Vue组件
│   │   ├── TechRoadmap.vue    # 主路线图组件
│   │   ├── StageCard.vue      # 阶段卡片组件
│   │   └── DetailModal.vue    # 详情弹窗组件
│   ├── data/              # 数据文件
│   │   └── roadmapData.js     # 路线图数据
│   ├── styles/            # 样式文件
│   │   ├── global.scss        # 全局样式
│   │   └── variables.scss     # SCSS变量
│   ├── App.vue            # 根组件
│   └── main.js            # 入口文件
├── index.html             # HTML模板
├── package.json           # 项目配置
├── vite.config.js        # Vite配置
└── README.md             # 项目说明
```

## 🎨 技术栈

- **框架**: Vue 3 (Composition API)
- **构建工具**: Vite
- **UI库**: Element Plus
- **可视化**: D3.js (预留)
- **动画**: GSAP (预留)
- **图标**: Element Plus Icons + Lucide Vue Next
- **样式**: Sass/SCSS
- **状态管理**: Pinia (预留)
- **路由**: Vue Router (预留)

## 🔧 自定义配置

### 修改主题颜色
编辑 `src/styles/variables.scss` 文件中的颜色变量：

```scss
$primary-color: #2E86AB;     // 主色调
$secondary-color: #A23B72;   // 辅助色
$accent-color: #F18F01;      // 强调色
```

### 添加新的技术阶段
编辑 `src/data/roadmapData.js` 文件，在 `stages` 数组中添加新的阶段对象。

### 自定义样式
- 全局样式：`src/styles/global.scss`
- 变量定义：`src/styles/variables.scss`
- 组件样式：各组件内的 `<style>` 标签

## 📱 响应式设计

项目已适配多种屏幕尺寸：
- 桌面端：> 1200px
- 平板：768px - 1200px
- 移动端：< 768px

## 🌟 功能特性

- ✅ 交互式技术路线图展示
- ✅ 5个主要研究阶段可视化
- ✅ 详细的模块和技术栈展示
- ✅ 核心创新点高亮
- ✅ 响应式设计
- ✅ 现代化UI/UX
- ✅ 流畅的动画效果
- ✅ 详情弹窗展示

## 🚗 开发指南

### 添加新组件
1. 在 `src/components/` 目录下创建 `.vue` 文件
2. 使用 Composition API 编写组件逻辑
3. 遵循项目的样式规范

### 样式规范
- 使用 SCSS 预处理器
- 遵循 BEM 命名规范
- 使用CSS变量保持主题一致性

### 代码规范
- 使用 ESLint 进行代码检查
- 遵循 Vue 3 Composition API 最佳实践
- 保持组件职责单一

## 📞 技术支持

如遇到问题，请：
1. 检查 Node.js 和 npm 版本
2. 清除缓存：`npm cache clean --force`
3. 重新安装依赖：`rm -rf node_modules && npm install`
4. 查看浏览器控制台错误信息

## 📄 许可证

MIT License