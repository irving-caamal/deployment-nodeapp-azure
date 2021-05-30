FROM node:15
WORKDIR /app
COPY --chown=node:node package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install \
        else npm install && npm i -g typescript && npm run build; \
        fi
COPY --chown=node:node . ./
RUN npm i ts-node
ENV PORT 8000
CMD ["npm", "run", "start"]
