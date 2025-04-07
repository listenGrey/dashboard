# 使用官方 Nginx 镜像作为基础镜像
FROM nginx:stable-alpine

# 删除默认配置
RUN rm -rf /usr/share/nginx/html/*

# 复制 Vue 构建后的文件到 nginx 的 html 目录
COPY dist/ /usr/share/nginx/html/

# 如果有自定义 nginx 配置，可以直接使用
# COPY nginx.conf /etc/nginx/nginx.conf

# 默认端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]