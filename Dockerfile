FROM node:15
WORKDIR /app
COPY --chown=node:node package.json .
RUN npm install
RUN npm install -g typescript
COPY --chown=node:node . ./
RUN npm i ts-node
RUN npm i tsc
RUN npm run build
ENV PORT 8000
CMD ["npm", "run", "start"]
