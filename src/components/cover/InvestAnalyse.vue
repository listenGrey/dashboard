<template>
  <div class="content">
    <div class="region-tree">
      <dv-border-box-7 :color="['#BFC7CF','#CCD2D9']">
        <div class="bars">
          <h2>省 / 市 / 县 / 村 选择</h2>
          <ul>
            <li v-for="(province, pIndex) in regionData" :key="pIndex">
              <!-- 省级 -->
              <div class="tree-header" @click="toggleExpand(province)">
                <span class="arrow" :class="{ up: province.expanded }"></span>
                {{ province.name }}
              </div>
              <!-- 市级 -->
              <ul v-if="province.expanded">
                <li v-for="(city, cIndex) in province.children" :key="cIndex">
                  <div class="tree-header" @click="toggleExpand(city, $event)">
                    <span class="arrow" :class="{ up: city.expanded }"></span>
                    {{ city.name }}
                  </div>
                  <!-- 县级 -->
                  <ul v-if="city.expanded">
                    <li v-for="(county, coIndex) in city.children" :key="coIndex">
                      <div class="tree-header" @click="toggleExpand(county, $event)">
                        <span class="arrow" :class="{ up: county.expanded }"></span>
                        {{ county.name }}
                      </div>
                      <!-- 村级 -->
                      <ul v-if="county.expanded">
                        <li v-for="(village, vIndex) in county.children" :key="vIndex">
                          <div class="tree-header">
                            {{ village.name }}
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </dv-border-box-7>
    </div>
    <div class="tables">
      <div class="table-top">
        <dv-border-box-11 title="投入品使用量明细数据">
          <div class="table-top-header">
            <select v-model="selectedYear">
              <option v-for="y in years" :key="y" :value="y">{{ y }}</option>
            </select>
          </div>

          <!-- 表格本体 -->
          <table class="table-top-content">
            <thead>
            <tr>
              <th>种类</th>
              <th>使用量</th>
              <th>单位</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(item, index) in topTableData" :key="index">
              <td>{{ item.type }}</td>
              <td>{{ item.amount }}</td>
              <td>{{ item.unit }}</td>
            </tr>
            </tbody>
          </table>

          <!-- 分页示例 -->
          <div class="table-pagination">
            <button @click="goPrev" :disabled="page <= 1">上一页</button>
            <span class="page-num">
          {{ page }} / {{ totalPages }}
        </span>
            <button @click="goNext" :disabled="page >= totalPages">下一页</button>
          </div>
        </dv-border-box-11>
      </div>

      <div class="table-bottom">
        <dv-border-box-13>
          <div class="table-bottom-header">
            <div class="title">
              产量/销售趋势
            </div>
            <select v-model="selectedType">
              <option v-for="x in types" :key="x" :value="x">{{ x }}</option>
            </select>
          </div>
          <div ref="trendChart" class="chart-area"></div>
        </dv-border-box-13>
      </div>
    </div>
  </div>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: 'InvestAnalyse',
  data () {
    return {
      regionData: [
        {
          name: '内蒙古自治区',
          expanded: false,
          children: [
            {
              name: '呼和浩特市',
              expanded: false,
              children: [
                {
                  name: '新城区',
                  expanded: false,
                  children: [
                    { name: '某村' }
                  ]
                }
              ]
            }
          ]
        },
        {
          name: '四川省',
          expanded: false,
          children: [
            {
              name: '自贡市',
              expanded: false,
              children: [
                {
                  name: '某县',
                  expanded: false,
                  children: [
                    { name: '某村1' },
                    { name: '某村2' }
                  ]
                }
              ]
            }
          ]
        },
        {
          name: '湖南省',
          expanded: false,
          children: [
            {
              name: '郴州市',
              expanded: false,
              children: [
                {
                  name: '桂东县',
                  expanded: false,
                  children: [
                    { name: '全溪村' }
                  ]
                }
              ]
            }
          ]
        },
        {
          name: '海南省',
          expanded: false,
          children: [
            {
              name: '三亚市',
              expanded: false,
              children: [
                {
                  name: '某区',
                  expanded: false,
                  children: [
                    { name: '某村' }
                  ]
                }
              ]
            }
          ]
        }
      ],
      // 下拉作物种类
      years: ['2024', '2023', '2022'],
      selectedYear: '2024',
      // 模拟表格数据 - 直接写死在这里
      topTableData: [
        { type: '化肥', amount: '800', unit: 'kg' },
        { type: '农药', amount: '800', unit: 'ml' },
        { type: '杀虫剂', amount: '800', unit: 'l' }
      ],
      // 分页
      page: 1,
      pageSize: 3,
      totalPages: 1,
      // 模拟数据
      chartInstance: null,
      types: ['全选', '化肥', '农药', '杀虫剂'],
      selectedType: '全选',
      xData: [2017, 2018, 2019, 2020, 2021, 2022, 2023],
      huafeiData: [200, 180, 300, 400, 450, 500, 380], // 产量
      nongyaoData: [100, 230, 200, 380, 420, 460, 300], // 销量
      sahchongjiData: [150, 260, 350, 300, 480, 540, 600] // 销售额
    }
  },
  mounted () {
    this.initChart()
  },
  methods: {
    // 展开/收起
    toggleExpand (node, event) {
      // 直接修改节点的 expanded 状态
      node.expanded = !node.expanded
    },
    goPrev () {
      if (this.page > 1) {
        this.page--
      }
    },
    goNext () {
      if (this.page < this.totalPages) {
        this.page++
      }
    },
    initChart () {
      this.chartInstance = echarts.init(this.$refs.trendChart)
      this.renderChart()
      // 自适应
      window.addEventListener('resize', () => this.chartInstance.resize())
    },
    renderChart () {
      const option = {
        backgroundColor: 'transparent', // 父容器若是深蓝,则可transparent
        title: {
          show: false
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: { type: 'line' }
        },
        legend: {
          data: ['农药', '化肥', '杀虫剂'],
          textStyle: { color: '#fff' },
          top: 0
        },
        grid: {
          left: '10%',
          right: '10%',
          top: '10%',
          bottom: '15%' // 留给 legend
        },
        xAxis: {
          type: 'category',
          data: this.xData,
          axisLine: { lineStyle: { color: '#fff' } },
          axisLabel: { color: '#fff' },
          splitLine: { show: false }
        },
        yAxis: {
          type: 'value',
          axisLine: { lineStyle: { color: '#fff' } },
          axisLabel: { color: '#fff' },
          splitLine: {
            show: true,
            lineStyle: { color: 'rgba(255,255,255,0.2)' }
          }
        },
        series: [
          {
            name: '农药',
            type: 'line',
            data: this.nongyaoData,
            symbol: 'circle',
            symbolSize: 6,
            lineStyle: { width: 2 },
            itemStyle: { color: '#0a66ff' } // 蓝色
          },
          {
            name: '化肥',
            type: 'line',
            data: this.huafeiData,
            symbol: 'circle',
            symbolSize: 6,
            lineStyle: { width: 2 },
            itemStyle: { color: '#00ffcc' } // 绿色
          },
          {
            name: '杀虫剂',
            type: 'line',
            data: this.sahchongjiData,
            symbol: 'circle',
            symbolSize: 6,
            lineStyle: { width: 2 },
            itemStyle: { color: '#ff0080' } // 粉色
          }
        ]
      }
      this.chartInstance.setOption(option)
    },
    updateChart () {
      // 这里可以根据 this.selectedRange 更新 xData / yData
      // 演示不做切换，只手动重新渲染
      this.renderChart()
    }
  }
}
</script>

<style scoped lang="less">
.content {
  height: 100%;
  width: 100%;
  display: flex;
}
.region-tree {
  height: 500px;
  width: 30%;
}
.bars {
  padding: 15px;
  overflow-x: hidden;
  overflow-y: auto;
  height: 470px;
}

/* 去除默认的 list-style */
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.tree-header {
  cursor: pointer;
  position: relative;
  padding-left: 20px;
  line-height: 1.8;
  user-select: none;
}

/* 折叠/展开箭头 */
.arrow {
  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid #aaa;
  position: absolute;
  left: 0;
  top: 8px; /* 调整以居中 */
  transition: transform 0.3s;
}
.arrow.up {
  transform: rotate(180deg);
}

/* 缩进子级 */
.tree-header + ul {
  margin-left: 20px;
}

.tables {
  width: 70%;
  display: flex;
  flex-direction: column;
  padding-left: 20px;
}

.table-top {
  height: 250px;
}

.table-top-header {
  display: flex;
  justify-content: flex-end;
  position: relative;
  top: 40px;
  right: 25px
}

/* 表格 */
.table-top-content {
  width: 94%;
  border-collapse: collapse;
  overflow: hidden;
  position: relative;
  top: 50px;
  margin: 0 3%
}

/* 表头 */
.table-top-content thead {
  background: #7F919C; /* 灰色 */
}

.table-top-content thead th {
  font-weight: bold;
  padding: 10px;
  text-align: center;
  white-space: nowrap;
}

.table-top-content tbody tr {
  line-height: 30px;
  text-align: center;
}

/* 分页 */
.table-pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  top: 55px;
}
.table-pagination button {
  background: transparent;
  color: #fff;
  border: 1px solid #fff;
  margin: 0 5px;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
}
.table-pagination .page-num {
  color: #fff;
}

.table-bottom {
  height: 250px;
}

.table-bottom-header {
  display: flex;
  justify-content: space-between;
  padding: 30px 15px 0;
  .title{
    font-weight: bold;
    font-size: 20px;
  }
}

/* 图表容器 */
.chart-area {
  width: 100%;
  height: 185px;
}
</style>
