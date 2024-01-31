FROM node:14-alpine  
  
WORKDIR /app  
  
COPY package.json ./  
RUN npm ci --production  
  
COPY app.js .  
  
EXPOSE 3000  
  
CMD ["node", "app.js"]  