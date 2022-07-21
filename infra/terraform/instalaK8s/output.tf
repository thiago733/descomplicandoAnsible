output "proxmox_ip_address_k8s" {
  description = "Current IP K8s"
  value       = proxmox_vm_qemu.k8s.*.default_ipv4_address
}