# AppDynamics Java 101 lab

## ToDo

- download Tomcat 9 and deploy sample application (Supercar Trader)

```
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
tar xvf apache-tomcat-9.0.68.tar.gz
mv apache-tomcat-9.0.68 tomcat9
cp Supercar-Trader.war tomcat9/webapps/
```

- start up MySQL 5.7 container

```
docker run -d -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD mysql:5.7
```

root password can be found in tomcat9/webapps/Supercar-Trader/META-INF/context.xml, once Tomcat9 started

https://hub.docker.com/_/mysql


- start up Tomcat 9

```
./tomcat9/bin/startup.sh
```

- populate data into Supercar Trader tables

```
mysql -h127.0.0.1 -uroot -p'XXXXXXXXXXXXXX' < supercars.sql
```

MySQL root password can be found in tomcat9/webapps/Supercar-Trader/META-INF/context.xml


- Supercar Trader application URL should be as below:

https://8080-appdynamics-partnerlab1-xxxxxxxxxx.ws-usXX.gitpod.io/Supercar-Trader/home.do
(add /Supercar-Trader/home.do to the URL in port 8080 preview window)

- generate load 

```
cd Load-Generator/phantomjs
./start_load.sh
```




