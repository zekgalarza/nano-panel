FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# 👇 Define uma GEMINI_API_KEY "dummy" só para o build não quebrar
ENV GEMINI_API_KEY=dummy

RUN npm run build

ENV NODE_ENV=production
EXPOSE 3000

CMD ["npm", "start"]

