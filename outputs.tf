output "k8sserver-ip" {
  value = [hcloud_server.k8sserver[0].ipv4_address]
}

output "k8s-all" {
  value = [hcloud_server.k8s-all.*.ipv4_address]
}

output "k8s-etcd" {
  value = [hcloud_server.k8s-etcd.*.ipv4_address]
}

output "k8s-controlplane" {
  value = [hcloud_server.k8s-controlplane.*.ipv4_address]
}

output "k8s-worker" {
  value = [hcloud_server.k8s-worker.*.ipv4_address]
}

