<template>
  <div class="subject-info-container">

    <!-- Tab 切换栏 -->
    <div class="tabs">
      <button
        v-for="(tab, index) in tabs"
        :key="index"
        :class="['tab-btn', { active: currentTab === tab.value }]"
        @click="currentTab = tab.value"
      >
        {{ tab.label }}
      </button>
    </div>
    <!-- 内容区 -->
    <div class="tab-content">
      <!-- 地块信息 -->
      <div v-if="currentTab === 'field'">
        <Field />
      </div>

      <!-- 农事任务 -->
      <div v-if="currentTab === 'task'">
        <Task />
      </div>

      <!-- 作物长势 -->
      <div v-if="currentTab === 'crop'">
        <Crop />
      </div>

      <!-- 产量与销售情况 -->
      <div v-if="currentTab === 'sale'">
        <Sale />
      </div>
    </div>
  </div>
</template>

<script>
import Field from '@/components/cover/tab/Field.vue'
import Task from '@/components/cover/tab/Task.vue'
import Crop from '@/components/cover/tab/Crop.vue'
import Sale from '@/components/cover/tab/Sale.vue'

export default {
  name: 'Process',
  components: {
    Field,
    Task,
    Crop,
    Sale
  },
  data () {
    return {
      tabs: [
        { label: '地块信息', value: 'field' },
        { label: '农事任务', value: 'task' },
        { label: '作物长势', value: 'crop' },
        { label: '产量与销售情况', value: 'sale' }
      ],
      currentTab: 'field'
    }
  }
}
</script>

<style scoped>
.subject-info-container {
  width: 100%;
  height: 500px;
  color: #fff;
}

/* Tab 样式 */
.tabs {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
}
.tab-btn {
  background: #0d3572;
  border: 1px solid #0066cc;
  padding: 6px 12px;
  border-radius: 4px;
  color: #fff;
  cursor: pointer;
}
.tab-btn:hover {
  background: #001a36;
}
.tab-btn.active {
  background: #001a36;
  border-color: #00ffff;
}
</style>
