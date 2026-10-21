# Use Node.js Alpine as base image
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package.json pnpm-lock.yaml ./

RUN npm i -g pnpm@9.15.9

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy application code
COPY . .

RUN ls -R src

# Build the TypeScript application
RUN pnpm build

# Expose port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]