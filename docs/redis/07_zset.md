# Zset (sorted set)

## Zset
* Zset is much like set, no duplicate values. but each value associated with a score, the score is used to sort (low to high.
* Value not duplicate, score can be duplicate
* Can be accessed by score range

## Commands
* `zadd <key> <score1> <value1> <score2> <value2> ...`
    * insert 1 or more values to zset

* `zrange <key> <start> <end> [withscores]`
    * return values which score in range `[start, end]
    * `withscores` will also return the score with value.

    * `withscores` will also return the score with value.

* `zrangebyscore key min max [withscores] [limit offset count]`
    * Returns all the elements in the sorted set at key with a score between min and max (including elements with score equal to min or max). The elements are considered to be ordered from low to high scores.

* `zrevrangebyscore key max min [withscores] [limit offset count]`
    * same with above, but reversed order

* `zincrby <key> <increment> <value>`
    * add score=score+increment for value

* `zrem <key> <value>`
    * remove value

* `zcount <key> <min> <max>`
    * return count score in range

* `zrank <key> <value>`
    * return value rank sorted by score, start form 0