<template>
  <div id="data-view">
    <dv-full-screen-container>
      <div class="main-header">
        <div class="mh-left">
          <dv-border-box-8 class="search-btn">
            <div @click="item1Show = true">项目区详情</div>
          </dv-border-box-8>
          <dv-border-box-8 class="search-btn">
            <div @click="item2Show = true">生产经营详情</div>
          </dv-border-box-8>
        </div>
        <div class="mh-middle">智慧农场可视化平台</div>
        <div class="mh-right">
          <dv-border-box-8 class="search-btn">
            <div @click="goToIndex">主页</div>
          </dv-border-box-8>
          <dv-border-box-8 class="current-time">
            <div class="time">{{ currentTime }}</div>
          </dv-border-box-8>
        </div>
      </div>

      <dv-border-box-1 class="main-container">
        <dv-border-box-3 class="left-chart-container">

          <Left-Chart-1 />
          <Left-Chart-2 />
          <Water-Level-Chart />

        </dv-border-box-3>

        <div class="right-main-container">
          <div class="rmc-top-container">
            <dv-border-box-3 class="rmctc-left-container">

              <SatelliteMap  @open-manage="OpenProcess" />

            </dv-border-box-3>

            <div class="rmctc-right-container">
              <dv-border-box-3 class="rmctc-chart-1">

                <Scroll-Board />

              </dv-border-box-3>

              <dv-border-box-4 class="rmctc-chart-2" :reverse="true">

                <Rose-Chart />

              </dv-border-box-4>
            </div>
          </div>

          <dv-border-box-4 class="rmc-bottom-container">

            <Bottom-Charts />

          </dv-border-box-4>
        </div>
      </dv-border-box-1>
      <Overlay
        :is-visible="item1Show"
        :title="item1Title"
        @close="item1Show = false"
      >
        <Entity />
      </Overlay>

      <Overlay
        :is-visible="item2Show"
        :title="item2Title"
        @close="item2Show = false"
      >
        <Process />
      </Overlay>
    </dv-full-screen-container>
  </div>
</template>

<script>
import LeftChart2 from '@/components/datav/LeftChart2.vue'
import LeftChart1 from '@/components/datav/LeftChart1.vue'
import WaterLevelChart from '@/components/datav/WaterLevelChart.vue'
import BottomCharts from '@/components/datav/BottomCharts.vue'
import ScrollBoard from '@/components/datav/ScrollBoard.vue'
import RoseChart from '@/components/datav/RoseChart.vue'
import Overlay from '@/views/Overlay1.vue'
import SatelliteMap from '@/components/datav/SatelliteMap.vue'
import Entity from '@/components/cover/Entity.vue'
import Process from '@/components/cover/Process.vue'

export default {
  name: 'DataView',
  components: {
    LeftChart1,
    LeftChart2,
    WaterLevelChart,
    ScrollBoard,
    RoseChart,
    BottomCharts,
    Overlay,
    SatelliteMap,
    Entity,
    Process
  },
  data () {
    return {
      currentTime: '',
      item1Show: false,
      item2Show: false,
      item1Title: '经营主体信息',
      item2Title: '生产经营详情'
    }
  },
  mounted () {
    // 组件挂载时更新一次
    this.updateTime()

    // 每秒更新
    this.timer = setInterval(() => {
      this.updateTime()
    }, 1000)
  },
  beforeUnmount () {
    // 组件卸载前清除定时器，防止内存泄漏
    clearInterval(this.timer)
  },
  methods: {
    OpenProcess () {
      this.item2Show = true
    },
    updateTime () {
      const now = new Date()
      // 简单格式化
      this.currentTime = now.toLocaleString()
      // 你可以改成 toLocaleTimeString() / Day.js / date-fns 自定义格式
    },
    goToIndex () {
      this.$router.push({
        path: '/'
      })
    }
  }
}

</script>

<style lang="less">
#data-view {
  .main-header {
    height: 80px;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;

    .mh-left, .mh-right {
      width: 450px;
      display: flex;
      justify-content: space-evenly;

      a:visited {
        color: rgb(1,134,187);
      }
    }

    .mh-middle {
      font-size: 30px;
      font-weight: bold;
    }
    .search-btn {
      width: 180px;
      height: 50px;
      line-height: 50px;
      text-align:center;
      cursor: pointer;
    }
    .current-time {
      width: 180px;
      height: 50px;
      line-height: 50px;
      text-align:center;
      cursor: pointer;
      font-size: 18px;
    }
  }

  .main-container {
    height: calc(~"100% - 80px");

    .border-box-content {
      padding: 20px;
      box-sizing: border-box;
      display: flex;
    }
  }

  .left-chart-container {
    width: 22%;
    padding: 10px;
    box-sizing: border-box;

    .border-box-content {
      flex-direction: column;
    }
  }

  .right-main-container {
    width: 78%;
    padding-left: 5px;
    box-sizing: border-box;
  }

  .rmc-top-container {
    height: 65%;
    display: flex;
  }

  .rmctc-left-container {
    width: 65%;
  }

  .rmctc-right-container {
    width: 35%;
  }

  .rmc-bottom-container {
    height: 35%;
  }

  .rmctc-chart-1, .rmctc-chart-2 {
    height: 50%;
  }
}
</style>
