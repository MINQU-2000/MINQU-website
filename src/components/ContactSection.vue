<template>
  <div class="contact-section">
    <div class="contact-header">
      <h2 class="section-title">联系我</h2>
      <p class="section-subtitle">Get In Touch</p>
      <p class="contact-description">
        欢迎与我交流设计理念、学术研究或合作机会。我很乐意与您分享我的经验和见解。
      </p>
    </div>
    
    <div class="contact-content">
      <div class="contact-info">
        <div class="contact-card">
          <div class="card-icon">📧</div>
          <h3>邮箱</h3>
          <p>{{ personalInfo.email }}</p>
          <a :href="`mailto:${personalInfo.email}`" class="contact-btn">发送邮件</a>
        </div>
        
        <div class="contact-card">
          <div class="card-icon">📱</div>
          <h3>电话</h3>
          <p>{{ personalInfo.phone }}</p>
          <a :href="`tel:${personalInfo.phone}`" class="contact-btn">拨打电话</a>
        </div>
        
        <div class="contact-card">
          <div class="card-icon">🎓</div>
          <h3>学术机构</h3>
          <p>南京理工大学<br>设计艺术与传媒学院</p>
          <div class="contact-btn disabled">工业设计工程</div>
        </div>
      </div>
      
      <div class="contact-form">
        <h3>快速联系</h3>
        <form @submit.prevent="handleSubmit" class="form">
          <div class="form-group">
            <label for="name">姓名</label>
            <input 
              type="text" 
              id="name" 
              v-model="form.name" 
              placeholder="请输入您的姓名"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="email">邮箱</label>
            <input 
              type="email" 
              id="email" 
              v-model="form.email" 
              placeholder="请输入您的邮箱"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="subject">主题</label>
            <select id="subject" v-model="form.subject" required>
              <option value="">请选择联系主题</option>
              <option value="collaboration">合作机会</option>
              <option value="academic">学术交流</option>
              <option value="design">设计咨询</option>
              <option value="other">其他</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="message">留言</label>
            <textarea 
              id="message" 
              v-model="form.message" 
              placeholder="请输入您的留言内容"
              rows="5"
              required
            ></textarea>
          </div>
          
          <button type="submit" class="submit-btn" :disabled="isSubmitting">
            <span v-if="!isSubmitting">发送消息</span>
            <span v-else>发送中...</span>
          </button>
        </form>
      </div>
    </div>
    
    <div class="social-links">
      <h3>关注我的动态</h3>
      <div class="social-grid">
        <a href="#" class="social-link" title="学术主页">
          <div class="social-icon">🎓</div>
          <span>学术主页</span>
        </a>
        <a href="#" class="social-link" title="设计作品集">
          <div class="social-icon">🎨</div>
          <span>设计作品</span>
        </a>
        <a href="#" class="social-link" title="研究成果">
          <div class="social-icon">📚</div>
          <span>研究成果</span>
        </a>
        <a href="#" class="social-link" title="专业博客">
          <div class="social-icon">✍️</div>
          <span>专业博客</span>
        </a>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { roadmapData } from '../data/roadmapData.js'

const personalInfo = computed(() => roadmapData.personalInfo)

const form = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const isSubmitting = ref(false)

const handleSubmit = async () => {
  isSubmitting.value = true
  
  // 模拟表单提交
  try {
    // 这里可以集成真实的邮件发送服务
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    // 构建邮件链接
    const subject = encodeURIComponent(`[个人网站联系] ${form.value.subject} - ${form.value.name}`)
    const body = encodeURIComponent(`
姓名: ${form.value.name}
邮箱: ${form.value.email}
主题: ${form.value.subject}

留言内容:
${form.value.message}
    `)
    
    const mailtoLink = `mailto:${personalInfo.value.email}?subject=${subject}&body=${body}`
    window.open(mailtoLink)
    
    // 重置表单
    form.value = {
      name: '',
      email: '',
      subject: '',
      message: ''
    }
    
    alert('感谢您的留言！邮件客户端已打开，请发送邮件。')
  } catch (error) {
    alert('发送失败，请稍后重试或直接发送邮件。')
  } finally {
    isSubmitting.value = false
  }
}
</script>

<style lang="scss" scoped>
.contact-section {
  padding: 4rem 2rem;
  background: rgba(15, 23, 42, 0.8);
  backdrop-filter: blur(20px);
  border-radius: 24px;
  margin: 4rem 0;
  border: 1px solid rgba(59, 130, 246, 0.1);
}

.contact-header {
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
    margin: 0 0 1rem 0;
    font-style: italic;
  }
  
  .contact-description {
    max-width: 600px;
    margin: 0 auto;
    color: #cbd5e1;
    line-height: 1.6;
  }
}

.contact-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 3rem;
  margin-bottom: 3rem;
  
  @media (max-width: 968px) {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
}

.contact-info {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.contact-card {
  background: rgba(30, 41, 59, 0.8);
  backdrop-filter: blur(20px);
  border-radius: 16px;
  padding: 2rem;
  text-align: center;
  border: 1px solid rgba(59, 130, 246, 0.1);
  transition: all 0.3s ease;
  
  &:hover {
    transform: translateY(-4px);
    border-color: rgba(59, 130, 246, 0.2);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
  }
  
  .card-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    padding: 1rem;
    background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
    border-radius: 16px;
    display: inline-block;
    box-shadow: 0 4px 16px rgba(59, 130, 246, 0.3);
  }
  
  h3 {
    font-size: 1.3rem;
    font-weight: 600;
    margin: 0 0 1rem 0;
    color: #f1f5f9;
  }
  
  p {
    color: #94a3b8;
    margin: 0 0 1.5rem 0;
    line-height: 1.5;
  }
  
  .contact-btn {
    display: inline-block;
    padding: 0.75rem 1.5rem;
    background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
    
    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 16px rgba(59, 130, 246, 0.4);
    }
    
    &.disabled {
      background: rgba(59, 130, 246, 0.2);
      cursor: not-allowed;
      
      &:hover {
        transform: none;
        box-shadow: none;
      }
    }
  }
}

.contact-form {
  background: rgba(30, 41, 59, 0.8);
  backdrop-filter: blur(20px);
  border-radius: 16px;
  padding: 2rem;
  border: 1px solid rgba(59, 130, 246, 0.1);
  
  h3 {
    font-size: 1.5rem;
    font-weight: 600;
    margin: 0 0 2rem 0;
    color: #f1f5f9;
    text-align: center;
  }
}

.form {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  
  label {
    font-size: 0.9rem;
    font-weight: 500;
    color: #e2e8f0;
  }
  
  input,
  select,
  textarea {
    padding: 0.75rem 1rem;
    background: rgba(15, 23, 42, 0.8);
    border: 1px solid rgba(59, 130, 246, 0.2);
    border-radius: 8px;
    color: #f1f5f9;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    
    &:focus {
      outline: none;
      border-color: #3b82f6;
      box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }
    
    &::placeholder {
      color: #64748b;
    }
  }
  
  textarea {
    resize: vertical;
    min-height: 120px;
  }
}

.submit-btn {
  padding: 1rem 2rem;
  background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  
  &:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 4px 16px rgba(59, 130, 246, 0.4);
  }
  
  &:disabled {
    opacity: 0.6;
    cursor: not-allowed;
  }
}

.social-links {
  text-align: center;
  
  h3 {
    font-size: 1.3rem;
    font-weight: 600;
    margin: 0 0 2rem 0;
    color: #f1f5f9;
  }
}

.social-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 1rem;
  max-width: 600px;
  margin: 0 auto;
}

.social-link {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.75rem;
  padding: 1.5rem 1rem;
  background: rgba(30, 41, 59, 0.6);
  border: 1px solid rgba(59, 130, 246, 0.1);
  border-radius: 12px;
  text-decoration: none;
  color: #e2e8f0;
  transition: all 0.3s ease;
  
  &:hover {
    transform: translateY(-4px);
    border-color: rgba(59, 130, 246, 0.3);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
  }
  
  .social-icon {
    font-size: 2rem;
    padding: 0.75rem;
    background: rgba(59, 130, 246, 0.1);
    border-radius: 12px;
    transition: all 0.3s ease;
  }
  
  span {
    font-size: 0.9rem;
    font-weight: 500;
  }
  
  &:hover .social-icon {
    background: rgba(59, 130, 246, 0.2);
    transform: scale(1.1);
  }
}

// 响应式设计
@media (max-width: 768px) {
  .contact-section {
    padding: 2rem 1rem;
  }
  
  .contact-header .section-title {
    font-size: 2rem;
  }
  
  .contact-card {
    padding: 1.5rem;
  }
  
  .contact-form {
    padding: 1.5rem;
  }
  
  .social-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 480px) {
  .social-grid {
    grid-template-columns: 1fr;
  }
}
</style> 