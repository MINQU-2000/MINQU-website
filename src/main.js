import { createApp } from 'vue'
import App from './App.vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import './styles/global.scss'

const app = createApp(App)

app.use(ElementPlus)

// 注册Element Plus图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

app.mount('#app')

// 仅在开发模式下初始化 Stagewise 工具栏
if (import.meta.env.DEV) {
  // 等待DOM完全加载后再初始化工具栏
  document.addEventListener('DOMContentLoaded', () => {
    import('@stagewise/toolbar-vue').then(async ({ StagewiseToolbar }) => {
      try {
        const stagewiseConfig = {
          plugins: []
        }
        
        // 创建独立的Vue应用实例挂载工具栏
        const { createApp: createStagewiseApp } = await import('vue')
        const stagewiseApp = createStagewiseApp(StagewiseToolbar, {
          config: stagewiseConfig
        })
        
        // 在body中创建工具栏容器
        const toolbarContainer = document.createElement('div')
        toolbarContainer.id = 'stagewise-toolbar'
        toolbarContainer.style.position = 'fixed'
        toolbarContainer.style.zIndex = '9999'
        document.body.appendChild(toolbarContainer)
        
        stagewiseApp.mount('#stagewise-toolbar')
        console.log('✅ Stagewise toolbar initialized successfully')
      } catch (error) {
        console.warn('⚠️ Stagewise toolbar initialization failed:', error)
      }
    }).catch(error => {
      console.warn('⚠️ Stagewise toolbar module failed to load:', error)
    })
  })
}