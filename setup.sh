#!/bin/sh

docker run -d -p 3306:3306 -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1 mariadb
mariadb -h127.0.0.1 -uroot < supercars.sql

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
tar xf apache-tomcat-9.0.68.tar.gz
mv apache-tomcat-9.0.68 tomcat9
cp Supercar-Trader.war tomcat9/webapps/
cp setenv.sh tomcat9/bin/

curl -Lk https://github.com/csek06/appd-binary-downloader/raw/master/cmd/appd-downloader/appd-downloader_linux -o appd-downloader && chmod +x appd-downloader
./appd-downloader -java -version=22.9.1 -automate
mkdir java-agent
cd java-agent
unzip ../AppServerAgent-1.8-22.9.1.34265.zip

./tomcat9/bin/startup.sh

wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2
mv phantomjs-2.1.1-linux-x86_64 phantomjs 
cd load-generator
PATH=/workspace/partner-lab-101/phantomjs/bin:${PATH} sh start_load.sh
