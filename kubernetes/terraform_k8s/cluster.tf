resource "yandex_kubernetes_cluster" "zonal_cluster_resource_name" {
  name        = "my-cluster"
  description = "my-cluster description"
  network_id = "${yandex_vpc_network.this.id}"

  master {
    version = "1.19"
    zonal {
      zone      = "${yandex_vpc_subnet.subnet_resource_name.zone}"
      subnet_id = "${yandex_vpc_subnet.subnet_resource_name.id}"
    }
    public_ip = true
  }
  service_account_id      = "${yandex_iam_service_account.this.id}"
  node_service_account_id = "${yandex_iam_service_account.this.id}"
  release_channel = "RAPID"
  network_policy_provider = "CALICO"
  depends_on = [yandex_resourcemanager_folder_iam_member.this]

  kms_provider {
    key_id = var.k8s-kms-key_id
  }
}

locals {
  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    server: ${yandex_kubernetes_cluster.zonal_cluster_resource_name.master[0].external_v4_endpoint}
    certificate-authority-data: ${base64encode(yandex_kubernetes_cluster.zonal_cluster_resource_name.master[0].cluster_ca_certificate)}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: yc
  name: ycmk8s
current-context: ycmk8s
users:
- name: yc
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: yc
      args:
      - k8s
      - create-token
KUBECONFIG
}
