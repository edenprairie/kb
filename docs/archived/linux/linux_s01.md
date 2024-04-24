# Ubuntu 16.04 no wifi at start up issue

## Solution
```
sudo nano /etc/systemd/system/wifi-resume.service
```
put the following as file content:
```
[Unit]
Description=Restart networkmanager at resume
After=suspend.target
After=hibernate.target
After=hybrid-sleep.target

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart network-manager.service

[Install]
WantedBy=suspend.target
WantedBy=hibernate.target
WantedBy=hybrid-sleep.target
```
enable the service
```
sudo systemctl enable wifi-resume.service
```