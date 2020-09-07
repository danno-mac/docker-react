# Stage 0
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 1
FROM nginx
EXPOSE 80
# Copy from the previous stage (0)
COPY --from=0 /app/build /usr/share/nginx/html
