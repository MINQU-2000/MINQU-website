<template>
  <div class="personal-portfolio">
    <!-- 加载指示器 -->
    <div v-if="isLoading" class="loading-overlay">
      <div class="loading-spinner">
        <div class="spinner"></div>
        <p>正在加载瞿敏的个人简历...</p>
      </div>
    </div>
    <!-- 深色背景 -->
    <div class="background-layer">
      <div class="gradient-mesh"></div>
      <div class="grid-pattern"></div>
    </div>

    <!-- 个人信息区域 -->
    <div class="hero-section">
      <div class="hero-container">
        <div class="profile-section">
          <div class="profile-content">
            <h1 class="name">{{ personalInfo.name }}</h1>
            <div class="role-display">
              <span class="role-text">{{ currentRole }}</span>
              <span class="cursor">|</span>
            </div>
            <p class="bio">{{ personalInfo.subtitle }}</p>
            
            <div class="contact-info">
              <div class="contact-item" v-for="contact in contactInfo" :key="contact.label">
                <span class="icon">{{ contact.icon }}</span>
                <span class="text">{{ contact.value }}</span>
              </div>
            </div>
          </div>
          
                    <!-- 技能展示区域 -->
          <div class="skills-showcase">
            <div class="skills-header">
              <h3 class="skills-title">专业技能</h3>
              <div class="skills-subtitle">Professional Skills & Expertise</div>
            </div>
            <div class="skills-grid">
              <div 
                v-for="(skill, index) in allSkills" 
                :key="index"
                class="skill-tag"
                :class="getSkillClass(index)"
              >
                {{ skill }}
              </div>
            </div>
          </div>
        </div>
        
        <!-- 横向导航 -->
        <div class="navigation-section">
          <div class="nav-header">
            <h2>专业经历</h2>
            <div class="nav-line"></div>
          </div>
          
          <div class="nav-grid">
            <div 
              v-for="(stage, index) in stages" 
              :key="stage.id"
              :class="['nav-card', { active: activeStage === index }]"
              @click="scrollToStage(index)"
            >
              <div class="nav-icon">{{ stage.icon }}</div>
              <div class="nav-info">
                <div class="nav-title">{{ stage.title }}</div>
                <div class="nav-duration">{{ stage.duration }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 内容展示区域 -->
    <div class="content-section">
      <div class="content-container">
        <div 
          v-for="(stage, index) in stages" 
          :key="stage.id"
          class="stage-content"
          :data-stage="index"
        >
          <div class="stage-header">
            <div class="stage-icon">{{ stage.icon }}</div>
            <div class="stage-info">
              <h3>{{ stage.title }}</h3>
              <p class="stage-subtitle">{{ stage.subtitle }}</p>
              <span class="stage-duration">{{ stage.duration }}</span>
            </div>
          </div>
          
          <!-- 展开的详细内容 -->
          <div class="stage-details expanded">
            <p class="description">{{ stage.description }}</p>
            
            <div class="modules-container">
              <div 
                v-for="module in stage.modules" 
                :key="module.id"
                class="module-card"
                :class="{ 'highlight-card': module.period }"
              >
                <div class="module-header">
                  <div class="module-icon">{{ module.icon || '📋' }}</div>
                  <div class="module-info">
                    <h4 class="module-title">{{ module.title }}</h4>
                    <span v-if="module.period" class="module-period">{{ module.period }}</span>
                  </div>
                </div>
                
                <div class="module-content">
                  <div v-for="item in module.items" :key="item.name || item" class="content-section">
                    <template v-if="typeof item === 'object' && item.name">
                      <div class="section-header">
                        <h5 class="section-title">{{ item.name }}</h5>
                      </div>
                      <div class="section-content">
                        <div v-for="detail in item.details" :key="detail" class="detail-item">
                          <span class="detail-bullet">•</span>
                          <span class="detail-text">{{ detail }}</span>
                        </div>
                      </div>
                    </template>
                    <template v-else>
                      <div class="simple-content">
                        <span class="simple-bullet">•</span>
                        <span class="simple-text">{{ item }}</span>
                      </div>
                    </template>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="tech-stack">
              <span class="stack-label">核心技能</span>
              <div class="tech-tags">
                <span v-for="tech in stage.techStack" :key="tech" class="tech-tag">
                  {{ tech }}
                </span>
              </div>
            </div>
            

          </div>
        </div>
      </div>
    </div>



    <!-- 页脚区域 -->
    <FooterSection />
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { roadmapData } from '../data/roadmapData.js'

import FooterSection from './FooterSection.vue'

// 响应式数据
const activeStage = ref(0)
const currentRole = ref('')
const isLoading = ref(true)

// 计算属性
const personalInfo = computed(() => roadmapData.personalInfo)
const stages = computed(() => roadmapData.stages)

// 简化的角色列表
const roles = [
  'UI/UX设计师',
  '工业设计师'
]

const contactInfo = computed(() => [
  { icon: '📧', label: 'Email', value: personalInfo.value.email },
  { icon: '📱', label: 'Phone', value: personalInfo.value.phone },
  { icon: '🎂', label: 'Birth', value: personalInfo.value.birthday }
])

// 技能弹幕数据 - 扁平化处理
const allSkills = ref([
  'Figma', 'Sketch', 'Rhino', 'C4D', '3D MAX', 'Keyshot',
    'C语言','Cursor', 'Claude', 'Trae', 'Midjourney', 'ThingJS', 'Python', 'Unity3D',
  'Tobii Pro Lab', 'SPSS', 'CET4', 'CET6',
  'Photoshop', 'Illustrator', 'After Effects', 'Premiere', 'XD',

])

// 技能标签样式分配 - 包含大小变化
const getSkillClass = (index) => {
  const classes = ['primary', 'secondary', 'accent', 'highlight']
  const sizes = ['small', 'medium', 'large', 'medium', 'small', 'large']
  const colorClass = classes[index % classes.length]
  const sizeClass = sizes[index % sizes.length]
  return `${colorClass} ${sizeClass}`
}

// 方法
const scrollToStage = (index) => {
  const element = stageRefs.value[index]
  if (element) {
    element.scrollIntoView({ behavior: 'smooth', block: 'center' })
  }
}



// 打字机效果
const typeWriter = () => {
  let roleIndex = 0
  let charIndex = 0
  let isDeleting = false
  
  const type = () => {
    const currentRoleText = roles[roleIndex]
    
    if (isDeleting) {
      currentRole.value = currentRoleText.substring(0, charIndex - 1)
      charIndex--
    } else {
      currentRole.value = currentRoleText.substring(0, charIndex + 1)
      charIndex++
    }
    
    let typeSpeed = isDeleting ? 80 : 120
    
    if (!isDeleting && charIndex === currentRoleText.length) {
      typeSpeed = 2500
      isDeleting = true
    } else if (isDeleting && charIndex === 0) {
      isDeleting = false
      roleIndex = (roleIndex + 1) % roles.length
    }
    
    setTimeout(type, typeSpeed)
  }
  
  type()
}

// 生命周期
onMounted(() => {
  typeWriter()
  
  // 模拟加载完成
  setTimeout(() => {
    isLoading.value = false
  }, 1000)
})
</script>

<style lang="scss" scoped>
.personal-portfolio {
  min-height: 100vh;
  background: 
    radial-gradient(ellipse at top left, rgba(59, 130, 246, 0.15) 0%, transparent 50%),
    radial-gradient(ellipse at top right, rgba(139, 92, 246, 0.15) 0%, transparent 50%),
    radial-gradient(ellipse at bottom left, rgba(6, 182, 212, 0.1) 0%, transparent 50%),
    radial-gradient(ellipse at bottom right, rgba(16, 185, 129, 0.1) 0%, transparent 50%),
    linear-gradient(135deg, #0a0a0a 0%, #1a1a2e 50%, #16213e 100%);
  color: #ffffff;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  position: relative;
}

// 深色背景层 - 移动端优化
.background-layer {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
  
  .gradient-mesh {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    
    @media (min-width: 769px) {
      background: 
        radial-gradient(circle at 30% 40%, rgba(59, 130, 246, 0.12) 0%, transparent 60%),
        radial-gradient(circle at 70% 20%, rgba(139, 92, 246, 0.12) 0%, transparent 60%),
        radial-gradient(circle at 20% 80%, rgba(6, 182, 212, 0.08) 0%, transparent 60%),
        radial-gradient(circle at 80% 70%, rgba(245, 158, 11, 0.06) 0%, transparent 60%);
    }
    
    @media (max-width: 768px) {
      background: 
        radial-gradient(circle at 50% 50%, rgba(59, 130, 246, 0.08) 0%, transparent 70%);
    }
  }

  
  .grid-pattern {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    
    @media (min-width: 769px) {
      background-image: 
        linear-gradient(rgba(255, 255, 255, 0.02) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255, 255, 255, 0.02) 1px, transparent 1px);
      background-size: 50px 50px;
    }
    
    @media (max-width: 768px) {
      display: none; // 移动端隐藏网格以提升性能
    }
  }
}





// 英雄区域
.hero-section {
  padding: 4rem 2rem;
  position: relative;
  z-index: 1;
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
  align-items: start;
}

// 个人信息区域
.profile-section {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 3rem;
  align-items: start;
  
  @media (max-width: 968px) {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
}

.profile-content {
  flex: 1;
  
  .name {
    font-size: 2.5rem;
    font-weight: 700;
    margin: 0 0 1rem 0;
    background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .role-display {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    margin-bottom: 1rem;
    
    .role-text {
      font-size: 1.25rem;
      font-weight: 500;
      color: #60a5fa;
    }
    
    .cursor {
      color: #3b82f6;
      animation: blink 1s infinite;
    }
  }
  
  .bio {
    color: #94a3b8;
    margin: 0 0 2rem 0;
    line-height: 1.6;
    font-size: 1.1rem;
  }
}

@keyframes blink {
  0%, 50% { opacity: 1; }
  51%, 100% { opacity: 0; }
}

.contact-info {
  display: flex;
  flex-wrap: wrap;
  gap: 2rem;
  
  @media (max-width: 768px) {
    flex-direction: column;
    gap: 0.75rem;
  }
  
  .contact-item {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    
    .icon {
      font-size: 1.1rem;
    }
    
    .text {
      color: #cbd5e1;
      font-size: 0.95rem;
    }
  }
}

// 技能展示区域
.skills-showcase {
  .skills-header {
    text-align: center;
    margin-bottom: 2rem;
    
    .skills-title {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 0 0 0.5rem 0;
      color: #f1f5f9;
      background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    
    .skills-subtitle {
      font-size: 0.9rem;
      color: #94a3b8;
      font-style: italic;
    }
  }
  
  .skills-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: flex-start;
    gap: 0.75rem;
    padding: 2rem;
    background: linear-gradient(135deg, rgba(15, 23, 42, 0.4) 0%, rgba(30, 41, 59, 0.4) 100%);
    border-radius: 20px;
    border: 1px solid rgba(59, 130, 246, 0.2);
    backdrop-filter: blur(10px);
    box-shadow: 
      0 8px 32px rgba(0, 0, 0, 0.2),
      inset 0 1px 0 rgba(59, 130, 246, 0.1);
    position: relative;
    min-height: 300px;
    
    &::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: 
        radial-gradient(circle at 20% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(139, 92, 246, 0.1) 0%, transparent 50%);
      border-radius: 20px;
      pointer-events: none;
    }
    
    .skill-tag {
      position: relative;
      padding: 0.6rem 1rem;
      border-radius: 25px;
      font-size: 0.85rem;
      font-weight: 500;
      text-align: center;
      border: 1px solid;
      transition: all 0.3s ease;
      backdrop-filter: blur(5px);
      z-index: 1;
      cursor: pointer;
      flex-shrink: 0;
      
      // 动画效果 - 移动端优化
      @media (min-width: 769px) {
        animation: fadeInUp 0.6s ease-out forwards;
        opacity: 0;
        transform: translateY(20px);
        
        @for $i from 1 through 50 {
          &:nth-child(#{$i}) {
            animation-delay: #{$i * 0.08}s;
          }
        }
      }
      
      @media (max-width: 768px) {
        opacity: 1;
        transform: translateY(0);
      }
      
      // 大小变化 - 统一高度和字体，只改变宽度
      &.small {
        padding: 0.6rem 0.8rem;
        font-size: 0.85rem;
        border-radius: 20px;
        min-height: 36px;
        display: flex;
        align-items: center;
      }
      
      &.medium {
        padding: 0.6rem 1rem;
        font-size: 0.85rem;
        border-radius: 25px;
        min-height: 36px;
        display: flex;
        align-items: center;
      }
      
      &.large {
        padding: 0.6rem 1.4rem;
        font-size: 0.85rem;
        border-radius: 30px;
        font-weight: 500;
        min-height: 36px;
        display: flex;
        align-items: center;
      }
      
      &.primary {
        background: linear-gradient(135deg, rgba(59, 130, 246, 0.15) 0%, rgba(139, 92, 246, 0.15) 100%);
        border-color: rgba(59, 130, 246, 0.3);
        color: #60a5fa;
        
        @media (min-width: 769px) {
          &:hover {
            background: linear-gradient(135deg, rgba(59, 130, 246, 0.25) 0%, rgba(139, 92, 246, 0.25) 100%);
            border-color: rgba(59, 130, 246, 0.5);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(59, 130, 246, 0.3);
          }
          
          &.large:hover {
            transform: translateY(-5px) scale(1.08);
            box-shadow: 0 12px 35px rgba(59, 130, 246, 0.4);
          }
        }
      }
      
      &.secondary {
        background: linear-gradient(135deg, rgba(139, 92, 246, 0.15) 0%, rgba(6, 182, 212, 0.15) 100%);
        border-color: rgba(139, 92, 246, 0.3);
        color: #a78bfa;
        
        @media (min-width: 769px) {
          &:hover {
            background: linear-gradient(135deg, rgba(139, 92, 246, 0.25) 0%, rgba(6, 182, 212, 0.25) 100%);
            border-color: rgba(139, 92, 246, 0.5);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(139, 92, 246, 0.3);
          }
          
          &.large:hover {
            transform: translateY(-5px) scale(1.08);
            box-shadow: 0 12px 35px rgba(139, 92, 246, 0.4);
          }
        }
      }
      
      &.accent {
        background: linear-gradient(135deg, rgba(6, 182, 212, 0.15) 0%, rgba(16, 185, 129, 0.15) 100%);
        border-color: rgba(6, 182, 212, 0.3);
        color: #06b6d4;
        
        @media (min-width: 769px) {
          &:hover {
            background: linear-gradient(135deg, rgba(6, 182, 212, 0.25) 0%, rgba(16, 185, 129, 0.25) 100%);
            border-color: rgba(6, 182, 212, 0.5);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(6, 182, 212, 0.3);
          }
          
          &.large:hover {
            transform: translateY(-5px) scale(1.08);
            box-shadow: 0 12px 35px rgba(6, 182, 212, 0.4);
          }
        }
      }
      
      &.highlight {
        background: linear-gradient(135deg, rgba(245, 158, 11, 0.15) 0%, rgba(239, 68, 68, 0.15) 100%);
        border-color: rgba(245, 158, 11, 0.3);
        color: #f59e0b;
        
        @media (min-width: 769px) {
          &:hover {
            background: linear-gradient(135deg, rgba(245, 158, 11, 0.25) 0%, rgba(239, 68, 68, 0.25) 100%);
            border-color: rgba(245, 158, 11, 0.5);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(245, 158, 11, 0.3);
          }
          
          &.large:hover {
            transform: translateY(-5px) scale(1.08);
            box-shadow: 0 12px 35px rgba(245, 158, 11, 0.4);
          }
        }
      }
    }
  }
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

// 导航区域 - 横向版
.navigation-section {
  .nav-header {
    margin-bottom: 1.5rem;
    
    h2 {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 0 0 1rem 0;
      color: #f1f5f9;
    }
    
    .nav-line {
      width: 60px;
      height: 2px;
      background: linear-gradient(90deg, #3b82f6, #8b5cf6);
      border-radius: 1px;
    }
  }
}

.nav-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  
  @media (max-width: 768px) {
    grid-template-columns: repeat(2, 1fr);
  }
  
  @media (max-width: 480px) {
    grid-template-columns: 1fr;
  }
}

.nav-card {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  border-radius: 12px;
  background: rgba(30, 41, 59, 0.6);
  border: 1px solid rgba(59, 130, 246, 0.1);
  
  &:hover {
    background: rgba(30, 41, 59, 0.8);
    border-color: rgba(59, 130, 246, 0.2);
    transform: translateY(-2px);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
  }
  
  &.active {
    background: rgba(59, 130, 246, 0.1);
    border-color: rgba(59, 130, 246, 0.3);
    box-shadow: 0 4px 16px rgba(59, 130, 246, 0.2);
    
    .nav-title {
      color: #60a5fa;
    }
    
    .nav-icon {
      background: linear-gradient(135deg, #60a5fa 0%, #a78bfa 100%);
    }
  }
}

.nav-icon {
  font-size: 1.2rem;
  padding: 0.5rem;
  background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(59, 130, 246, 0.3);
  transition: all 0.3s ease;
  min-width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.nav-info {
  flex: 1;
  min-width: 0;
  
  .nav-title {
    font-size: 0.9rem;
    font-weight: 500;
    margin: 0 0 0.25rem 0;
    color: #e2e8f0;
    transition: color 0.3s ease;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  
  .nav-duration {
    font-size: 0.7rem;
    color: #3b82f6;
    background: rgba(59, 130, 246, 0.1);
    padding: 0.1rem 0.4rem;
    border-radius: 4px;
    display: inline-block;
    font-weight: 500;
  }
}

// 内容展示区域
.content-section {
  padding: 2rem;
  background: linear-gradient(135deg, rgba(15, 23, 42, 0.4) 0%, rgba(30, 41, 59, 0.4) 100%);
  backdrop-filter: blur(20px);
  border-top: 1px solid rgba(59, 130, 246, 0.2);
}

.content-container {
  max-width: 1200px;
  margin: 0 auto;
}

.stage-content {
  margin-bottom: 3rem;
  padding: 2rem;
  background: linear-gradient(135deg, rgba(15, 23, 42, 0.4) 0%, rgba(30, 41, 59, 0.4) 100%);
  border-radius: 20px;
  border: 1px solid rgba(59, 130, 246, 0.2);
  backdrop-filter: blur(10px);
  transition: all 0.5s ease;
  box-shadow: 
    0 8px 32px rgba(0, 0, 0, 0.2),
    inset 0 1px 0 rgba(59, 130, 246, 0.1);
  
  &.active {
    border-color: rgba(59, 130, 246, 0.3);
    box-shadow: 
      0 8px 32px rgba(0, 0, 0, 0.2),
      inset 0 1px 0 rgba(59, 130, 246, 0.2);
  }
}

.stage-header {
  display: flex;
  align-items: center;
  gap: 1.5rem;
  margin-bottom: 1.5rem;
  
  .stage-icon {
    font-size: 2rem;
    padding: 0.75rem;
    background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(59, 130, 246, 0.3);
  }
  
  .stage-info {
    flex: 1;
    
    h3 {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 0 0 0.25rem 0;
      color: #f1f5f9;
    }
    
    .stage-subtitle {
      color: #94a3b8;
      margin: 0 0 0.5rem 0;
      font-size: 0.95rem;
    }
    
    .stage-duration {
      font-size: 0.8rem;
      color: #3b82f6;
      background: rgba(59, 130, 246, 0.1);
      padding: 0.2rem 0.6rem;
      border-radius: 8px;
      display: inline-block;
    }
  }
}

// 展开的详细内容
.stage-details {
  max-height: 0;
  overflow: hidden;
  transition: all 0.5s ease;
  opacity: 0;
  
  &.expanded {
    max-height: 2000px;
    opacity: 1;
  }
  
  .description {
    color: #94a3b8;
    line-height: 1.6;
    margin-bottom: 2rem;
    font-size: 1rem;
    font-weight: 400;
  }
}

.modules-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    gap: 1rem;
  }
}

.module-card {
  background: rgba(15, 23, 42, 0.6);
  border: 1px solid rgba(59, 130, 246, 0.1);
  border-radius: 16px;
  padding: 1.5rem;
  transition: all 0.3s ease;
  position: relative;
  box-shadow: 
    0 2px 8px rgba(0, 0, 0, 0.1),
    inset 0 1px 0 rgba(148, 163, 184, 0.05);
  
  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius: 16px;
    border: 1px solid transparent;
    background: linear-gradient(135deg, rgba(59, 130, 246, 0.15), rgba(148, 163, 184, 0.08), transparent);
    mask: linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0);
    mask-composite: xor;
    -webkit-mask: linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0);
    -webkit-mask-composite: xor;
    pointer-events: none;
  }
  
  &:hover {
    border-color: rgba(59, 130, 246, 0.2);
    box-shadow: 
      0 4px 20px rgba(0, 0, 0, 0.2),
      inset 0 1px 0 rgba(148, 163, 184, 0.08);
    transform: translateY(-2px);
    
    &::after {
      background: linear-gradient(135deg, rgba(59, 130, 246, 0.25), rgba(148, 163, 184, 0.12), transparent);
    }
  }
  
  &.highlight-card {
    background: linear-gradient(135deg, rgba(59, 130, 246, 0.08) 0%, rgba(139, 92, 246, 0.08) 100%);
    border: 1px solid rgba(59, 130, 246, 0.2);
    box-shadow: 
      0 4px 16px rgba(59, 130, 246, 0.1),
      inset 0 1px 0 rgba(59, 130, 246, 0.1);
    
    &::after {
      background: linear-gradient(135deg, rgba(59, 130, 246, 0.3), rgba(139, 92, 246, 0.2), transparent);
    }
    
    .module-title {
      color: #60a5fa !important;
      font-weight: 600;
    }
  }
  
  .module-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid rgba(59, 130, 246, 0.1);
    
    .module-icon {
      font-size: 1.5rem;
      padding: 0.75rem;
      background: linear-gradient(135deg, rgba(59, 130, 246, 0.2) 0%, rgba(139, 92, 246, 0.2) 100%);
      border-radius: 12px;
      border: 1px solid rgba(59, 130, 246, 0.2);
      flex-shrink: 0;
    }
    
    .module-info {
      flex: 1;
      
      .module-title {
        font-size: 1.2rem;
        font-weight: 600;
        margin: 0 0 0.5rem 0;
        color: #f1f5f9;
        line-height: 1.3;
      }
      
      .module-period {
        font-size: 0.85rem;
        color: #60a5fa;
        background: rgba(59, 130, 246, 0.15);
        border: 1px solid rgba(59, 130, 246, 0.2);
        padding: 0.3rem 0.8rem;
        border-radius: 8px;
        font-weight: 500;
        display: inline-block;
      }
    }
  }
  
  .module-content {
    .content-section {
      margin-bottom: 1.5rem;
      
      &:last-child {
        margin-bottom: 0;
      }
      
      .section-header {
        margin-bottom: 0.75rem;
        
        .section-title {
          font-size: 1rem;
          font-weight: 600;
          margin: 0;
          color: #e2e8f0;
          padding: 0.5rem 0;
          border-left: 3px solid #3b82f6;
          padding-left: 0.75rem;
          background: rgba(59, 130, 246, 0.05);
          border-radius: 0 8px 8px 0;
        }
      }
      
      .section-content {
        padding-left: 0.75rem;
        
        .detail-item {
          display: flex;
          align-items: flex-start;
          margin-bottom: 0.75rem;
          
          .detail-bullet {
            color: #3b82f6;
            font-weight: bold;
            margin-right: 0.75rem;
            margin-top: 0.1rem;
            flex-shrink: 0;
          }
          
          .detail-text {
            color: #cbd5e1;
            font-size: 0.9rem;
            line-height: 1.6;
            flex: 1;
          }
        }
      }
      
      .simple-content {
        display: flex;
        align-items: flex-start;
        margin-bottom: 0.75rem;
        
        .simple-bullet {
          color: #3b82f6;
          font-weight: bold;
          margin-right: 0.75rem;
          margin-top: 0.1rem;
          flex-shrink: 0;
        }
        
        .simple-text {
          color: #cbd5e1;
          font-size: 0.9rem;
          line-height: 1.6;
          flex: 1;
        }
      }
    }
  }
}

.tech-stack {
  border-top: 1px solid rgba(59, 130, 246, 0.1);
  padding-top: 1.5rem;
  margin-bottom: 1.5rem;
  
  .stack-label {
    font-size: 0.9rem;
    color: #94a3b8;
    margin-bottom: 1rem;
    display: block;
  }
  
  .tech-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    
    .tech-tag {
      font-size: 0.8rem;
      color: #60a5fa;
      background: rgba(59, 130, 246, 0.1);
      border: 1px solid rgba(59, 130, 246, 0.2);
      padding: 0.3rem 0.8rem;
      border-radius: 8px;
      font-weight: 500;
    }
  }
}





// 响应式设计
@media (max-width: 768px) {
  .hero-section {
    padding: 2rem 1rem;
  }
  
  .hero-container {
    gap: 2rem;
  }
  
  .profile-content .name {
    font-size: 2rem;
  }
  
  .content-section {
    padding: 1.5rem 1rem;
  }
  
  .modules-container {
    grid-template-columns: 1fr;
  }
  
  .skills-showcase .skills-grid {
    gap: 0.5rem;
    padding: 1.5rem;
    
    .skill-tag {
      font-size: 0.8rem;
      
      &.large {
        padding: 0.5rem 1.2rem;
        min-height: 32px;
      }
      
      &.small, &.medium {
        min-height: 32px;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
      }
    }
  }
}

@media (max-width: 480px) {
  .skills-showcase .skills-grid {
    gap: 0.4rem;
    padding: 1rem;
    
          .skill-tag {
        font-size: 0.75rem;
        
        &.small {
          padding: 0.4rem 0.6rem;
          min-height: 28px;
        }
        
        &.medium {
          padding: 0.4rem 0.8rem;
          min-height: 28px;
        }
        
        &.large {
          padding: 0.4rem 1rem;
          min-height: 28px;
        }
      }
  }
}

// 加载指示器
.loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #0a0a0a 0%, #1a1a2e 50%, #16213e 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  
  .loading-spinner {
    text-align: center;
    color: #f1f5f9;
    
    .spinner {
      width: 50px;
      height: 50px;
      border: 3px solid rgba(59, 130, 246, 0.3);
      border-top: 3px solid #3b82f6;
      border-radius: 50%;
      animation: spin 1s linear infinite;
      margin: 0 auto 1rem;
    }
    
    p {
      font-size: 1rem;
      color: #94a3b8;
      margin: 0;
    }
  }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>