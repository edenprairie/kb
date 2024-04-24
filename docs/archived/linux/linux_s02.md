
# Systemd to start docker containers at startup
create ci service
```
sudo nano /lib/systemd/system/ci.service 
```
put the following:
```
[Unit]
Description=Start CI dockers at startup
Documentation=see wiki
After=docker.service
Requires=docker.service

[Service]
ExecStart=/usr/local/bin/docker-compose --file /home/lihe/dockers/ci-docker-compose.yml up -d
ExecStop=/usr/local/bin/docker-compose --file /home/lihe/dockers/ci-docker-compose.yml stop
#ExecStart=/usr/bin/docker start xxxxx
#ExecStop=/usr/bin/docker stop xxxx
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
enable the service:
```
sudo systemctl enable ci.service
sudo systemctl daemon-reload && sudo service ci restart
```
