# Hash

## Hash
* value is `key: value` pairs, like json / hashmap

## Commands
* `hset <key> <field> <value>`
    * set `field: value` to hash (value of the key)

* `hget <key> <field>`
    * get the value of `field` from hash 

* `hmset <key> <f1> <v1> <f2> <v2> ...`
    * set multiple field/value to hash

* `hexists <key> <field>`
    * check if field in hash

* `hkeys <key>`
    * list all fields in the hash

* `hvals <key>`
    * list all values in the hash

* `hincrby <key> <field> <increment>`
    * add increment to the value of field in hash
    * if field not exist, will be added
    * if value is not number, error 

* `hsetnx <key> <field> <value>`
    * only set field value when field not exists in hash
