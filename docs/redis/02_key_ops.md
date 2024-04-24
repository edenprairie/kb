# Common Operations on Key

| Commands | Description | |
| :-- | :-- | :-- |
| `keys *` | get all keys which match the patter | * for all keys |
| `exists <key>` | check if key exists | |	
| `type <key>` | check value type for the key | |
| `del <key>` | delete key | |
| `expire <key> <seconds>` | set expire time in seconds  |
| `ttl <key>` | check time to live for a key, -1: never expire, -2: expired  |
| `dbsize` | check current database key count | |
| `flushdb`	| delete all keys under current db | |
| `flushall` | delete all keys across all dbs | |
 
