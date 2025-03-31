<template>
  <div class="right-chart-1">
    <div class="rc1-header">实时信息汇总</div>

    <div class="rc1-chart-container">
      <div id="scroll-board">
        <dv-scroll-board :config="config" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ScrollBoard',
  data () {
    return {
      config: {
        header: ['时间', '信息', '地点'],
        data: [
          ['2019-07-01 19:25:00', '路面危害-松散', 'xxxxxxx'],
          ['2019-07-02 17:25:00', '路面危害-路面油污清理', 'xxxxxxx'],
          ['2019-07-03 16:25:00', '交安设施-交通标志牌结构', 'xxxxxxx'],
          ['2019-07-04 15:25:00', '路基危害-防尘网', 'xxxxxxx'],
          ['2019-07-05 14:25:00', '交安设施-交通标志牌结构', 'xxxxxxx'],
          ['2019-07-06 13:25:00', '路面危害-松散', 'xxxxxxx'],
          ['2019-07-07 12:25:00', '路基危害-防尘网', 'xxxxxxx'],
          ['2019-07-08 11:25:00', '路面危害-路面油污清理', 'xxxxxxx'],
          ['2019-07-09 10:25:00', '交安设施-交通标志牌结构', 'xxxxxxx'],
          ['2019-07-10 09:25:00', '路基危害-防尘网', 'xxxxxxx']
        ],
        index: false,
        columnWidth: [150, 130, 100],
        align: ['center', 'left', 'center'],
        rowNum: 5,
        headerBGC: '#1981f6',
        headerHeight: 30,
        oddRowBGC: 'rgba(0, 44, 81, 0.8)',
        evenRowBGC: 'rgba(10, 29, 50, 0.8)'
      }
    }
  }
}
</script>

<style lang="less">
.right-chart-1 {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;

  .rc1-header {
    font-size: 20px;
    font-weight: bold;
    height: 30px;
    line-height: 30px;
    text-align: center;
  }

  .rc1-chart-container {
    flex: 1;
    display: flex;
    justify-content: space-evenly;
  }
}

#scroll-board {
  width: 97%;
  box-sizing: border-box;
  height: 95%;
  overflow: hidden;
}

.dv-scroll-board .header {
  justify-content: space-between;
}

.dv-scroll-board .header :nth-child(2) {
  text-align: center;
}

.dv-scroll-board .rows .row-item {
  justify-content: space-between;
}

.dv-scroll-board .rows .ceil {
  padding: 0!important;
}
</style>
