# phase 0
# build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# phase 1
# run phase
FROM nginx
# elasticbeanstalk will add the port mapping automatically for this
EXPOSE 80
# copy --from=0 defines that we want to copy something from a different phase
COPY --from=0 /app/build /usr/share/nginx/html
