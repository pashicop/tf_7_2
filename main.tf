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

resource "yandex_compute_instance" "test_vm" {
  name = "tf_test"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82vo177212nq9p12pb"
    }
  }

  network_interface {
    subnet_id = subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "debian10:${file("~/.ssh/id_rsa.pub")}"
  }
}