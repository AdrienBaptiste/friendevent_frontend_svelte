# Étape 1 : Build de l’application
FROM node:18-alpine AS builder

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY . .

# Spécifier l’adaptateur et builder l’app
RUN npm install @sveltejs/adapter-node@latest
RUN npm run build

# Étape 2 : Exécution du serveur SvelteKit
FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3000
CMD ["node", "build"]
