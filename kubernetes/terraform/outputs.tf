output "k8s_host" {
  value = yandex_compute_instance.k8s_host.*.network_interface.0.nat_ip_address
}
