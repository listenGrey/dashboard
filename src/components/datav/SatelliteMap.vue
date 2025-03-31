<template>
  <div class="content">
    <div class="amap-container">
      <!-- 用于放置地图的容器 -->
      <div ref="amapDiv" class="map-area"></div>
        <div class="legend">
          <dv-border-box-2 style="background-color: rgba(0,0,0,0.5)">
            <span>{{ region }}</span>
          </dv-border-box-2>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SatelliteMap',
  data () {
    return {
      region: '全溪村示范田',
      map: null,
      polygonsData: [
        {
          name: '地块1', // 高德JS 坐标顺序是 [经度, 纬度]
          path: [
            [112.600, 26.511],
            [112.605, 26.512],
            [112.607, 26.509],
            [112.603, 26.508]
          ],
          fillColor: 'red'
        },
        {
          name: '地块2',
          path: [
            [112.597, 26.514],
            [112.602, 26.515],
            [112.605, 26.513],
            [112.601, 26.512]
          ],
          fillColor: 'red'
        }
      ]
    }
  },
  mounted () {
    this.initMap()
  },
  methods: {
    initMap () {
      // 确保全局 window.AMap 已经加载
      if (!window.AMap) {
        console.error('高德地图 JS 未加载')
        return
      }

      // 创建地图实例
      this.map = new window.AMap.Map(this.$refs.amapDiv, {
        resizeEnable: false,
        // 初始中心和缩放; 可先给个大致位置,后面fitView自动调整
        center: [112.6, 26.51],
        mapStyle: 'amap://styles/darkblue', // 也可自定义: 'amap://styles/whitesmoke'
        dragEnable: false, // 禁止拖拽
        zoomEnable: false, // 禁止缩放
        doubleClickZoom: false, // 禁止双击放大
        scrollWheel: false, // 禁止滚轮缩放
        touchZoom: false, // 禁止触控缩放
        keyboardEnable: false // 禁止键盘操作
      })

      // 切换为卫星图层
      // v2 版本用 "AMap.TileLayer.Satellite" 添加
      const satelliteLayer = new window.AMap.TileLayer.Satellite()
      // 叠加路网
      const roadNetLayer = new window.AMap.TileLayer.RoadNet()
      this.map.add([satelliteLayer, roadNetLayer])

      // 逐个绘制多边形
      this.polygonsData.forEach(polygonInfo => {
        this.createPolygon(polygonInfo)
      })

      // 根据所有覆盖物调整视野
      this.map.setFitView()
    },
    createPolygon (info) {
      const polygon = new window.AMap.Polygon({
        path: info.path, // 多边形顶点坐标 [经度,纬度]
        strokeColor: '#f00', // 边线颜色
        strokeWeight: 2, // 边线宽度
        fillColor: info.fillColor, // 填充色
        fillOpacity: 0.5, // 填充透明度
        map: this.map,
        cursor: 'pointer'
      })
      polygon.on('click', () => {
        this.$emit('open-manage')
      })

      // 在多边形中心添加文字标注
      // 首先计算多边形中心 (AMap提供的 getBounds() 并不直接给中心点)
      const center = this.getPolygonCenter(info.path)

      // 创建文本标注
      // AMap.Text文档: https://lbs.amap.com/api/javascript-api/reference/layer
      const textMarker = new window.AMap.Text({
        text: info.name,
        anchor: 'center', // 文字中心对齐
        draggable: false,
        cursor: 'pointer',
        style: {
          'background-color': 'transparent',
          'border': 'none',
          'color': '#fff', /* 白字 */
          'font-size': '14px',
          'font-weight': 'bold',
          'text-shadow': '1px 1px 2px #000'
        },
        position: center
      })
      textMarker.setMap(this.map)
    },
    // 计算多边形中心(简单平均法/可改用更精准的多边形质心算法)
    getPolygonCenter (path) {
      let lngSum = 0
      let latSum = 0
      path.forEach(([lng, lat]) => {
        lngSum += lng
        latSum += lat
      })
      const count = path.length
      return [lngSum / count, latSum / count]
    }
  }
}
</script>

<style scoped lang="less">
.content {
  width: 100%;
  height: 500px;
  padding: 5px;
}
.amap-container {
  height: 99%;
}

.map-area {
  height: 100%;
}

.legend {
  position: absolute;
  top: 10px;
  left: 10px;
  z-index: 10;
  font-size: 25px;
  color: #FFFFFF;
  font-weight: bold;
}
</style>
