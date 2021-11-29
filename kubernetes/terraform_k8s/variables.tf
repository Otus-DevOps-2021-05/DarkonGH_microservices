variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key_tf_k8s.json"
}
variable "private_key_path" {
  description = "Path to the private ssh key"
}
variable region_id {
  description = "ID of the region that the application load balancer is located at"
  default     = "ru-central1"
}
variable count_of_instances {
  description = "Count of instances"
  default = 2
}
variable core_fraction {
  description = "Core fraction for instance"
  type = number
  default = 100
}
variable cores {
  description = "Core number for instance"
  type = number
  default = 8
}
variable memory {
  description = "Memory GB for instance"
  type = number
  default = 16
}
variable disk_size {
  description = "OS disk size"
  type = number
  default = 64
}
variable is_nat {
  description = "NAT Enable"
  type = bool
  default = true
}
variable platform {
  description = "CPU family"
  type = string
  default = "standard-v2"
}
variable k8s-kms-key_id {
  description = "KMS key Id"
}
