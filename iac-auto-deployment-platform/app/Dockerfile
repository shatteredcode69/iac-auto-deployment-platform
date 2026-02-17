# ---------- Stage 1: Build ----------
FROM node:18-alpine AS builder

WORKDIR /app

# Install dependencies separately for better layer caching
COPY package*.json ./
RUN npm install --production

# Copy application source
COPY server.js .

# ---------- Stage 2: Production ----------
FROM node:18-alpine

WORKDIR /app

# Create non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy only necessary files from builder
COPY --from=builder /app /app

# Set environment to production
ENV NODE_ENV=production

# Use non-root user
USER appuser

# Expose application port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
