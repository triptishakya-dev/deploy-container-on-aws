# Use Node.js LTS
FROM node:20-alpine 


# setup working directry
WORKDIR /app

COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Copy prisma schema AND env first
COPY prisma ./prisma
COPY .env ./

# Prisma generate (important)
RUN npx prisma generate

# Expose port (change if your app uses a different port)
EXPOSE 3000


# Start the app
CMD ["node", "index.js"]