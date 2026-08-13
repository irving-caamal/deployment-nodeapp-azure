FROM node:22-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY tsconfig.json config.json ./
COPY src ./src
RUN npm run build

FROM node:22-alpine

WORKDIR /app
ENV NODE_ENV=production
ENV PORT=8000

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY config.json ./
COPY --from=build /app/build ./build

USER node
EXPOSE 8000
CMD ["npm", "start"]
