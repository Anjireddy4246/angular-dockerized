FROM node:alpine AS builder

# install chrome for protractor tests
# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable

#apk add --update --no-cache gifsicle ttf-freefont optipng libjpeg-turbo-utils udev chromium
#export CHROME_BIN=/usr/bin/chromium-browser
WORKDIR /app
COPY . .
RUN npm install && \
    npm run build
    
FROM nginx:alpine
COPY --from=builder /app/dist/* /usr/share/nginx/html/