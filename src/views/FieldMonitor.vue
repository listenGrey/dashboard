<template>
  <div id="data-view">
    <dv-full-screen-container>
      <div class="main-header">
        <div class="mh-left">
          <dv-border-box-8 class="search-btn">
            <div @click="item1Show = true">统计</div>
          </dv-border-box-8>
          <dv-border-box-8 class="search-btn">
            <div @click="item2Show = true">搜索</div>
          </dv-border-box-8>
        </div>
        <div class="mh-middle">智慧农场可视化平台 -- 耕地用途管控大数据监管</div>
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
        <FullSatelliteMap />
        <!-- 右下角图例 -->
        <div class="legends">
          <h4 class="legends-title">图例</h4>
          <ul>
            <li><span class="color-block red"></span> 类型A</li>
            <li><span class="color-block blue"></span> 类型B</li>
            <li><span class="color-block yellow"></span> 类型C</li>
          </ul>
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
import Overlay from '@/views/Overlay1.vue'
import Entity from '@/components/cover/Entity.vue'
import Process from '@/components/cover/Process.vue'
import FullSatelliteMap from '@/components/datav/FullSatelliteMap.vue'

export default {
  name: 'DataView',
  components: {
    FullSatelliteMap,
    Overlay,
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
  }
}

/* 图例 (右下角) */
.legends {
  position: absolute;
  right: 20px;
  bottom: 20px;
  width: 140px;
  background: rgba(0,0,0,0.5);
  color: #fff;
  z-index: 999;
  backdrop-filter: blur(4px);
  padding: 6px;
}
.legends-title {
  margin: 0 0 6px;
}
.legends ul {
  list-style: none;
  margin: 0; padding: 0;
}
.legends li {
  display: flex;
  align-items: center;
  margin-bottom: 4px;
}
.color-block {
  display: inline-block;
  width: 16px; height: 16px;
  margin-right: 8px;
  border-radius: 3px;
}
.red { background: red; }
.blue { background: blue; }
.yellow { background: yellow; }
</style>
