![Ubuntu](https://github.com/jenac/kb/blob/master/images.png?raw=true)

# Allow insecure registry for docker on Ubuntu


```
sudo nano /lib/systemd/system/docker.service
```
find the following and add:
`--insecure-registry Registry:5000`, like this:
```
ExecStart=/usr/bin/dockerd --insecure-registry Registry:5000 -H fd://
```
Restart docker
```
sudo systemctl daemon-reload && sudo service docker restart
```
