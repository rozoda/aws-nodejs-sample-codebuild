# Use the official Node.js 14 LTS image as the base image  
FROM node:14-alpine  
  
# Set the working directory inside the container  
WORKDIR /app  
  
# Copy package.json and package-lock.json to the working directory  
COPY package.json ./  
  
# Install npm and generate package-lock.json  
RUN apk add --no-cache npm && \  
    npm install --package-lock-only  
  
# Install production dependencies  
RUN npm ci --production  
  
# Copy the app.js file to the working directory  
COPY app.js .  
  
# Expose the port that the app will listen on  
EXPOSE 3000  
  
# Start the Node.js app  
CMD ["node", "app.js"]  

