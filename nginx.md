https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/

## Step 1 – Configure Nginx repo

Run command:
$ vi /etc/yum.repos.d/nginx.repo

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/rhel/7/$basearch/
gpgcheck=0
enabled=1
```
## Step 2 – Install Nginx 
