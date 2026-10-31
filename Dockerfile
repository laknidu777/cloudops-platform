FROM node:24-alpine

RUN npm install -g npm@12.2.1

WORKDIR /app

COPY --chown=node:node app.js package.json ./

USER node

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('node:http').get('http://127.0.0.1:3000/health', r => { process.exit(r.statusCode === 200 ? 0 : 1) }).on('error', () => process.exit(1))"

CMD ["node", "app.js"]
