# Build Phase

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# FOR nginx
# Run Phase

FROM nginx
EXPOSE 80
# Copying from another phase
COPY --from=builder /app/build /usr/share/nginx/html
