# MISC

## systemjs.config.js

index.html --> systemconfig --(packl--)> main.js --> main.ts --(contains)--> platformBrowserDynamic() --(bootstrap)--> AppModule

# VSCode

**settings to exclude some files**
```javascript
{
    "files.exclude" : {
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true
    }
}
```