<template>
  <div v-if="stage && module" class="detail-modal-overlay" @click="handleClose">
    <div class="detail-modal" @click.stop>
      <div class="modal-header">
        <div class="stage-badge" :style="{ background: stage.color }">
          <span class="stage-icon">{{ stage.icon }}</span>
          <div class="stage-meta">
            <h2 class="stage-title">{{ stage.title }}</h2>
            <p class="stage-subtitle">{{ stage.subtitle }}</p>
          </div>
        </div>
        
        <button class="modal-close" @click="handleClose">✕</button>
      </div>
      
      <div class="modal-content">
        <div class="module-header">
          <div class="module-icon">{{ module.icon || '📋' }}</div>
          <div class="module-info">
            <h3>{{ module.title }}</h3>
            <div v-if="module.period" class="module-period">{{ module.period }}</div>
            <div v-if="module.position" class="module-position">{{ module.position }}</div>
          </div>
        </div>
        
        <div class="module-details">
          <div 
            v-for="item in module.items"
            :key="item.name"
            class="detail-section"
          >
            <div class="section-header">
              <h4>{{ item.name }}</h4>
            </div>
            
            <div class="section-content">
              <ul class="detail-list">
                <li 
                  v-for="detail in item.details" 
                  :key="detail"
                  class="detail-item"
                >
                  <span class="detail-bullet">•</span>
                  <span class="detail-text">{{ detail }}</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="modal-footer">
          <div class="stage-info">
            <div class="info-item">
              <span class="info-label">所属阶段</span>
              <span class="info-value">{{ stage.title }}</span>
            </div>
            <div class="info-item">
              <span class="info-label">时间周期</span>
              <span class="info-value">{{ stage.duration }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue'

const props = defineProps({
  stage: {
    type: Object,
    default: null
  },
  module: {
    type: Object,
    default: null
  }
})

const emit = defineEmits(['close'])

const handleClose = () => {
  emit('close')
}
</script>

<style lang="scss" scoped>
.detail-modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.8);
  backdrop-filter: blur(10px);
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: center;
  animation: fadeIn 0.3s ease;
}

.detail-modal {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 20px;
  width: 90%;
  max-width: 800px;
  max-height: 90vh;
  overflow: hidden;
  animation: slideIn 0.3s ease;
  color: white;
}

.modal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 2rem;
  background: rgba(0, 0, 0, 0.3);
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  
  .stage-badge {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1rem;
    border-radius: 12px;
    
    .stage-icon {
      font-size: 2rem;
    }
    
    .stage-meta {
      .stage-title {
        margin: 0 0 0.5rem 0;
        font-size: 1.5rem;
        font-weight: 700;
        color: white;
      }
      
      .stage-subtitle {
        margin: 0;
        font-size: 1rem;
        color: rgba(255, 255, 255, 0.8);
      }
    }
  }
  
  .modal-close {
    background: none;
    border: none;
    color: rgba(255, 255, 255, 0.6);
    font-size: 1.5rem;
    cursor: pointer;
    padding: 0.5rem;
    border-radius: 50%;
    transition: all 0.3s ease;
    
    &:hover {
      background: rgba(255, 255, 255, 0.1);
      color: #ff4757;
    }
  }
}

.modal-content {
  padding: 2rem;
  max-height: 60vh;
  overflow-y: auto;
  
  &::-webkit-scrollbar {
    width: 6px;
  }
  
  &::-webkit-scrollbar-track {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 3px;
  }
  
  &::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.3);
    border-radius: 3px;
    
    &:hover {
      background: rgba(255, 255, 255, 0.5);
    }
  }
}

.module-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 2rem;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  
  .module-icon {
    font-size: 2.5rem;
    filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.3));
  }
  
  .module-info {
    flex: 1;
    
    h3 {
      margin: 0 0 0.5rem 0;
      font-size: 1.3rem;
      font-weight: 700;
      color: rgba(255, 255, 255, 0.9);
    }
    
    .module-period, .module-position {
      display: inline-block;
      background: rgba(255, 255, 255, 0.1);
      padding: 0.3rem 0.8rem;
      border-radius: 20px;
      font-size: 0.8rem;
      color: rgba(255, 255, 255, 0.7);
      margin-right: 0.5rem;
      margin-top: 0.5rem;
    }
  }
}

.module-details {
  .detail-section {
    margin-bottom: 2rem;
    
    &:last-child {
      margin-bottom: 0;
    }
    
    .section-header {
      margin-bottom: 1rem;
      
      h4 {
        margin: 0;
        font-size: 1.1rem;
        font-weight: 600;
        color: rgba(255, 255, 255, 0.9);
        padding-bottom: 0.5rem;
        border-bottom: 2px solid rgba(255, 255, 255, 0.1);
      }
    }
    
    .section-content {
      .detail-list {
        margin: 0;
        padding: 0;
        list-style: none;
        
        .detail-item {
          display: flex;
          align-items: flex-start;
          gap: 0.8rem;
          margin-bottom: 0.8rem;
          padding: 0.8rem;
          background: rgba(255, 255, 255, 0.03);
          border-radius: 8px;
          border: 1px solid rgba(255, 255, 255, 0.05);
          transition: all 0.3s ease;
          
          &:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
          }
          
          &:last-child {
            margin-bottom: 0;
          }
          
          .detail-bullet {
            color: #2E86AB;
            font-weight: bold;
            font-size: 1.2rem;
            line-height: 1;
            margin-top: 0.1rem;
            flex-shrink: 0;
          }
          
          .detail-text {
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.5;
            flex: 1;
          }
        }
      }
    }
  }
}

.modal-footer {
  margin-top: 2rem;
  padding-top: 1.5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  
  .stage-info {
    display: flex;
    gap: 2rem;
    flex-wrap: wrap;
    
    .info-item {
      display: flex;
      flex-direction: column;
      gap: 0.3rem;
      
      .info-label {
        font-size: 0.8rem;
        color: rgba(255, 255, 255, 0.6);
        text-transform: uppercase;
        letter-spacing: 0.5px;
      }
      
      .info-value {
        font-size: 0.9rem;
        color: rgba(255, 255, 255, 0.9);
        font-weight: 500;
      }
    }
  }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideIn {
  from { 
    opacity: 0;
    transform: scale(0.9) translateY(-20px);
  }
  to { 
    opacity: 1;
    transform: scale(1) translateY(0);
  }
}

// 响应式设计
@media (max-width: 768px) {
  .detail-modal {
    width: 95%;
    margin: 1rem;
    max-height: 95vh;
  }
  
  .modal-header {
    padding: 1.5rem;
    flex-direction: column;
    align-items: flex-start;
    gap: 1rem;
    
    .modal-close {
      position: absolute;
      top: 1rem;
      right: 1rem;
    }
    
    .stage-badge {
      width: 100%;
      
      .stage-meta {
        .stage-title {
          font-size: 1.2rem;
        }
      }
    }
  }
  
  .modal-content {
    padding: 1.5rem;
  }
  
  .module-header {
    flex-direction: column;
    align-items: flex-start;
    text-align: center;
    
    .module-info {
      width: 100%;
      
      h3 {
        font-size: 1.1rem;
      }
    }
  }
  
  .stage-info {
    flex-direction: column;
    gap: 1rem;
  }
}
</style>