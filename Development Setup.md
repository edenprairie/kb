# This document describes how to setup development environment on Debian/Ubuntu based Linux

# Development Environment Setup

## Build Essential
```
sudo apt-get install build-essential
```

## JDK
```
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```
Set JAVA_HOME
```
nano ~/.profile
```
add the following line:
```
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
```

## Git
```
 sudo apt-get install git
```

## IntelliJ

Download IntelliJ here:
https://www.jetbrains.com/idea/#chooseYourEdition
choose community version, the .tar.gz file
```
mkdir ~/Applications
cd ~/Downloads
tar vxzf [the intelliJ file name here]
mv [unzipped intelliJ folder] ~/Applications
```
to start IntelliJ
```
cd ~/Application/[idea folder]/bin
./idea.sh
```
## Install Docker  (Ubuntu 16.04/Linux Mint 18)
### detailed steps see: [https://docs.docker.com/engine/installation/linux/ubuntulinux/](https://docs.docker.com/engine/installation/linux/ubuntulinux/)

```
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee --append /etc/apt/sources.list.d/docker.list
sudo apt-get update && sudo apt-get purge lxc-docker && apt-cache policy docker-engine
sudo apt-get update && sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get update && sudo apt-get install -y docker-engine 
sudo service docker start
sudo usermod -aG docker $USER
```
Since you changed user group on last command, you need Logout/Login to make it take effect.
or simply do a reboot using `sudo reboot`

To test docker:
```
docker run hello-world
```

## Install Docker-Compose (Ubuntu 16.04/Linux Mint 18)
### detailed steps see: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

```
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
```
Test it:
```
docker-compose --version
```
## zsh for git (recommended, if you are experienced in git command, ignore it)
https://github.com/robbyrussell/oh-my-zsh
```
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
## install nodejs via nvm, refer https://github.com/creationix/nvm
```
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
```
then close and open a new terminal.
install nodejs via nvm, choose your version here.
```
nvm ls-remote
nvm install [version]
```
ls-remote will list all available versions. Ionic 2 requires version 6 or higher. Suggest use v6.9.2 for now.
Verify:
```
node -v
npm -v
```
each time before use nodejs
```
nvm use 6.9.2
```

** Troubleshoot hint
If you nvm is not working under zsh,
Check the .zshrc for the following code:
```
export NVM_DIR="/home/[your user name]/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
```

## Install Ionic2
https://ionicframework.com/docs/v2/setup/installation/
```
npm install -g ionic cordova
```
## Install VS Code
Download the deb version of VSCode here: https://code.visualstudio.com/
```
sudo dpkg -i <the .deb file downloaded>
```
