<template>
  <div class="skills-section">
    <!-- 技能展示头部 -->
    <div class="skills-header">
      <h2 class="section-title">专业技能</h2>
      <p class="section-subtitle">Professional Skills & Expertise</p>
    </div>
    
    <!-- 技能统计概览 -->
    <div class="skills-overview">
      <div class="overview-grid">
        <div class="stat-card">
          <div class="stat-icon">🎯</div>
          <div class="stat-content">
            <div class="stat-value">{{ totalSkills }}</div>
            <div class="stat-label">总技能数</div>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">⚡</div>
          <div class="stat-content">
            <div class="stat-value">{{ expertSkills }}</div>
            <div class="stat-label">专家级技能</div>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">📈</div>
          <div class="stat-content">
            <div class="stat-value">{{ averageLevel }}%</div>
            <div class="stat-label">平均熟练度</div>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-icon">🏆</div>
          <div class="stat-content">
            <div class="stat-value">{{ topCategories }}</div>
            <div class="stat-label">优势领域</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 技能分类展示 -->
    <div class="skills-grid">
      <div 
        v-for="(category, categoryIndex) in skillCategories" 
        :key="category.id"
        class="skill-category"
      >
        <!-- 分类头部 -->
        <div class="category-header">
          <div class="category-icon" :style="{ backgroundColor: category.color }">
            {{ category.icon }}
          </div>
          <div class="category-info">
            <h3 class="category-title">{{ category.title }}</h3>
            <div class="category-stats">
              <span class="skill-count">{{ category.skills.length }} 项技能</span>
              <span class="avg-level">平均 {{ Math.round(category.skills.reduce((sum, skill) => sum + skill.level, 0) / category.skills.length) }}%</span>
            </div>
          </div>
        </div>
        
        <!-- 技能列表 -->
        <div class="skills-list">
          <div 
            v-for="(skill, skillIndex) in category.skills" 
            :key="skill.name"
            class="skill-item"
          >
            <div class="skill-header">
              <span class="skill-name">{{ skill.name }}</span>
              <div class="skill-level">
                <span class="level-text">{{ skill.level }}%</span>
                <div class="level-badge" :class="getLevelClass(skill.level)">
                  {{ getLevelText(skill.level) }}
                </div>
              </div>
            </div>
            
            <!-- 进度条 -->
            <div class="skill-progress">
              <div class="progress-track">
                <div 
                  class="progress-fill" 
                  :style="{ 
                    width: skill.level + '%',
                    backgroundColor: category.color 
                  }"
                ></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 技能雷达图 -->
    <div class="skills-radar">
      <h3 class="radar-title">技能雷达图</h3>
      <div class="radar-container">
        <div class="radar-chart">
          <!-- 雷达网格 -->
          <div class="radar-grid">
            <div class="grid-circle" v-for="i in 5" :key="i"></div>
            <div class="grid-line" v-for="i in 4" :key="i" :style="{ transform: `rotate(${i * 90}deg)` }"></div>
          </div>
          
          <!-- 雷达点 -->
          <div class="radar-points">
            <div 
              v-for="(category, index) in skillCategories" 
              :key="category.id"
              class="radar-point"
              :style="{ 
                transform: `rotate(${index * 90}deg) translateY(-${getRadarDistance(category)}px) rotate(-${index * 90}deg)`,
                backgroundColor: category.color 
              }"
            >
              <div class="point-label">{{ category.title }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const skillCategories = ref([
  {
    id: 'design',
    title: '设计工具',
    icon: '🎨',
    color: '#3b82f6',
    skills: [
      { name: 'Figma', level: 95 },
      { name: 'Adobe Creative Suite', level: 90 },
      { name: 'Sketch', level: 85 },
      { name: 'Rhino', level: 88 },
      { name: 'Keyshot', level: 85 },
      { name: 'Midjourney', level: 92 }
    ]
  },
  {
    id: 'development',
    title: '开发技术',
    icon: '💻',
    color: '#8b5cf6',
    skills: [
      { name: 'HTML/CSS', level: 85 },
      { name: 'JavaScript', level: 80 },
      { name: 'Vue.js', level: 75 },
      { name: 'Python', level: 82 },
      { name: 'Unity3D', level: 78 }
    ]
  },
  {
    id: 'research',
    title: '研究能力',
    icon: '🔬',
    color: '#06b6d4',
    skills: [
      { name: '用户研究', level: 90 },
      { name: '数据分析', level: 85 },
      { name: '学术写作', level: 92 },
      { name: '项目管理', level: 88 },
      { name: '创新设计', level: 95 }
    ]
  },
  {
    id: 'languages',
    title: '语言能力',
    icon: '🌐',
    color: '#10b981',
    skills: [
      { name: '中文（母语）', level: 100 },
      { name: '英语（CET6）', level: 85 },
      { name: '学术英语', level: 88 }
    ]
  }
])

// 计算属性
const totalSkills = computed(() => {
  return skillCategories.value.reduce((total, category) => total + category.skills.length, 0)
})

const expertSkills = computed(() => {
  return skillCategories.value.reduce((total, category) => {
    return total + category.skills.filter(skill => skill.level >= 90).length
  }, 0)
})

const averageLevel = computed(() => {
  const allSkills = skillCategories.value.flatMap(category => category.skills)
  const totalLevel = allSkills.reduce((sum, skill) => sum + skill.level, 0)
  return Math.round(totalLevel / allSkills.length)
})

const topCategories = computed(() => {
  return skillCategories.value.filter(category => {
    const avgLevel = category.skills.reduce((sum, skill) => sum + skill.level, 0) / category.skills.length
    return avgLevel >= 85
  }).length
})

// 方法
const getLevelClass = (level) => {
  if (level >= 90) return 'expert'
  if (level >= 80) return 'advanced'
  if (level >= 70) return 'intermediate'
  return 'beginner'
}

const getLevelText = (level) => {
  if (level >= 90) return '专家'
  if (level >= 80) return '熟练'
  if (level >= 70) return '良好'
  return '基础'
}

const getRadarDistance = (category) => {
  const avgLevel = category.skills.reduce((sum, skill) => sum + skill.level, 0) / category.skills.length
  return (avgLevel / 100) * 80 + 20 // 20-100px range
}
</script>

<style lang="scss" scoped>
.skills-section {
  padding: 4rem 2rem;
  background: rgba(15, 23, 42, 0.8);
  backdrop-filter: blur(20px);
  border-radius: 24px;
  margin: 4rem 0;
  position: relative;
  border: 1px solid rgba(59, 130, 246, 0.1);
}

// 技能展示头部
.skills-header {
  text-align: center;
  margin-bottom: 3rem;
  
  .section-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin: 0 0 0.5rem 0;
    background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .section-subtitle {
    font-size: 1.1rem;
    color: #94a3b8;
    margin: 0;
    font-style: italic;
  }
}

// 技能统计概览
.skills-overview {
  margin-bottom: 3rem;
  
  .overview-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
    max-width: 800px;
    margin: 0 auto;
  }
  
  .stat-card {
    background: rgba(30, 41, 59, 0.8);
    backdrop-filter: blur(20px);
    border-radius: 16px;
    padding: 1.5rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    box-shadow: 
      0 4px 16px rgba(0, 0, 0, 0.2),
      inset 0 1px 0 rgba(59, 130, 246, 0.1);
    border: 1px solid rgba(59, 130, 246, 0.1);
    transition: all 0.3s ease;
    
    &:hover {
      transform: translateY(-2px);
      box-shadow: 
        0 8px 24px rgba(0, 0, 0, 0.3),
        inset 0 1px 0 rgba(59, 130, 246, 0.2);
      border-color: rgba(59, 130, 246, 0.2);
    }
    
    .stat-icon {
      font-size: 2rem;
      padding: 0.75rem;
      background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
      border-radius: 12px;
      color: white;
      box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
    }
    
    .stat-content {
      flex: 1;
      
      .stat-value {
        font-size: 1.8rem;
        font-weight: 700;
        color: #f1f5f9;
        margin-bottom: 0.25rem;
      }
      
      .stat-label {
        font-size: 0.9rem;
        color: #94a3b8;
        font-weight: 500;
      }
    }
  }
}

// 技能分类网格
.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 2rem;
  margin-bottom: 3rem;
}

.skill-category {
  background: rgba(30, 41, 59, 0.8);
  backdrop-filter: blur(20px);
  border-radius: 20px;
  padding: 2rem;
  box-shadow: 
    0 4px 16px rgba(0, 0, 0, 0.2),
    inset 0 1px 0 rgba(59, 130, 246, 0.1);
  border: 1px solid rgba(59, 130, 246, 0.1);
  transition: all 0.3s ease;
  
  &:hover {
    transform: translateY(-4px);
    box-shadow: 
      0 8px 32px rgba(0, 0, 0, 0.3),
      inset 0 1px 0 rgba(59, 130, 246, 0.2);
    border-color: rgba(59, 130, 246, 0.2);
  }
}

// 分类头部
.category-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 2rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid rgba(59, 130, 246, 0.1);
  
  .category-icon {
    width: 60px;
    height: 60px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    color: white;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
  }
  
  .category-info {
    flex: 1;
    
    .category-title {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 0 0 0.5rem 0;
      color: #f1f5f9;
    }
    
    .category-stats {
      display: flex;
      gap: 1rem;
      
      span {
        font-size: 0.8rem;
        color: #94a3b8;
        padding: 0.25rem 0.75rem;
        background: rgba(59, 130, 246, 0.1);
        border-radius: 12px;
        font-weight: 500;
      }
    }
  }
}

// 技能列表
.skills-list {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.skill-item {
  .skill-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 0.75rem;
    
    .skill-name {
      font-size: 1rem;
      font-weight: 500;
      color: #e2e8f0;
    }
    
    .skill-level {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      
      .level-text {
        font-size: 0.9rem;
        font-weight: 600;
        color: #94a3b8;
      }
      
      .level-badge {
        font-size: 0.7rem;
        padding: 0.2rem 0.6rem;
        border-radius: 8px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        
        &.expert {
          background: rgba(16, 185, 129, 0.2);
          color: #10b981;
          border: 1px solid rgba(16, 185, 129, 0.3);
        }
        
        &.advanced {
          background: rgba(59, 130, 246, 0.2);
          color: #3b82f6;
          border: 1px solid rgba(59, 130, 246, 0.3);
        }
        
        &.intermediate {
          background: rgba(245, 158, 11, 0.2);
          color: #f59e0b;
          border: 1px solid rgba(245, 158, 11, 0.3);
        }
        
        &.beginner {
          background: rgba(239, 68, 68, 0.2);
          color: #ef4444;
          border: 1px solid rgba(239, 68, 68, 0.3);
        }
      }
    }
  }
}

// 进度条
.skill-progress {
  .progress-track {
    width: 100%;
    height: 8px;
    background: rgba(59, 130, 246, 0.1);
    border-radius: 4px;
    overflow: hidden;
    position: relative;
    
    .progress-fill {
      height: 100%;
      border-radius: 4px;
      transition: width 1.5s ease-out;
      position: relative;
      
      &::after {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        width: 20px;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3));
        animation: shimmer 2s infinite;
      }
    }
  }
}

@keyframes shimmer {
  0% { transform: translateX(-20px); }
  100% { transform: translateX(20px); }
}

// 技能雷达图
.skills-radar {
  margin-top: 3rem;
  
  .radar-title {
    text-align: center;
    font-size: 1.5rem;
    font-weight: 600;
    color: #f1f5f9;
    margin-bottom: 2rem;
  }
  
  .radar-container {
    display: flex;
    justify-content: center;
    
    .radar-chart {
      position: relative;
      width: 300px;
      height: 300px;
      
      .radar-grid {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        
        .grid-circle {
          position: absolute;
          top: 50%;
          left: 50%;
          border: 1px solid rgba(59, 130, 246, 0.2);
          border-radius: 50%;
          transform: translate(-50%, -50%);
          
          &:nth-child(1) { width: 60px; height: 60px; }
          &:nth-child(2) { width: 120px; height: 120px; }
          &:nth-child(3) { width: 180px; height: 180px; }
          &:nth-child(4) { width: 240px; height: 240px; }
          &:nth-child(5) { width: 300px; height: 300px; }
        }
        
        .grid-line {
          position: absolute;
          top: 50%;
          left: 50%;
          width: 1px;
          height: 150px;
          background: rgba(59, 130, 246, 0.2);
          transform-origin: bottom;
        }
      }
      
      .radar-points {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        
        .radar-point {
          position: absolute;
          width: 12px;
          height: 12px;
          border-radius: 50%;
          border: 3px solid rgba(15, 23, 42, 0.8);
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
          
          .point-label {
            position: absolute;
            top: -30px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 0.8rem;
            color: #94a3b8;
            font-weight: 500;
            white-space: nowrap;
            background: rgba(15, 23, 42, 0.9);
            padding: 0.25rem 0.5rem;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(59, 130, 246, 0.1);
          }
        }
      }
    }
  }
}

// 响应式设计
@media (max-width: 768px) {
  .skills-section {
    padding: 2rem 1rem;
  }
  
  .skills-header .section-title {
    font-size: 2rem;
  }
  
  .overview-grid {
    grid-template-columns: repeat(2, 1fr) !important;
  }
  
  .skills-grid {
    grid-template-columns: 1fr;
  }
  
  .skill-category {
    padding: 1.5rem;
  }
  
  .radar-chart {
    width: 250px !important;
    height: 250px !important;
  }
}

@media (max-width: 480px) {
  .overview-grid {
    grid-template-columns: 1fr !important;
  }
  
  .category-header {
    flex-direction: column;
    text-align: center;
    gap: 1rem;
  }
  
  .skill-header {
    flex-direction: column !important;
    align-items: flex-start !important;
    gap: 0.5rem !important;
  }
}
</style> 