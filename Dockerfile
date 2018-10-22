FROM registry.cn-shenzhen.aliyuncs.com/sjroom/alpine-redis-single
## 如果配置yes则开启集群功能，此redis实例作为集群的一个节点，否则，它是一个普通的单一的redis实例。
RUN echo "cluster-enabled yes" >> /etc/redis.conf
# 虽然此配置的名字叫"集群配置文件"，但是此配置文件不能人工编辑，它是集群节点自动维护的文件，主要用于记录集群中有哪些节点、他们的状态以及一些持久化参数等，
# 方便在重启时恢复这些状态。通常是在收到请求之后这个文件就会被更新。
RUN echo "cluster-config-file nodes_6379.conf" >> /etc/redis.conf
# 这是集群中的节点能够失联的最大时间，超过这个时间，该节点就会被认为故障。
# 如果主节点超过这个时间还是不可达，则用它的从节点将启动故障迁移，升级成主节点。
# 注意，任何一个节点在这个时间之内如果还是没有连上大部分的主节点，则此节点将停止接收任何请求。一般设置为15秒即可。
RUN echo "cluster-node-timeout 15000" >> /etc/redis.conf
# 动态追加内存
RUN echo "maxmemory 4294967296" >> /etc/redis.conf
RUN echo 'save ""' >> /etc/redis.conf
