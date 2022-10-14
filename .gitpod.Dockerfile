FROM gitpod/workspace-full

RUN sudo apt-get update && sudo apt-get install mysql-client mariadb-client -y

USER gitpod

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 8.0.342-amzn && \
    sdk default java 8.0.342-amzn "

