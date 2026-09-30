modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sysctl --system

nerdctl --namespace k8s.io images

/etc/nerdctl/nerdctl.toml
namespace = "k8s.io"

kubeadm init --apiserver-advertise-address 10.0.0.130 \
             --apiserver-bind-port 8443 \
             --cri-socket=unix:///run/containerd/containerd.sock \
             --image-repository registry.aliyuncs.com/google_containers \
             --service-cidr 10.96.0.0/12 \
             --pod-network-cidr 10.244.0.0/16 \
             --service-dns-domain  beige.com 
