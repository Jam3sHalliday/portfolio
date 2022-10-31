FROM node:16-alpine

EXPOSE 80

WORKDIR /app

RUN mkdir -p /app

COPY . .

RUN cd /app \
    && yarn install \
    && yarn cache clean\
	&& rm -rf
ARG branch

ENV PORT=80
# RUN yarn build

RUN yarn build:${branch}

CMD ["yarn", "start"]