# Install HashCorp Vault on Raspberry Pi

## Dowload arm version binary
* https://www.vaultproject.io/downloads
```
cd ~/Downloads
wget https://releases.hashicorp.com/vault/1.6.2/vault_1.6.2_linux_arm.zip
```

## Prepare file and folder
```
sudo mkdir /opt/vault
cd /opt/vault
sudo unzip ~/Downloads/vault_1.6.2_linux_arm.zip
```

## Prepare SSL cert
```
sudo mkdir /opt/vault/certs
cd /opt/vault/certs
sudo openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out vault.crt \
            -keyout vault.key
```

## Config Vault
```
sudo mkdir /opt/vault/data
sudo mkdir /opt/vault/config
sudo nano /opt/vault/config/config.hcl
```
File content:
```
storage "raft" {
  path    = "/opt/vault/data"
  node_id = "primary"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_cert_file = "/opt/vault/certs/vault.crt"
  tls_key_file  = "/opt/vault/certs/vault.key"
}

api_addr = "https://0.0.0.0:8200"
cluster_addr = "https://0.0.0.0:8201"
ui = true
```