kubeadm init --apiserver-advertise-address 10.0.0.130 \
             --apiserver-bind-port 8443 \
             --cri-socket=unix:///run/containerd/containerd.sock \
             --image-repository registry.aliyuncs.com/google_containers \
             --service-cidr 10.96.0.0/12 \
             --pod-network-cidr 192.244.0.0/16 \
             --service-dns-domain  beige.com 
