ARG NODE_VERSION=20.9.0

FROM node:${NODE_VERSION} AS base
  WORKDIR /var
  COPY package.json .
  RUN npm i
  COPY . .

FROM base AS final
  WORKDIR /var
  RUN npm build
  CMD [ "npm", "start" ]
 