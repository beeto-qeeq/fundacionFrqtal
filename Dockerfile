# Usar la imagen base de Node.js
FROM node:22-alpine

ENV PUBLIC_NODE_ENV=production

# Directorio de trabajo
WORKDIR /app

# Instalar curl
RUN apk add --no-cache curl

# Copiar el código fuente al contenedor
COPY package.json package-lock.json ./ 

# Instalar dependencias
RUN npm install

# Copiar los archivos al contenedor
COPY . .

# Construir el proyecto para producción
# RUN npm run build

# Exponer puerto de Astro para preview
EXPOSE 4321

# Comando para ejecutar el servidor de preview en producción
CMD ["npm", "run", "cicd"]