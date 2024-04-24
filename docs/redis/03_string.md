# String

* String是Redis最基本的类型, 你可以理解成与Memcached一模一样的类型, 一个key对应一个value.
* String类型是二进制安全的. 意味着Redis的string可以包含任何数据. 比如jpg图片或者序列化的对象.
* 一个Redis中字符串value最多可以是512M

## Operations

| command | description |
| :-- | :-- |
| `get <key>` | 查询对应键值 |
| `set <key> <value>` | 添加键值对 |
| `append <key> <value>` | 将给定的value追加到原值的末尾 |
| `strlen <key>` | 获得值的长度 |
| `setnx <key> <value>` | 只有在key不存在时设置 key的值 |
| `incr <key>` | <ul><li>将key中储存的数字值+1</li><li>只能对数字值操作, 如果为空, 新增值为1</li></ul>|
| `decr <key>` | <ul><li>将key中储存的数字值-1</li><li>只能对数字值操作, 如果为空, 新增值为-1</li></ul>|
| `incrby/decrby <key> <step>` | 将key中储存的数字值增减, 自定义步长|
| `mset <k1> <v1> <k2> <v2> ...` | 同时设置一个或多个 key-Value对 |
| `mget <k1> <k2> ...` | 同时获取一个或多个value |
| `msetnx <k1> <v2> <k2> <v2> ...` | 同时设置一个或多个 key-Value对, 当且仅当所有给定key都不存在 |
| `getrange <key> <start> <end>` | get value in range [start, end]. like substring |
| `setrange <key> <start> <value>` | overwrite value on key with position `start` |
| `setex <key> <expire> <value>` | set value with expire in seconds |
| `getset <ke> <value>` | set new value and return the old value |