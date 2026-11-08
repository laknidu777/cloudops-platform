
FROM node:24-alpine

WORKDIR /app

# Copy dependency definitions first.
COPY package*.json ./

# Install production dependencies.
RUN npm ci --omit=dev

# Copy application source code.
COPY --chown=node:node app.js ./
COPY --chown=node:node monitoring/ ./monitoring/

# Run as a non-root user.
USER node

EXPOSE 3000

# Docker health check.
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('node:http').get('http://127.0.0.1:3000/health', r => { process.exit(r.statusCode === 200 ? 0 : 1) }).on('error', () => process.exit(1))"

CMD ["node", "app.js"]
