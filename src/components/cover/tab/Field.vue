<template>
    <div class="field-info">
      <div class="l-row">
        <div class="label">地块名称：</div>
        <div class="value wide">驿站一号-01号地</div>
      </div>
      <div class="l-row">
        <div class="label">土地类型：</div>
        <div class="value wide">耕地</div>
      </div>
      <div class="l-row">
        <div class="label">地力等级：</div>
        <div class="value wide">一等地</div>
      </div>
      <div class="l-row">
        <div class="label">种养品种：</div>
        <div class="value wide">大豆   花生   玉米</div>
      </div>
      <div class="l-row">
        <div class="label">地块面积：</div>
        <div class="value wide">80亩</div>
      </div>
      <div class="l-row">
        <div class="label">照片信息：</div>
        <div class="photos">
          <div class="photo">照片1</div>
          <div class="photo">照片2</div>
          <div class="photo">照片3</div>
          <div class="photo">照片4</div>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Field',
  data () {
    return {}
  }
}
</script>

<style scoped lang="less">
/* 地块信息 */
.field-info {
  display: flex;
  flex-wrap: wrap;
}
.field-info .l-row {
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 15px;
}
.l-row .label {
  width: 175px;
  font-weight: bold;
}
.l-row .value {
  width: 720px;
}
.value .wide {
  width: auto;
  flex: 1;
}
.photos {
  display: flex;
  gap: 10px;
}
.photo {
  width: 100px;
  height: 80px;
  background: #fff;
  color: #333;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
}
</style>
