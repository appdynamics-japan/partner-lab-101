FROM gitpod/workspace-full

USER gitpod

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
    && sdk update && sdk list java && 
    sdk install java 8.0.265-amzn && 
    sdk default java 8.0.265-amzn"

