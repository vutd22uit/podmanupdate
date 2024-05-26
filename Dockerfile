FROM node:16-alpine

# Use a different repository
RUN sed -i 's/dl-cdn.alpinelinux.org/uk.alpinelinux.org/' /etc/apk/repositories

# Install necessary build tools
RUN apk add --no-cache python3 g++ make

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in package.json
RUN yarn install --production

# Run the application
CMD ["node", "src/index.js"]
