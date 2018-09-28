FROM registry.cn-shenzhen.aliyuncs.com/sjroom/alpine-redis-single
## 创建一个redis.conf文件，打开集群相关配置，默认端口不写的话为6379
RUN echo "cluster-enabled yes" >> /etc/redis.conf
RUN echo "cluster-config-file nodes_6379.conf" >> /etc/redis.conf
RUN echo "cluster-node-timeout 10000" >> /etc/redis.conf
RUN echo "maxmemory 4294967296" >> /etc/redis.conf
RUN echo 'save ""' >> /etc/redis.conf
