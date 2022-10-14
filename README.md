# AppDynamics Java 101 lab

## ToDo

- download Tomcat 9 and deploy sample application (Supercar Trader)

```
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
tar xvf apache-tomcat-9.0.68.tar.gz
mv apache-tomcat-9.0.68 tomcat9
cp Supercar-Trader.war tomcat9/webapps/
```

- start up MariaDB container

```bash
docker run -d -p 3306:3306 -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1 mariadb
```

- populate data into Supercar Trader tables

```bash
mysql -h127.0.0.1 -uroot < supercars.sql
```

make sure application data with MariaDB Monitor

```bash
mariadb -h127.0.0.1 -uroot supercars
```

```sql
MariaDB [supercars]> show tables;
+---------------------+
| Tables_in_supercars |
+---------------------+
| CARS                |
| ENQUIRIES           |
| MANUFACTURER        |
+---------------------+

MariaDB [supercars]> select * from MANUFACTURER;
+-----------------+--------------+-------------------------------------+---------------------+-----------------+-----------------+
| MANUFACTURER_ID | NAME         | WEB                                 | EMAIL               | SMLLOGO         | LRGLOGO         |
+-----------------+--------------+-------------------------------------+---------------------+-----------------+-----------------+
|               1 | Porsche      | http://www.porsche.com              | web@porsche.com     | Porsche.gif     | Porsche.png     |
|               2 | Ferrari      | http://www.ferrari.com/en_us/       | web@ferrari.com     | Ferrari.gif     | Ferrari.png     |
|               3 | Aston Martin | http://www.astonmartin.com          | web@astonmartin.com | AstonMartin.gif | AstonMartin.png |
|               4 | BMW          | http://www.bmw.com/com/en/          | web@bmw.com         | Bmw.gif         | Bmw.png         |
|               5 | Mercedes     | https://www.mbusa.com/en/home       | web@mbusa.com       | Mercedes.gif    | Mercedes.png    |
|               6 | Jaguar       | http://www.jaguarusa.com/index.html | web@jaguarusa.com   | Jaguar.gif      | Jaguar.png      |
|               7 | Lamborghini  | http://www.lamborghini.com/en/home/ | web@lamborghini.com | Lamborghini.gif | Lamborghini.png |
|               8 | Lotus        | http://www.lotuscars.com            | web@lotuscars.com   | Lotus.gif       | Lotus.png       |
|               9 | McLaren      | https://www.mclaren.com/            | web@mclaren.com     | McLaren.gif     | McLaren.png     |
+-----------------+--------------+-------------------------------------+---------------------+-----------------+-----------------+
```

- Download AppDynamics Java Agnet from [AppDynamics Portal](https://accounts.appdynamics.com/downloads)

    - Type: Java
    - Version: Latest Version
    - Operating System: Linx
    - Name: Java Agent JDK8+


- Extract Java Agent and configure

```
mkdir java-agent
cd java-agent
unzip ../AppServerAgent-1.8-22.9.1.34265.zip
```

edit java-agent/conf/controller-info.xml

- instrument APpDynamics Java Agent to Tomcat

```bash
# tomcat9/bin/setenv.sh
export CATALINA_OPTS="$CATALINA_OPTS -javaagent:/workspace/partner-lab-101/java-agent/javaagent.jar"
```

- start up Tomcat 9

```bash
./tomcat9/bin/startup.sh
```

- Supercar Trader application URL should be as below:

https://8080-appdynamics-partnerlab1-xxxxxxxxxx.ws-usXX.gitpod.io/Supercar-Trader/home.do
(add /Supercar-Trader/home.do to the URL in port 8080 preview window)


[Instrument Apache Tomcat](https://docs.appdynamics.com/appd/22.x/latest/en/application-monitoring/install-app-server-agents/java-agent/install-the-java-agent/agent-installation-by-java-framework/apache-tomcat-startup-settings)

- generate load 

```
cd Load-Generator/phantomjs
sh ./start_load.sh
```
