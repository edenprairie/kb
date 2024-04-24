# CORS and withCredentials issue

##  Symptom
When server have CORS enabled, cookie/session does not persist among requests.

## Solution
### Client: when send request should add `withCredentials: true` in header
```typescript
let headers = new Headers();
headers.append('Content-Type', 'application/json');
let options = new RequestOptions({ headers: headers, withCredentials: true });
http.post('http://localhost:3000/api/authenticate' , data, this.options);
```

### Server: CORS header need adjust
```javascript
res.header("Access-Control-Allow-Origin", "http://localhost:4200"); 
res.header("Access-Control-Allow-Credentials", true);
```
**Access-Control-Allow-Origin** cannot use *, otherwise the following error:

`
Response to preflight request doesn't pass access control check: The value of the 'Access-Control-Allow-Origin' header in the response must not be the wildcard '*' when the request's credentials mode is 'include'. Origin 'http://localhost:4200' is therefore not allowed access. The credentials mode of requests initiated by the XMLHttpRequest is controlled by the withCredentials attribute.
`

Additonal: 

[preflight request](https://developer.mozilla.org/en-US/docs/Glossary/Preflight_request)
