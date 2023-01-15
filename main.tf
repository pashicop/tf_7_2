terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token                    = YC_TOKEN
#  service_account_key_file = "path_to_service_account_key_file"
  cloud_id                 = YC_CLOUD
  folder_id                = YC_FOLDER
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
}