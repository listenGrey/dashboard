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
      <!-- 基本情况 -->
      <div v-if="currentTab === 'basic'">
        <Basic />
      </div>

      <!-- 人员情况 -->
      <div v-if="currentTab === 'person'">
        <Person />
      </div>

      <!-- 农机设备 -->
      <div v-if="currentTab === 'device'">
        <Device />
      </div>
    </div>
  </div>
</template>

<script>
import Basic from '@/components/cover/tab/Basic.vue'
import Person from '@/components/cover/tab/Person.vue'
import Device from '@/components/cover/tab/Device.vue'

export default {
  name: 'Entity',
  components: {
    Basic,
    Person,
    Device
  },
  data () {
    return {
      tabs: [
        { label: '基本情况', value: 'basic' },
        { label: '人员情况', value: 'person' },
        { label: '农机设备', value: 'device' }
      ],
      currentTab: 'basic'
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
