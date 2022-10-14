#!/bin/sh
export CATALINA_OPTS="$CATALINA_OPTS -javaagent:$GITPOD_REPO_ROOT/java-agent/javaagent.jar"
