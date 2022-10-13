FROM gitpod/workspace-full

RUN apt-get update && apt-get install mysql-client -y

USER gitpod

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 8.0.342-amzn && \
    sdk default java 8.0.342-amzn "
