output "proxmox_ip_address_awx" {
  description = "Current IP AWX"
  value       = proxmox_vm_qemu.awx.*.default_ipv4_address
}