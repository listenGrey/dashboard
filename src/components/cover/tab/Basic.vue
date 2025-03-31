<template>
  <div class="basic-info">
    <div class="info-panel">
      <div class="rows-bar">
        <div class="row">
          <div class="label">主体名称：</div>
          <div class="value">驿站一号</div>
        </div>
        <div class="row">
          <div class="label">主体性质：</div>
          <div class="value">合作社</div>
        </div>
        <div class="row">
          <div class="label">法人姓名：</div>
          <div class="value">姓哈哈</div>
        </div>
        <div class="row">
          <div class="label">经营类型：</div>
          <div class="value">种植业</div>
        </div>
        <div class="row">
          <div class="label">注册地址：</div>
          <div class="value wide">湖南省长沙市岳麓区中电软件园二期</div>
        </div>
      </div>
      <div class="rows-bar">
        <div class="row">
          <div class="label">是否龙头企业：</div>
          <div class="value">是</div>
        </div>
        <div class="row">
          <div class="label">是否示范基地：</div>
          <div class="value">是</div>
        </div>
        <div class="row">
          <div class="label">是否社会化服务组织：</div>
          <div class="value">是</div>
        </div>
        <div class="row">
          <div class="label">信用等级：</div>
          <div class="value">AAA</div>
        </div>
        <div class="row">
          <div class="label">销售渠道：</div>
          <div class="value wide">此处是销售渠道介绍</div>
        </div>
      </div>
      <div class="l-row">
        <div class="label">经营范围：</div>
        <div class="value wide">此处是经营范围介绍，可以很长，会出现换行</div>
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
      <div class="l-row">
        <div class="label">主体简介：</div>
        <div class="value wide">此处是一段主体简介，可以很长</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Basic',
  data () {
    return {}
  }
}
</script>

<style scoped lang="less">
.wrapper {
  flex: 1;
  overflow: auto;
}

/* info-panel: 基本情况 */
.info-panel {
  display: flex;
  flex-wrap: wrap;
}
.info-panel .rows-bar {
  width: 50%;
}
.info-panel .row, .l-row {
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 8px;
}
.row .label, .l-row .label {
  width: 175px;
  font-weight: bold;
}
.row .value {
  width: 260px;
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
