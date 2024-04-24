# Redis Intro

## 应用场景

1. 配合关系型数据库做高速缓存
    * 高频， 热点数据，降低IO
    * 分布式构架，做session共享
2. 由于其拥有持久化能力，利用其多样的数据结构存储特定的数据
    * 最新N个数据 （通过List实现按自然时间排序的数据）
    * 排行榜， Top N（利用zset有序集合）
    * 时效性数据，比如手机验证码（Expire过期）
    * 计数器，秒杀（原子性，自增减方法INCR, DECR)
    * 去重（利用Set集合）
    * 构建队列（利用LIst）
    * 发布/订阅 (pub/sub)


## Redis是单线程十多路IO复用技术

多路复用是指使用一个线程来检查多个文{牛描述符 (Socket) 的就绪状态， 比如调用select和epoll函数, 传入多个文件描述符，如果有一个文件描述符就绪则返回, 否则阻塞直到超时。 得到就绪状态后进行真正的操作可以在同一个线程里执行, 也可以启动线程执行 (比如使用线程池) 。


## Redis 五大数据类型

	* string 
	* set
	* list
	* hash
	* zset


**By default Redis has 16 db, can be configure to more or less.
`select 1` switch to db 1**
