# 构建容器
FROM node:18.20.3-alpine as build
WORKDIR /app

COPY package.json .
RUN npm i pnpm -g --registry https://registry.npmmirror.com
RUN pnpm install --registry https://registry.npmmirror.com
COPY . /app
RUN pnpm run build

# 生产容器
FROM nginx:1.27.0-alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
