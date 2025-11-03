# Stage 1 - Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Stage 2 - Run (distroless)
FROM node:18-slim
WORKDIR /app
COPY --from=build /app .

# Ensure libc and other system packages are up-to-date to address known CVEs
RUN apt-get update \
	&& apt-get install -y --no-install-recommends libc6 \
	&& rm -rf /var/lib/apt/lists/*

USER node
EXPOSE 3000
CMD ["node", "server.js"]
