FROM node:20-alphine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
Run npm run build

From nginx:alphine
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]