# Install and Configure Kubernetes (k8s) on Ubuntu 18.04 LTS

## VM
| Description | hostname | ip | 
| -- | -- | -- |
| Master Node | k8s-master | 192.168.1.160 |
| Slave Node 1 | k8s-worker-node1 | 192.168.1.161 |
| Slave Node 2 | k8s-worker-node1 | 192.168.1.163 |

**In HyperV:  master node need 2 cpus**

## Setup hostname
* on all nodes
```bash
sudo nano /etc/cloud/cloud.cfg
```
change the following line to `true`:
```bash
# This will cause the set+update hostname module to not operate (if true)
preserve_hostname: true
```
* on 160
```bash
sudo hostnamectl set-hostname "k8s-master"
exec bash
```
* on 161
```bash
sudo hostnamectl set-hostname k8s-worker-node1
exec bash
```
* on 163
```bash
sudo hostnamectl set-hostname k8s-worker-node2
exec bash
```

## Tweak hosts file on all nodes
```bash
sudo nano /etc/hosts
```
add the following:
```
192.168.1.160     k8s-master
192.168.1.161     k8s-worker-node1
192.168.1.163     k8s-worker-node2
```

## Install Docker on all nodes
```bash
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version
```

## Install K8 on all nodes
```bash
sudo apt-get install apt-transport-https curl -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo swapoff -a #disable swap, edit /etc/fstab comment out the swap line, if you want disable it permanently
sudo apt-get install kubeadm -y
kubeadm version
```

## Init master node (160)
```bash
sudo kubeadm init --pod-network-cidr=172.16.0.0/12 #any network
```
Example output like:
```
...
[bootstrap-token] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a                                                                                                                              Node Bootstrap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the                                                                                                                              cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.1.160:6443 --token hmfqsj.pblv9xpfcde5n3zy \
    --discovery-token-ca-cert-hash sha256:af0a947b5933c06232397361f71fc9b553068775f0fb776a534e761bf74c7afb

```

Run the command in the output:
```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
Check node:
```bash
kubectl get nodes
```
Deploy Flannel as Pod Network from Master node and verify pod namespaces
```bash
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
sudo  kubectl get nodes
sudo  kubectl get pods --all-namespaces
```

 ## Add Slave or Worker Nodes to the Cluster
 Run the command in master output, like the following:
 ```bash
 sudo kubeadm join 192.168.1.160:6443 --token hmfqsj.pblv9xpfcde5n3zy \
    --discovery-token-ca-cert-hash sha256:af0a947b5933c06232397361f71fc9b553068775f0fb776a534e761bf74c7afb
```
