# Single stage build with Node.js
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the React app
RUN npm run build

# Install serve to run the app
RUN npm install -g serve

# Expose port 3000
EXPOSE 80

# Start the application
CMD ["serve", "-s", "dist", "-l", "80"]
