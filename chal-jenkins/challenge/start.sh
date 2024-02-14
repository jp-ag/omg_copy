#!/bin/bash

# Start web server if it is not running
#ps -ef | grep jenkins.war | grep -v grep
#pidof java 
#if [ $? -eq 1 ]
#then
	# /var/jenkins_home/logs.txt
	# currently capturing logs
#pkill -f 'java -jar'
#(java -jar usr/share/jenkins/jenkins.war) > /dev/null 2>&1 &
#fi

# Proxy stdin/stdout to server
#socat - TCP:127.0.0.1:8080,forever

/bin/bash -i