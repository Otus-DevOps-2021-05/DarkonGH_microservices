resource "yandex_kubernetes_node_group" "my_node_group" {
  cluster_id  = "${yandex_kubernetes_cluster.zonal_cluster_resource_name.id}"
  name        = "name"
  description = "description"
  version     = "1.19"

  labels = {
    "key" = "value"
  }

  instance_template {
    platform_id = var.platform

    network_interface {
      nat                = var.is_nat
      subnet_ids         = ["${yandex_vpc_subnet.subnet_resource_name.id}"]
    }

    resources {
      memory = var.memory
      cores  = var.cores
    }

    boot_disk {
      type = "network-ssd"
      size = var.disk_size
    }

    scheduling_policy {
      preemptible = false
    }

    metadata = {
      ssh-keys = "ubuntu:${file(var.public_key_path)}"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.count_of_instances
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }
}
