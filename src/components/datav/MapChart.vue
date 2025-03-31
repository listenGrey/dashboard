<template>
  <div class="map-container">

    <div class="map-title">
      <dv-decoration-1 style="width:200px;height:50px;" />
      <div>省份数据地图</div>
      <dv-decoration-1 style="width:200px;height:50px;" />
    </div>

    <div class="map-main">
      <div ref="chinaMap" class="map-chart"></div>
    </div>
    <div class="legend">
      <div><span class="color-block" style="background: #3b6fe7;"></span>已开展业务省份</div>
      <div><span class="color-block" style="background: #e5eae5;"></span>未开展业务省份</div>
    </div>

    <div v-if="showInfo" class="info-box" :style="{ left: infoPosition.x + 'px', top: infoPosition.y + 'px' }">
      <h3>{{ selectedProvince }}</h3>
      <ul>
        <li v-for="(project, index) in provinceData[selectedProvince]" :key="index">
          <div @click="goToProject(project.id)">
            <strong>{{ project.name }}</strong><br />
            {{ project.address }}
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import chinaJson from '@/assets/china.json'

export default {
  data () {
    return {
      mapChart: null,
      showInfo: false, // 控制信息框是否显示
      selectedProvince: '', // 选中的省份
      infoPosition: { x: 0, y: 0 }, // 信息框的位置
      provinceData: {
        '湖南省': [
          { id: '000001', name: '桂东县项目', address: '郴州市桂东县' },
          { id: '000002', name: '湖南项目2', address: '郴州市桂东县' }
        ],
        '四川省': [
          { id: '000003', name: '富顺县项目', address: '自贡市富顺县' },
          { id: '000004', name: '四川项目2', address: '成都市' }
        ],
        '海南省': [
          { id: '000005', name: '海南项目1', address: '三亚市1号' },
          { id: '000006', name: '海南项目2', address: '三亚市2号' }
        ],
        '内蒙古自治区': [
          { id: '000007', name: '呼和浩特市项目1', address: '呼和浩特市新城区1号' },
          { id: '000008', name: '呼和浩特市项目2', address: '呼和浩特市赛罕区2号' }
        ]
      }
    }
  },
  mounted () {
    this.initMap()
    /**/
    document.addEventListener('click', this.onDocumentClick)
  },
  methods: {
    initMap () {
      this.mapChart = echarts.init(this.$refs.chinaMap)

      echarts.registerMap('china', chinaJson)

      const option = {
        tooltip: {
          trigger: 'item',
          formatter: (params) => `<strong>${params.name}</strong>`
        },
        visualMap: {
          show: false,
          pieces: [
            { value: 1, color: '#3b6fe7' }
          ],
          outOfRange: { color: '#fff' }
        },
        series: [
          {
            name: '省份数据',
            type: 'map',
            map: 'china',
            roam: false, // 禁止缩放
            layoutCenter: ['50%', '70%'], // 地图居中
            layoutSize: '140%', // 固定大小
            label: { show: false },
            emphasis: {
              label: { show: false }
            },
            select: {
              label: { show: false }
            },
            data: [
              {
                name: '内蒙古自治区',
                value: 1,
                label: { show: false }
              },
              {
                name: '海南省',
                value: 1,
                label: { show: false }
              },
              {
                name: '湖南省',
                value: 1,
                label: { show: false }
              },
              {
                name: '四川省',
                value: 1,
                label: { show: false }
              }
            ]
          }
        ]
      }

      this.mapChart.setOption(option)

      // 监听点击事件
      this.mapChart.on('click', (params) => {
        if (params.name === this.selectedProvince) {
          // 关闭已经展开的信息框
          this.selectedProvince = ''
          this.showInfo = false
        } else if (this.provinceData[params.name]) {
          // 该省份有数据，显示信息框
          this.selectedProvince = params.name
          this.showInfo = true
          this.infoPosition = { x: params.event.offsetX, y: params.event.offsetY }
        } else {
          // 没有数据，隐藏信息框
          this.showInfo = false
        }
      })
      window.addEventListener('resize', () => this.mapChart.resize())
    },
    goToProject (id) {
      this.$router.push({
        path: '/detail'
      })
    }
  }
}

</script>

<style scoped>
.map-container {
  width: 98%;
  height: 100%;
  padding: 0 1%;
  margin: 0;
}

.map-title {
  height: 70px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 30px;
  font-weight: bold;
}

.map-main {
  width: 100%;
  height: 425px;
}

.map-chart {
  width: 100%;
  height: 425px;
}

.legend {
  position: absolute;
  bottom: 60px;
  left: 70px;
  z-index: 10;
}

.color-block {
  display: inline-block;
  width: 20px;
  height: 14px;
  margin-right: 8px;
  vertical-align: middle;
}

/* 信息框样式 */
.info-box {
  position: absolute;
  background: rgba(0, 0, 0, 0.8);
  color: #fff;
  padding: 10px;
  border-radius: 5px;
  min-width: 200px;
  top: 50px;
  left: 50px;
  transform: translate(-50%, -50%);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
}

.info-box h3 {
  margin: 0;
  padding-bottom: 5px;
  font-size: 16px;
  border-bottom: 1px solid #fff;
}

.info-box ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.info-box li {
  font-size: 14px;
  padding: 5px 0;
  cursor: pointer;
}
</style>
