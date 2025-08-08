# Use official Node.js LTS image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Copy config.example.json to config.json (or inject at runtime)
RUN cp config.example.json config.json || echo "No example config found"

# Expose the port the app runs on
EXPOSE 3456

# Start the server
CMD ["npm", "start"]
