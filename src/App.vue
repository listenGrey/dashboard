<template>
  <div class="container">
    <div class="stage">
      <div id="app">
        <router-view />
      </div>
    </div>
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
}
</style>
