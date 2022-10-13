# AppDynamics Java 101 lab

## ToDo

- download Tomcat 9 and install sample application

```
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
tar xvf apache-tomcat-9.0.68.tar.gz
mv apache-tomcat-9.0.68 tomcat9
cp Supercar-Trader.war tomcat9/webapps/
```

- start up MySQL container

```
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=xxxxxxxxxxx mysql:5.7
```

https://hub.docker.com/_/mysql


- start up Tomcat 9

```
./tomcat9/bin/startup.sh
```


- Supercar Trader application URL should be as below:

https://8080-appdynamics-partnerlab1-xxxxxxxxxx.ws-usXX.gitpod.io/Supercar-Trader/home.do
(add /Supercar-Trader/home.do to the URL in preview window)

- generate load 

```
cd Load-Generator/phantomjs
./start_load.sh
```
