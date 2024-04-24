# Redis Persistence - AOF

## AOF

* 以曰志的形式来记录每个写操作， 将Redis执行过的所有写指令记录下来(读操作不记录)， 只许追加文件但不可以改写文件， Redis启动之初会读取该文件重新构建数据。 

* AOF默认不开启，需要在配置文件中配置
```
...
appendonly yes
# The name of the append only file (default: "appendonly.aof")
appendfilename "appendonly.aof"
```

## AOF文件故障备份

* AOF的备机制和性能虽然和RDB不同，但是备份和恢复操作同RDB一样，都是拷贝备份文件，需要恢复时再拷贝到Redis工作目录下，启动系统即加载。

* AOF和RDB同时启动，系统默认读取AOF的数据

## AOF文件检查，恢复
如果AOF文件损坏，可以通过redis提供的外部工具进行恢复
```
redis-check-aof --fix appendonly.aof
```
RDB have the same utility: `redis-check-rdb`

## AOF同步频率设置(config文件配置)

* `always`： 每次写入都会同步
* `everysec`： 每秒
* `no`： 不主动同步，把同步时机交给操作系统管理

## Rewrite

* AOF采用文件追加方式， 文件会越来越大。 为避免出现此种情况，新增了重写机制， 当AOF文件的大小超过所设定的阈值时， Redis就会启动AOF文件的内容压缩, 只保留可以恢复数据的最小令集。 可以使用命令`bgrewriteaof`。

## Redis如何实现重写?

* AOF文件持续增长而过大时， 会`fork`出一个新进程来将文件重写(也是先写入临时文件，再rename), 遍历新进程的内存中数据， 每条记录有一条的set语句。 重写AOF文件并不读取旧的AOF文件，而是将内存数据库的内容用命令方式重写一遍。

## 何时重写(config文件配置)
* 重写虽然可以节约大量磁盘空间 减少′恢复时间。 但是每次重写还是有一定的负担的。 因此设定Redis要满足一定条件才会进行重写。
```
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
```
* 系统载入时或者上次重写完毕时， Redis会记录此时AOF文件大小，设为`base_size`，如果当前AOF文件大小`>=base_Size+base_Size*100%` (默认)且当前大小`>=64mb`(默认)的情况下，redis会进行AOF重写。

## AOF的优点

* 备份机制稳健， 丢失数据概率低
* 可读的日志文件， 可以处理误操作

![](res/2021-01-05-14-44-50.png)

## AOF缺点
* 比RDB占用更多的磁盘空间
* 恢复备份速度慢
* 每次写都同步的话，有一定的性能损失
* Has some known issues

## 用哪个好
* 官方推荐两个都启用。
* 如果对数据不敏感， 可以单独用RDB。
* 不建议单独使用AOF, for there is known issues.
* 如果纯做缓存， 可以都不用。