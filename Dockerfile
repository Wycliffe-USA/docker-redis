#Dockerfile to build redis with redis cluster support.
# (Contains redis-trib.rb for use with configuring redis clustering.)
# v 0.1
FROM redis:3.2
MAINTAINER Dave Barnum Dave_Barnum@wycliffe.org

## Update  #################################
RUN apt-get update; \
    apt-get upgrade -yqq
############################################

## Setup ruby & Grab redis-trib for cluster management ##
RUN apt-get install -y ruby; \
    rm -rf /var/lib/apt/lists/*; \
    gem install redis; \
    wget --progress=dot -qO /usr/local/bin/redis-trib.rb http://download.redis.io/redis-stable/src/redis-trib.rb; \
	chmod 750 /usr/local/bin/redis-trib.rb
############################################

ADD conf/redis.conf /usr/local/etc/redis/redis.conf

