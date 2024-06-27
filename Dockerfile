# Utilizar Tomcat como base
FROM tomcat:8.5-jdk17-openjdk-slim

# Copiar el archivo WAR desde la carpeta dist a la carpeta webapps de Tomcat dentro del contenedor
COPY dist/SalesSystem.war /usr/local/tomcat/webapps/

# Exponer el puerto en el que Tomcat se ejecuta por defecto
EXPOSE 8080

# Comando para iniciar Tomcat cuando se ejecute el contenedor (para entornos Linux)
CMD ["catalina.sh", "run"]
