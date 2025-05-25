<template>
  <footer class="footer-section">
    <div class="footer-content">
      <div class="footer-main">
        <div class="footer-info">
          <div class="footer-logo">
            <div class="logo-text">
              <h3>{{ personalInfo.name }}</h3>
              <p>{{ personalInfo.title }}</p>
            </div>
          </div>
          
          <p class="footer-description">
            专注于用户体验设计与人机交互研究，致力于通过设计创造更美好的数字体验。
          </p>
          
          <div class="footer-stats">
            <div class="stat-item">
              <div class="stat-number">45+</div>
              <div class="stat-label">获奖项目</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">8</div>
              <div class="stat-label">专利授权</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">5+</div>
              <div class="stat-label">学术论文</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">2+</div>
              <div class="stat-label">工作经验</div>
            </div>
          </div>
        </div>
        
        <div class="footer-links">
          <div class="link-group">
            <h4>个人经历</h4>
            <ul>
              <li><a href="#education">教育背景</a></li>
              <li><a href="#research">科研经历</a></li>
              <li><a href="#work">工作经历</a></li>
              <li><a href="#achievements">获奖成果</a></li>
            </ul>
          </div>
          
          <div class="link-group">
            <h4>专业技能</h4>
            <ul>
              <li><a href="#design">设计工具</a></li>
              <li><a href="#development">开发技术</a></li>
              <li><a href="#research-skills">研究能力</a></li>
              <li><a href="#languages">语言能力</a></li>
            </ul>
          </div>
          
          <div class="link-group">
            <h4>联系方式</h4>
            <ul>
              <li><a :href="`mailto:${personalInfo.email}`">{{ personalInfo.email }}</a></li>
              <li><a :href="`tel:${personalInfo.phone}`">{{ personalInfo.phone }}</a></li>
              <li><span>南京理工大学</span></li>
              <li><span>设计艺术与传媒学院</span></li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="footer-bottom">
        <div class="footer-copyright">
          <p>&copy; {{ currentYear }} {{ personalInfo.name }}. 保留所有权利。</p>
          <p class="footer-note">本网站使用 Vue.js 构建，展示个人学术与职业经历。</p>
        </div>
        
        <div class="footer-tech">
          <span class="tech-badge">Vue.js</span>
          <span class="tech-badge">SCSS</span>
          <span class="tech-badge">响应式设计</span>
        </div>
      </div>
    </div>
    
    <!-- 返回顶部按钮 -->
    <button 
      v-show="showBackToTop" 
      @click="scrollToTop" 
      class="back-to-top"
      title="返回顶部"
    >
      ↑
    </button>
  </footer>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { roadmapData } from '../data/roadmapData.js'

const personalInfo = computed(() => roadmapData.personalInfo)
const currentYear = new Date().getFullYear()
const showBackToTop = ref(false)

const handleScroll = () => {
  showBackToTop.value = window.pageYOffset > 300
}

const scrollToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  })
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style lang="scss" scoped>
.footer-section {
  background: rgba(15, 23, 42, 0.95);
  backdrop-filter: blur(20px);
  border-top: 1px solid rgba(59, 130, 246, 0.2);
  position: relative;
  margin-top: 4rem;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 3rem 2rem 1rem;
}

.footer-main {
  display: flex;
  flex-direction: column;
  gap: 3rem;
  margin-bottom: 3rem;
}

.footer-info {
  .footer-logo {
    margin-bottom: 1.5rem;
    
    .logo-text {
      h3 {
        margin: 0 0 0.5rem 0;
        font-size: 2rem;
        font-weight: 700;
        background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
      }
      
      p {
        margin: 0;
        font-size: 1.1rem;
        color: #94a3b8;
        font-weight: 500;
      }
    }
  }
  
  .footer-description {
    color: #cbd5e1;
    line-height: 1.6;
    margin-bottom: 2rem;
  }
}

.footer-stats {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1.5rem;
  
  @media (max-width: 768px) {
    grid-template-columns: repeat(2, 1fr);
  }
  
  @media (max-width: 480px) {
    grid-template-columns: 1fr;
  }
  
  .stat-item {
    background: linear-gradient(135deg, rgba(15, 23, 42, 0.8) 0%, rgba(30, 41, 59, 0.8) 100%);
    backdrop-filter: blur(20px);
    border-radius: 16px;
    padding: 1.5rem 1rem;
    text-align: center;
    border: 1px solid rgba(59, 130, 246, 0.2);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    
    &::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(135deg, rgba(59, 130, 246, 0.05) 0%, rgba(139, 92, 246, 0.05) 100%);
      opacity: 0;
      transition: opacity 0.3s ease;
    }
    
    &:hover {
      transform: translateY(-4px);
      border-color: rgba(59, 130, 246, 0.4);
      box-shadow: 0 8px 32px rgba(59, 130, 246, 0.2);
      
      &::before {
        opacity: 1;
      }
    }
    
    .stat-number {
      font-size: 1.8rem;
      font-weight: 700;
      background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 0.5rem;
      position: relative;
      z-index: 1;
    }
    
    .stat-label {
      font-size: 0.9rem;
      color: #cbd5e1;
      font-weight: 500;
      position: relative;
      z-index: 1;
    }
  }
}

.footer-links {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
}

.link-group {
  h4 {
    font-size: 1.1rem;
    font-weight: 600;
    color: #f1f5f9;
    margin: 0 0 1rem 0;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid rgba(59, 130, 246, 0.2);
  }
  
  ul {
    list-style: none;
    padding: 0;
    margin: 0;
    
    li {
      margin-bottom: 0.5rem;
      
      a {
        color: #94a3b8;
        text-decoration: none;
        font-size: 0.9rem;
        transition: all 0.3s ease;
        
        &:hover {
          color: #60a5fa;
          padding-left: 0.5rem;
        }
      }
      
      span {
        color: #94a3b8;
        font-size: 0.9rem;
      }
    }
  }
}

.footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 2rem;
  border-top: 1px solid rgba(59, 130, 246, 0.1);
  
  @media (max-width: 768px) {
    flex-direction: column;
    gap: 1rem;
    text-align: center;
  }
}

.footer-copyright {
  p {
    margin: 0 0 0.25rem 0;
    color: #94a3b8;
    font-size: 0.9rem;
    
    &.footer-note {
      font-size: 0.8rem;
      color: #64748b;
    }
  }
}

.footer-tech {
  display: flex;
  gap: 0.5rem;
  
  .tech-badge {
    font-size: 0.7rem;
    padding: 0.25rem 0.6rem;
    background: rgba(59, 130, 246, 0.1);
    color: #60a5fa;
    border: 1px solid rgba(59, 130, 246, 0.2);
    border-radius: 6px;
    font-weight: 500;
  }
}

.back-to-top {
  position: fixed;
  bottom: 2rem;
  right: 2rem;
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
  color: white;
  border: none;
  border-radius: 50%;
  font-size: 1.2rem;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 16px rgba(59, 130, 246, 0.3);
  z-index: 1000;
  
  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
  }
  
  @media (max-width: 768px) {
    bottom: 1rem;
    right: 1rem;
    width: 45px;
    height: 45px;
    font-size: 1rem;
  }
}
</style> 