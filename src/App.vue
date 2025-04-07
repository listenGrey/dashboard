<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>

export default {
  name: 'app',
  data () {
    return {}
  }
}
</script>

<style lang="less">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  position: relative;
  overflow: auto !important;
}
</style>
