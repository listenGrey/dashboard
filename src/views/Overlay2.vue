<template>
  <!-- 遮罩层 + 弹窗 -->
  <div class="overlay" v-if="isVisible" @click.self="closeSaleSearch">
    <!-- 弹窗内容容器 -->
    <div class="dialog">
      <div class="dialog-header">
        <div class="dialog-header-title">
          <dv-decoration-11 class="dialog-header-title-de"><h2>{{ title }}</h2></dv-decoration-11>
        </div>
        <span class="close-icon" @click="closeSaleSearch">×</span>
      </div>
      <dv-decoration-10 style="height:5px;" />

      <div class="dialog-body">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Overlay2',
  props: {
    isVisible: {
      type: Boolean,
      default: false
    },
    title: {
      type: String
    }
  },
  emits: ['close'], // 声明要发出的事件
  methods: {
    // 触发关闭事件给父组件
    closeSaleSearch () {
      this.$emit('close')
    }
  }
}
</script>

<style scoped lang="less">
/* 覆盖层(半透明) */
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 999;
  display: flex;
  justify-content: center;
  align-items: center;
}
/* 弹窗 */
.dialog {
  background: #000080; /* 深蓝背景 */
  height: 600px;
  width: 80%;
  max-width: 900px;
  border-radius: 8px;
  padding: 20px;
  color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
.dialog-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
.dialog-header-title {
  width: 98%;
  display: flex;
  justify-content: space-around;
}
.dialog-header-title-de {
  width:300px;
  height:60px;
}
.close-icon {
  cursor: pointer;
  font-size: 24px;
}
.dialog-body {
  margin: 10px 0;
}
</style>
