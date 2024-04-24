# List

## List
* 单键多值
* Redis列表是简单的字符串列表, 按照插入顺序排序. 你可以添加一个元素到列表头部 (左边)或者尾部(右边).
* 它的底层实际是个双向链表, 对两端的操作性能很高, 通过索引下标的操作中间的节点性能会较差。

## Commands
* `lpush/rpush <key> <v1> <v2> ...`
    * insert 1 or more values from left/right

* `lpop/rpop <key>`
    * pop a value from left/right
    * if no value left, key will be deleted.

* `rpoplpush <key1> <key2>`
    * pop value from right key1 and push left to key2

* `lrange <key> <start> <end>`
    * get elements by index in range

*  `lindex <key> <index>`
    * get element by index from left

* `llen <key>`
    * get length of the list

* `linsert <key> before <value> <newValue>`
    * insert the `newValue` after `value` from left

* `lrem <key> <n> <value>`
    * delete n*value from left
    * if n<0, from right
    * if n=0, delete all value in list

```bash
lpush k1 vx vx vx
lrem k1 2 vx
lrange 0 -1
# output: vx
```