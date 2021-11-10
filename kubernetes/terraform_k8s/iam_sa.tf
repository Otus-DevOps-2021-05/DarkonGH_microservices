resource "yandex_iam_service_account" "this" {
   name = "k8s-sa-tf"
}

resource "yandex_resourcemanager_folder_iam_member" "this" {
  folder_id = var.folder_id

  member = "serviceAccount:${yandex_iam_service_account.this.id}"
  role   = "editor"
}
