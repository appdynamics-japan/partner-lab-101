#!/bin/sh

docker run -d -p 3306:3306 -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1 mariadb
sleep 5
echo "[client]\nuser = root\nhost = 127.0.0.1\n" > ~/.my.cnf
mariadb -h127.0.0.1 -uroot < supercars.sql
mariadb -h127.0.0.1 -uroot -e "SELECT * FROM supercars.MANUFACTURER;"

if [ -f apache-tomcat-9.0.68.tar.gz ] ; then
    echo "You already have apache-tomcat-9.0.68.tar.gz"
else
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
fi
tar xf apache-tomcat-9.0.68.tar.gz
mv apache-tomcat-9.0.68 tomcat9
cp Supercar-Trader.war tomcat9/webapps/
cp setenv.sh tomcat9/bin/

curl -Lk https://github.com/csek06/appd-binary-downloader/raw/master/cmd/appd-downloader/appd-downloader_linux -o appd-downloader && chmod +x appd-downloader
./appd-downloader -java -version=22.9.1 -automate
unzip -q -d java-agent AppServerAgent-1.8-22.9.1.34265.zip

echo "\n\n********************************\nEdit java-agent/conf/controller-info.xml\n\nthen execute setup2.sh\n"
