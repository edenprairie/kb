# Install Jenkins on raspberry pi
```
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-11-jre -y
java --version
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian binary/' | sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt update
sudo apt install jenkins -y
```