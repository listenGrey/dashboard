<template>
    <div class="search-page">

      <!-- 搜索栏 -->
      <div class="search-bar">
        <div class="input-wrapper">
          <i class="icon-search"></i>
          <input type="text" placeholder="请输入经营主体名称/项目区名称" />
        </div>
        <label>
          <input type="checkbox" /> 经营主体
        </label>
        <label>
          <input type="checkbox" /> 兴趣点
        </label>
        <button class="btn-search">搜 索</button>
      </div>

      <!-- 多行筛选 -->
      <div class="filter-row">
    <span>主体 资质:
      <select>
        <option>不限</option>
        <option>资质一</option>
        <option>资质二</option>
        <option>资质三</option>
      </select>
      ...
    </span>
        <span>经营 类型:
      <select>
        <option>不限</option>
        <option>类型一</option>
        <option>类型二</option>
        <option>类型三</option>
      </select>
      ...
    </span>
        <span>示范 基地:
      <select>
        <option>不限</option>
        <option>是</option>
        <option>否</option>
      </select>
      ...
    </span>
        <!-- 其余同理 -->
      </div>

      <!-- 表格标题行 -->
      <div class="table-title-row">
        <div>经营主体名称</div>
        <div>项目区名称</div>
        <div>地址</div>
        <div>面积</div>
        <div>操作</div>
      </div>

      <!-- 表格数据行 -->
      <div class="table-body">
        <div class="row">
          <div>此处是经营主体名称</div>
          <div>此处是项目区名称</div>
          <div>此处是项目区具体地址</div>
          <div>80.3亩</div>
          <div class="action"><a>定位</a></div>
        </div>
        <div class="row">
          <div>此处是经营主体名称</div>
          <div>此处是项目区名称</div>
          <div>湖南省长沙市岳麓区中电软件园</div>
          <div>80.3亩</div>
          <div class="action"><a>定位</a></div>
        </div>
        <!-- 更多行... -->
      </div>

      <!-- 分页 & 统计信息 -->
      <div class="pagination-info">
        检索符合条件的 28 个项目区，项目区面积 108 亩
        <span class="pager">
      <a>上一页</a>
      <a class="current">1</a>
      <a>2</a>
      <a>3</a>
      <a>下一页</a>
    </span>
      </div>
    </div>

</template>

<script>
export default {
  name: 'Search',
  data () {
    return {}
  }
}
</script>

<style scoped lang="less">
.search-page {
  width: 100%;
  height: 100%;
  color: #fff;
}

/* 搜索栏 */
.search-bar {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 10px;
}
.input-wrapper {
  position: relative;
  background: #082045;
  border-radius: 4px;
  padding: 5px 35px 5px 30px; /* 留出icon和input的间距 */
}
.input-wrapper .icon-search {
  position: absolute;
  left: 8px;
  top: 7px;
  width: 16px;
  height: 16px;
  background: url('data:image/svg+xml;base64,...') no-repeat center;
  /* 用SVG icon或替换成你的icon */
  filter: invert(100%); /* 白色icon */
}
.input-wrapper input {
  border: none;
  outline: none;
  background: transparent;
  color: #fff;
  width: 200px;
}

/* 筛选按钮/复选框 */
label {
  cursor: pointer;
  margin-right: 10px;
}
label input {
  margin-right: 5px;
}

/* 搜索按钮 */
.btn-search {
  background: #0066cc;
  color: #fff;
  border: 1px solid #0066cc;
  border-radius: 4px;
  padding: 5px 12px;
  cursor: pointer;
}

/* 多行筛选 */
.filter-row {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  margin-bottom: 10px;
}
.filter-row span {
  background: #082045;
  border-radius: 4px;
  padding: 5px 10px;
  display: flex;
  align-items: center;
  gap: 4px;
}
.filter-row select {
  border: none;
  outline: none;
  background: #001a36;
  color: #fff;
  padding: 2px 4px;
  border-radius: 4px;
}

/* 表格标题行 */
.table-title-row {
  display: grid;
  grid-template-columns: 2fr 2fr 3fr 1fr 1fr;
  /* 5列，按你需求分配宽度比例 */
  background: #7F919C; /* 略带白的灰蓝, 让白字清晰 */
  color: #fff;
  padding: 8px;
  border-radius: 4px 4px 0 0;
  margin-bottom: 4px;
}
.table-title-row > div {
  font-weight: bold;
}

/* 表格数据行容器 */
.table-body {
  background: #0d3572; /* 主体深蓝 */
  border-radius: 0 0 4px 4px;
}

/* 每行的数据 */
.table-body .row {
  display: grid;
  grid-template-columns: 2fr 2fr 3fr 1fr 1fr;
  padding: 8px;
  border-bottom: 1px solid #004080;
}
.table-body .row:last-child {
  border-bottom: none;
}

/* hover 效果 */
.table-body .row:hover {
  background: #001a36;
}

/* 单元格文字 */
.table-body .row div {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* 操作链接 */
.table-body .row .action a {
  color: #00ffff; /* 青色 */
  cursor: pointer;
  text-decoration: none;
}

/* 底部分页与信息 */
.pagination-info {
  position: relative;
  top: 278px;
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
}
.pagination-info .pager a {
  margin-left: 8px;
  color: #fff;
  cursor: pointer;
  text-decoration: none;
}
.pagination-info .pager .current {
  color: #00ffff;
  font-weight: bold;
}

</style>
