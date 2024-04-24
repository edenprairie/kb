
```bash
sudo snap install microk8s --classic

microk8s status

microk8s.kubectl get nodes

microk8s.enable dns dashboard

microk8s.kubectl get all --all-namespaces

token=$(microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)\nmicrok8s.kubectl -n kube-system describe secret $token
```