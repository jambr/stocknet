FROM stocknet_base 

# Get pre-reqs
RUN dnf -y install redis

# Add the redis configuration
COPY redis.conf /usr/local/etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
