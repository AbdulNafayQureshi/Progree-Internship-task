# STAGE 1: Builder (Installs dependencies)
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev

# STAGE 2: Production (Creates the minimal final image)
FROM node:20-alpine
WORKDIR /app

# Security: Create and switch to a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy only what is needed from Stage 1
COPY --from=builder /app/node_modules ./node_modules
COPY package*.json server.js ./

USER appuser

# Document the internal port
EXPOSE 3000

CMD ["npm", "start"]