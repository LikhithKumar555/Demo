ADD ./target/*.war /xampp/tomcat/webapps

EXPOSE 9090

WORKDIR /xampp/tomcat/webapps

CMD ["catalina.sh", "run"]