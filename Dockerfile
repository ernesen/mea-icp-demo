FROM node
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./ ./
CMD chmod +x .
RUN npm install
CMD ["node", "app.js"]