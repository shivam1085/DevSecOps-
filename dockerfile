# Stage 1 - Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Stage 2 - Run (distroless)
FROM gcr.io/distroless/nodejs18
WORKDIR /app
COPY --from=build /app .
USER nonroot
EXPOSE 3000
CMD ["server.js"]
