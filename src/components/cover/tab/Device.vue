<template>
  <div class="device-info">
    <div class="summary">设备总数：108台</div>
    <div class="wrapper">
      <div class="device-list">
        <div
          class="device-card"
          v-for="(dev, index) in deviceData"
          :key="index"
        >
          <div class="photo">照片</div>
          <div class="info">
            <div>设备名称：{{ dev.deviceName }}</div>
            <div>识别厂家：{{ dev.vendor }}</div>
            <div>分类：{{ dev.category }}</div>
            <div>厂家型号：{{ dev.model }}</div>
            <div :class="['gps-status', dev.gps ? 'has-gps' : 'no-gps']">
              {{ dev.gps ? 'GPS' : '无GPS' }}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="pagination">
      <button @click="goPrev" :disabled="page <= 1">上一页</button>
      <span class="page-num">{{ page }} / {{ totalPages }}</span>
      <button @click="goNext" :disabled="page >= totalPages">下一页</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Device',
  data () {
    return {
      // 农机设备示例数据
      deviceData: [
        { deviceName: '设备xxx', vendor: 'xxxxxxxxxx公司', category: '防护设备', model: 'RGB-123456', gps: true },
        { deviceName: '设备xxx', vendor: 'xxxxxxxxxx公司', category: '防护设备', model: 'RGB-123456', gps: false }
      ],
      // 分页
      page: 1,
      pageSize: 3,
      totalPages: 1
    }
  },
  methods: {
    goPrev () {
      if (this.page > 1) {
        this.page--
      }
    },
    goNext () {
      if (this.page < this.totalPages) {
        this.page++
      }
    }
  }
}
</script>

<style scoped lang="less">
.wrapper {
  flex: 1;
  overflow: auto;
}

/* 农机设备 */
.device-info {
  height: 460px;
  display: flex;
  flex-direction: column;
}
.device-info .summary {
  margin-bottom: 10px;
}
.device-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}
.device-card {
  width: 45%;
  background: #2c3e50;
  padding: 10px;
  border-radius: 6px;
  display: flex;
  gap: 10px;
}
.device-card .photo {
  width: 60px;
  height: 60px;
  background: #fff;
  color: #333;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
}
.device-card .info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 4px;
}
.gps-status {
  font-weight: bold;
  color: #00ffff;
}
.gps-status.no-gps {
  color: #fff;
}

/* 分页 */
.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
}
.pagination button {
  background: transparent;
  color: #fff;
  border: 1px solid #fff;
  margin: 0 5px;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
}
.pagination .page-num {
  color: #fff;
}
</style>
