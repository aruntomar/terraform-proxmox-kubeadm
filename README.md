# terraform-proxmox-kubeadm
Terraform module to deploy Kubernetes cluster on Proxmox using kubeadm for your HomeLab

## Features
--
- Automated installation. No need to ssh into any node. 
- Customizable, i.e you can set your own ip for the controller node. 
- Entirely in Terraform, no ansible. 
- Default deployment config [1 controller, 3 nodes]. 

## Prerequisites
--
- A proxmox node(s) with sufficient capacity. 
- A proxmox vm template with kubeadm and other tools installed, that support cloud-init. You can use my packer config to build the template (https://github.com/aruntomar/homelab/tree/main/proxmox/packer-kubeadm)
- Static ip's. 1 ip for k8s controller and 3 ip's for nodes.

### Usage

```
module "k8s_kubeadm" {
  k8s_controller_ip = "172.17.9.3"
  subnet_mask = 24
  network_gateway = "172.17.9.1"
  source = "aruntomar/kubeadm/proxmox"
  version = "0.0.2"
}

```

### Kubeconfig

```
output "kubeconfig" {
# update your module name. here we are using k8s_kubeadm
    value = module.k8s_kubeadm.kubeconfig
}
```

Save the config file

```
terraform output -raw kubeconfig > ~/.kube/config

# test access to k8s cluster
kubectl get nodes

```
