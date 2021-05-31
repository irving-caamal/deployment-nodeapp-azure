FROM node:15
WORKDIR /app
COPY --chown=node:node package.json .
RUN npm install
RUN npm install -g typescript
RUN npm install typescript
COPY --chown=node:node . ./
RUN npm i ts-node
ENV PORT 8000
CMD ["npm", "run", "dev"]
