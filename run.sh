docker build -t spring-petclinic:1.0 .
docker run -it -d  -p 8081:8080 --name spring-petclinic spring-petclinic:1.0
