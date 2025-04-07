<template>
  <div class="crop-info">
    <div class="summary">
      <div class="title">记录总数：{{}}</div>
      <div class="filter-row">
            <span>农产品种类：
              <select>
                <option>不限</option>
                <option>玉米</option>
                <option>水稻</option>
              </select>
            </span>
        <span>月：
              <select>
                <option>不限</option>
                <option>1月</option>
                <option>2月</option>
                <option>3月</option>
                <option>4月</option>
                <option>5月</option>
                <option>6月</option>
                <option>7月</option>
                <option>8月</option>
                <option>9月</option>
                <option>10月</option>
                <option>11月</option>
                <option>12月</option>
              </select>
            </span>
        <span>年：
              <select>
                <option>不限</option>
                <option>2025</option>
                <option>2024</option>
                <option>2023</option>
                <option>2022</option>
                <option>2021</option>
              </select>
            </span>
      </div>
    </div>
    <div class="wrapper">
      <div class="crop-list">
        <div
          class="crop-card"
          v-for="(dev, index) in deviceData"
          :key="index"
        >
          <div class="crop-panel">
            <div class="rows-bar">
              <div class="row">
                <div class="label">调查时间：</div>
                <div class="value">{{ dev.deviceName }}</div>
              </div>
            </div>
            <div class="rows-bar">
              <div class="row">
                <div class="label">农产品种植：</div>
                <div class="value">{{ dev.deviceName }}</div>
              </div>
            </div>
            <div class="rows-bar">
              <div class="row">
                <div class="label">生长周期：</div>
                <div class="value">{{ dev.deviceName }}</div>
              </div>
            </div>
            <div class="l-row">
              <div class="label">长势描述：</div>
              <div class="value wide">{{ dev.vendor }}</div>
            </div>
            <div class="l-row">
              <div class="label">长势照片：</div>
              <div class="photos">
                <div class="photo">照片1</div>
                <div class="photo">照片2</div>
                <div class="photo">照片3</div>
                <div class="photo">照片4</div>
              </div>
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
  name: 'Crop',
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
/* 作物长势 */
.crop-info {
  height: 460px;
  display: flex;
  flex-direction: column;
}

/* 标题 */
.summary {
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;
}
.summary .title {
  line-height: 30px;
}
.filter-row {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}
.filter-row span {
  background: #082045;
  border-radius: 4px;
  padding: 5px 10px;
  display: flex;
  align-items: center;
  gap: 4px;
}
.filter-row select {
  border: none;
  outline: none;
  background: #001a36;
  color: #fff;
  padding: 2px 4px;
  border-radius: 4px;
}

/* 内容 */
.wrapper {
  flex: 1;
  overflow: auto;
}

.crop-list {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  gap: 5px;
}
.crop-card {
  width: 97.5%;
  background: #2c3e50;
  padding: 10px;
  border-radius: 6px;
  display: flex;
  gap: 10px;
}
.crop-panel {
  display: flex;
  flex-wrap: wrap;
}
.crop-panel .rows-bar {
  width: 33%;
}
.crop-panel .row, .l-row {
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 15px;
}
.row .label, .l-row .label {
  width: 100px;
  font-weight: bold;
}
.row .value {
  width: 180px;
}
.l-row .value {
  width: 680px;
}
.value .wide {
  width: auto;
  flex: 1;
}
.crop-card .photos {
  display: flex;
  gap: 10px;
}
.crop-card .photo {
  width: 100px;
  height: 80px;
  background: #fff;
  color: #333;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
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
