# Set

## Set

* No duplicate values
* Not ordered
* O(1) add/delete/search

## Commands

* `sadd <key> <v1> <v2>...`
    * add 1 or more values, if value already exists, it will be ignored

* `smembers <key>`
    * get values from the set

* `sismember <key> <value>`
    * check if value exists in set, 1: for true, 0: for false

* `scard <key>`
    * get set size

* `srem <key> <v1> <v2>`
    * remove value(s)
    * no effect if value not in set
    * returns delete count

* `spop <key>`
    * pop out a value **randomly**

* `srandmember key> <n>`
    * randomly read n values from set, values won't be removed

* `sinter <key1> <key2>`
    * return values of insect of 2 sets

* `sunion <key1> <key2>`
    * return values of union of 2 sets

* `sdiff <key1> <key2>`
    * return values of key1 except key2