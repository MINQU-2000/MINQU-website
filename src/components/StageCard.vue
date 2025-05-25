<template>
  <div class="stage-card" :class="`stage-${index}`">
    <el-card class="stage-content hover-lift" :style="{ borderLeft: `4px solid ${stage.color}` }">
      <div class="stage-header">
        <div class="stage-info">
          <div class="stage-icon" :style="{ background: stage.color }">
            {{ stage.icon }}
          </div>
          <div class="stage-title-area">
            <h2 class="stage-title">{{ stage.title }}</h2>
            <p class="stage-subtitle">{{ stage.subtitle }}</p>
          </div>
        </div>
        <div class="stage-meta">
          <el-tag :color="stage.color" class="duration-tag">
            <el-icon><Clock /></el-icon>
            {{ stage.duration }}
          </el-tag>
        </div>
      </div>
      
      <div class="stage-description">
        <p>{{ stage.description }}</p>
      </div>
      
      <div class="stage-modules">
        <div 
          v-for="module in stage.modules" 
          :key="module.id"
          class="module-item"
        >
          <div class="module-header">
            <el-icon class="module-icon"><Grid /></el-icon>
            <h4>{{ module.title }}</h4>
            <span v-if="module.icon" class="module-emoji">{{ module.icon }}</span>
          </div>
          
          <div class="module-items">
            <div 
              v-for="item in module.items"
              :key="item.name"
              class="research-item"
            >
              <h5 class="item-name">{{ item.name }}</h5>
              <ul class="item-details">
                <li v-for="detail in item.details" :key="detail">{{ detail }}</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <div class="stage-footer">
        <div class="tech-stack">
          <span class="tech-label">技术栈：</span>
          <el-tag 
            v-for="tech in stage.techStack" 
            :key="tech"
            size="small"
            type="info"
            class="tech-tag"
          >
            {{ tech }}
          </el-tag>
        </div>
        
        <div class="stage-outputs">
          <span class="output-label">预期产出：</span>
          <el-tag 
            v-for="output in stage.output" 
            :key="output"
            size="small"
            type="success"
            class="output-tag"
          >
            {{ output }}
          </el-tag>
        </div>
        
        <div class="stage-actions">
          <el-button 
            type="primary" 
            :color="stage.color"
            @click="$emit('show-detail', stage)"
            round
          >
            <el-icon><View /></el-icon>
            查看详情
          </el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { Clock, Grid, View } from '@element-plus/icons-vue'

defineProps({
  stage: {
    type: Object,
    required: true
  },
  index: {
    type: Number,
    required: true
  }
})

defineEmits(['show-detail'])
</script>

<style lang="scss" scoped>
.stage-card {
  margin: 20px 0;
  
  &.stage-0 .stage-content {
    background: linear-gradient(135deg, rgba(46, 134, 171, 0.05), rgba(46, 134, 171, 0.02));
  }
  
  &.stage-1 .stage-content {
    background: linear-gradient(135deg, rgba(162, 59, 114, 0.05), rgba(162, 59, 114, 0.02));
  }
  
  &.stage-2 .stage-content {
    background: linear-gradient(135deg, rgba(241, 143, 1, 0.05), rgba(241, 143, 1, 0.02));
  }
  
  &.stage-3 .stage-content {
    background: linear-gradient(135deg, rgba(199, 62, 29, 0.05), rgba(199, 62, 29, 0.02));
  }
  
  &.stage-4 .stage-content {
    background: linear-gradient(135deg, rgba(40, 167, 69, 0.05), rgba(40, 167, 69, 0.02));
  }
}

.stage-content {
  border-radius: 20px;
  border: none;
  box-shadow: 0 8px 40px rgba(0, 0, 0, 0.1);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  
  &:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.15);
  }
}

.stage-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  margin-bottom: 20px;
  gap: 20px;
}

.stage-info {
  display: flex;
  align-items: center;
  gap: 15px;
  flex: 1;
}

.stage-icon {
  width: 60px;
  height: 60px;
  border-radius: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  color: white;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.stage-title-area {
  .stage-title {
    font-size: 1.5rem;
    font-weight: 700;
    margin: 0 0 5px 0;
    color: #333;
  }
  
  .stage-subtitle {
    font-size: 1rem;
    color: var(--neutral-color);
    margin: 0;
    font-style: italic;
  }
}

.stage-meta {
  .duration-tag {
    border: none;
    color: white;
    font-weight: 600;
    padding: 8px 15px;
    border-radius: 20px;
    display: flex;
    align-items: center;
    gap: 5px;
  }
}

.stage-description {
  background: rgba(255, 255, 255, 0.8);
  padding: 15px 20px;
  border-radius: 12px;
  margin-bottom: 25px;
  border-left: 4px solid var(--primary-color);
  
  p {
    margin: 0;
    font-size: 1rem;
    line-height: 1.6;
    color: #555;
  }
}

.stage-modules {
  margin-bottom: 25px;
}

.module-item {
  background: rgba(247, 250, 252, 0.8);
  border-radius: 12px;
  padding: 20px;
  margin-bottom: 20px;
  border: 1px solid rgba(0, 0, 0, 0.05);
  
  &:last-child {
    margin-bottom: 0;
  }
}

.module-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 15px;
  
  .module-icon {
    color: var(--primary-color);
    font-size: 1.2rem;
  }
  
  h4 {
    font-size: 1.1rem;
    font-weight: 600;
    margin: 0;
    color: #333;
    flex: 1;
  }
  
  .module-emoji {
    font-size: 1.2rem;
  }
}

.module-items {
  display: grid;
  gap: 15px;
}

.research-item {
  background: white;
  padding: 15px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.item-name {
  font-size: 1rem;
  font-weight: 600;
  color: var(--primary-color);
  margin: 0 0 10px 0;
}

.item-details {
  margin: 0;
  padding-left: 20px;
  
  li {
    color: #666;
    font-size: 0.9rem;
    line-height: 1.5;
    margin-bottom: 5px;
    
    &:last-child {
      margin-bottom: 0;
    }
  }
}

.stage-footer {
  border-top: 1px solid rgba(0, 0, 0, 0.1);
  padding-top: 20px;
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.tech-stack, .stage-outputs {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}

.tech-label, .output-label {
  font-weight: 600;
  color: #333;
  margin-right: 5px;
}

.tech-tag, .output-tag {
  margin-right: 5px;
  margin-bottom: 5px;
}

.stage-actions {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}

@media (max-width: 768px) {
  .stage-header {
    flex-direction: column;
    gap: 15px;
  }
  
  .stage-info {
    flex-direction: column;
    text-align: center;
    gap: 10px;
  }
  
  .stage-icon {
    width: 50px;
    height: 50px;
    font-size: 1.5rem;
  }
  
  .stage-title {
    font-size: 1.3rem !important;
  }
  
  .tech-stack, .stage-outputs {
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
  }
}
</style>