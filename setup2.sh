#!/bin/sh

cp -pf controller-info.xml java-agent/conf/

./tomcat9/bin/startup.sh

URL=`gp url 8080`
echo "\n\n$URL/Supercar-Trader/home.do\n\n"

if [ -f phantomjs-2.1.1-linux-x86_64.tar.bz2 ] ; then
    echo "You have phantomjs tarball."
else
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
fi
tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2
mv phantomjs-2.1.1-linux-x86_64 phantomjs 
cd load-generator
PATH=/workspace/partner-lab-101/phantomjs/bin:${PATH} sh start_load.sh
