# REST+JSON API Design - Best Practices

## Why REST?
*  **Scalability** not performance but more throughput, handles more request
*  **Generality**  well-known HTTP protocol, all languages can interactive with it (widely adopted).
*  **Independence**
*  **Latency(Caching)** use caching reduce latency
*  **Security** has some facility to ensure security
*  **Encapsulation**

## Resource
* **Collection Resource**
* **Instance Resource**

## Why JSON?
* **Ubiquity**
* **Simplicity** 
* **Readability** human readable
* **Scalability**
* **Flexibility** easy to change.

## HATEOAS
* **H** yermedia
* **A** s
* **T** he
* **E** ngine
* **O** f
* **A** pplication
* **S** tate

[See wiki:  Very nice Example](https://en.wikipedia.org/wiki/HATEOAS)

## PUT 
According RFC, put is idempotent. Clients can make that same call repeatedly while producing the same result. When use put, send all fields. Can be used for create and update. Cannot be used for partial update. Patch is for partial update.

* **for Create**, in case the id is already known. must put all data, (not partial) for idempotent.
```
PUT /applications/client-specified-id
{ ... }
```
* **for Update**, must full replacement for idempotent.
```
PUT /applications/some-id
{ ... }
```

## POST 
* **for Create** always a parent resource(collection resource)
```
POST /applications
{
	"name": "some-application"
}
```
Response 201 and location in header:
```
201 created
Location: http://server/applications/some-id
```
 
* **for Update** on instance resource, no idempotent required according RFC

returns 200, no location, since location is already known.
can be used on both full update and partial update.

Partial update can reduce network traffic.
```
 200 OK
```
**POST is the only verb that NOT idempotent**

## Media Types
* Format Specification + Parsing Rules
* Request should always have Accept: header
* Response should always have Content-Type: header

* can create you own media type like: application/foo+json

## Version
* URL: `https://api.ss.com/v1/`, easy to design, difficult to deploy

VS
* Media Type: `application/json;application&v=1`, difficult to design, easy deploy

## camelCase
JSON should be camelCase, it is JavaScript convention. Do not break it.

## Date/Time/Timestamp
Use the standard: ISO 8601:
```
"dateCreated": "2012-07-10T18:02:24.343Z" 
```
**Use UTC!**

## HREF
* Distributed Hypermedia
* Every accessible resource has a unique URL

## Response Body
* GET: yes
* POST: 
	* return the representation(same data?) in the response when feasible
	* add override(?_body=false)

## header
* Accept header values comma delimited in order of preference
```
GET /applications/a1b2c3d4
Accept: application/json, text/plain
```
means prefer application/json better.

## Resource Extensions
```
/applications/a1b2c3d4.json
/applications/a1b2c3d4.csv
```
Conventionally overrides Accept header

## Resource References (Linking)
* Linking is fundamental to scalability
* Instance Reference
* Collection Reference
```
GET /workers/xalclaef
200 OK
{
	"href": "http://....",
	"userName": "someOne",
	//collection reference
	"groups": {
		"href": "http://..."
	}
	//instance reference
	"employer": {
		"href": "http://..."
	} 
}
```

## Reference Expansion (Entity Expansion, Link Expansion)
Span/Flat links in a JSON document, and return a combined "big" JSON
Use expand parameter.
```
GET /workers/xalclaef?expand=employer

200 OK 
{
	"href": "http://....",
	"userName": "someOne",
	//collection reference
	"groups": {
		"href": "http://..."
	}
	//instance reference
	"employer": {
		"href": "http://...",
		"name": "CNPC",
		"address": "5850 Opus Pkwy"
		...
	} 
}
```

## Partial Representations
`GET /workers/xalclaef?fields=givenName,surname,employer(name)`

## Collection Resource supports query params:
* Offset
* Limit
```
/applications?offset=50&limit=20
```



