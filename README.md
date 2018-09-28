# 部署指南

rancher redisHA 模板有一些问题。
需要搞的有一下：

redis-trib 只支持 ip。 所以，需要在 redis 全启动后， 再用 redis-trib 初始化集群

redis volume 是 /data 目录，所以，只需要 挂载目录的时候，rancher-nfs/???:/data 即可


# 修改为继承单机redis
