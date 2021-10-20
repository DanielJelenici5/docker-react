FROM node:alpine as builder
#"as builder" is telling it what stage/phase

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#FROM knows that previous phase is terminated
FROM nginx

#says copy something over from other phase
COPY --from=builder /app/build /usr/share/nginx/html

#default command of nginx automatically starts up when container starts up
#nignx deafult mapping for is 80