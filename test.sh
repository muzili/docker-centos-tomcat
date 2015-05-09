docker kill tomcat
docker rm tomcat
docker build -t muzili/tomcat .
docker run -p 8080:8080 -p 8009:8009 --add-host "www.example.com:127.0.0.1" --name tomcat muzili/tomcat
