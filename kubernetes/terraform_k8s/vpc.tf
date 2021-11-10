resource "yandex_vpc_network" "this" {}

resource "yandex_vpc_subnet" "subnet_resource_name" {
   network_id     = yandex_vpc_network.this.id
   zone           = var.zone
   v4_cidr_blocks = ["192.168.20.0/24"]
}
