output "k8s_ctrlr_ip" {
  description = "kubernetes controller ip address"
  value       = proxmox_vm_qemu.k8s-ctrlr.default_ipv4_address
}

output "k8s_node_ip" {
  description = "kubernetes node ip addresses"
  value       = proxmox_vm_qemu.k8s-node[*].default_ipv4_address
}
# NOTE: uncomment for debugging purpose.
# output "k8s-join-cmds" {
#   description = "command to join nodes to the cluster."
#   value = chomp(data.external.join_cmd.result.output)
# }

output "kubeconfig" {
  description = "kubeconfig data"
  value       = data.external.kubeconfig.result.output
}

output "ssh_username" {
  description = "SSH username to login to controller or worker nodes."
  value       = local.ssh_user
}
