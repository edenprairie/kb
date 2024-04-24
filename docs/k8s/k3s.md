# Install kubectl
```bash
sudo apt update && sudo apt upgrade -y
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod a+x ./kubectl
./kubectl version --client
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
```

# Install k3d
```bash
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
k3d --help
```

# Create cluster
```bash
# t500 is the cluster name
# if you want generate cert for addition ips add  -x --tls-san="1.2.3.4"
# check https://github.com/rancher/k3d/issues/36
k3d cluster create t500 --api-port 6443 --servers 1 --agents 1 -p "30000-32767:30000-32767@server[0]"
kubectl custer--info
```

# Deploy portainer
```bash
kubectl get sc
kubectl create namespace portainer
kubectl apply -n portainer -f https://raw.githubusercontent.com/portainer/k8s/master/deploy/manifests/portainer/portainer.yaml
# show portainer pod
kubectl get pods --namespace portainer
# show pod details: portainer-c999955f7-khw2b from last command output
kubectl describe pods portainer-c999955f7-khw2b --namespace portainer
```
now go to http://your_ip:30777/#!/init/admin see portainer web ui

