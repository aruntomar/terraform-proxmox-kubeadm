module "k8s_kubeadm" {
  k8s_controller_ip = "172.17.9.3"
  subnet_mask       = 24
  network_gateway   = "172.17.9.1"
  source            = "aruntomar/kubeadm/proxmox"
  version           = "0.0.2"
}

