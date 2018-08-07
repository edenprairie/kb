https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/

## Step 1 – Configure Nginx repo

Run command:
```
$ vi /etc/yum.repos.d/nginx.repo
```
```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/rhel/7/$basearch/
gpgcheck=0
enabled=1
```
## Step 2 – Install Nginx 

```
$ sudo yum install nginx
```

## Step 3 – Start/stop/restart nginx server

```
$ sudo systemctl enable nginx
```
Start Nginx command
```
$ sudo systemctl start nginx
```
Stop Nginx command
```
$ sudo systemctl stop nginx
```
Restart Nginx command
```
$ sudo systemctl restart nginx
```
Find status of Nginx server command
```
$ sudo systemctl status nginx
```

## Step 4 – Open port 80 and 443 using firewall-cmd
You must open and enable port 80 and 443 using the firewall-cmd command:
```
$ sudo firewall-cmd --permanent --zone=public --add-service=http
$ sudo firewall-cmd --permanent --zone=public --add-service=https
$ sudo firewall-cmd --reload
```



