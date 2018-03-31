# Installation:

## Debian/Ubuntu
On Debian-based distributions, such as Ubuntu, you can install Jenkins through apt.

Recent versions are available in an apt repository. Older but stable LTS versions are in this apt repository.
```
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
```
This package installation will:

* Setup Jenkins as a daemon launched on start. See /etc/init.d/jenkins for more details.
* Create a jenkins user to run this service.
* Direct console log output to the file /var/log/jenkins/jenkins.log. Check this file if you are troubleshooting Jenkins.
* Populate /etc/default/jenkins with configuration parameters for the launch, e.g JENKINS_HOME
* Set Jenkins to listen on port 8080. Access this port with your browser to start configuration.
```
If your /etc/init.d/jenkins file fails to start Jenkins, edit the /etc/default/jenkins to replace the line ----
HTTP_PORT=8080---- with ----HTTP_PORT=8081---- 
Here, "8081" was chosen but you can put another port available.
```

# howto-jenkins-ssl
quick how to on activating ssl on jenkins, so I can find it easily

New!  Alternative procedure, using Lets Encrypt certificate, available now.  See [letsencrypt.md](letsencrypt.md).

# given:

- your website is at jenkins.myweb.com
- have openssl installed

# generate key

```
openssl genrsa -out key.pem  # creates key.pem

openssl req -new -key key.pem -out csr.pem

# you need to put the dns name of your website, testweb.local
# for the 'Common Name' question
# other questions, you can just accept defaults
# actually, you can accept defaults for all, will work ok too


openssl x509 -req -days 9999 -in csr.pem -signkey key.pem -out cert.pem
rm csr.pem
```

# start jenkins

* if you want both https and http:

```
java -jar jenkins.war --httpsPort=8443 --httpsCertificate=cert.pem --httpsPrivateKey=key.pem
```

* if you want https only, dont open http port:

```
java -jar jenkins.war --httpsPort=8443 --httpsCertificate=cert.pem --httpsPrivateKey=key.pem --httpPort=-1
```

# starting a slave

* Convert the cert.pem to cert.der:
```
 openssl x509 -outform der -in cert.pem -out cert.der
```

* create keystore, containing this cert:

```
keytool -import -alias testweb.local -keystore cacerts -file cert.der
# reply trust certificate=yes
# put keystore password of 'changeit', or make your own password
```
* transfer this file to the slave computer somehow (eg via /var/www/html, and download from slave)
* launch slave
  * as for normal slave launch, but add `-Djavax.net.trustStore=cacerts
```
java -Djavax.net.ssl.trustStore=cacerts -jar slave.jar -jnlpUrl https://jenkins.myweb.com:8443/computer/testnode/slave-agent.jnlp
```
=> will work ok :-)
