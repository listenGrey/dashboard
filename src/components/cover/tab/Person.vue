<template>
  <div class="person-info">
    <div class="summary">人员总数：108人</div>
    <div class="wrapper">
      <div class="person-list">
        <!-- 每行显示2个卡片，每个卡片里又分左右2块 -->
        <div
          class="person-card"
          v-for="(person, index) in personData"
          :key="index"
        >
          <div class="photo">照片</div>
          <div class="info">
            <div>姓名：{{ person.name }}</div>
            <div>性别：{{ person.gender }}</div>
            <div>职务：{{ person.job }}</div>
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

<script >
export default {
  name: 'Basic',
  data () {
    return {
      // 人员示例数据
      personData: [
        { name: '张小刚', gender: '男', job: '饲养员' },
        { name: '张小刚', gender: '男', job: '饲养员' },
        { name: '张小刚', gender: '男', job: '饲养员' },
        { name: '张小刚', gender: '男', job: '饲养员' }
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
.person-info {
  height: 460px;
  display: flex;
  flex-direction: column;
}
.person-info .summary {
  margin-bottom: 10px;
}
.person-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}
.person-card {
  width: 45%;
  background: #2c3e50; /* 浅一些的蓝灰 */
  padding: 10px;
  border-radius: 6px;
  display: flex;
  gap: 10px;
}
.person-card .photo {
  width: 60px;
  height: 60px;
  background: #fff;
  color: #333;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
}
.person-card .info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 4px;
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
