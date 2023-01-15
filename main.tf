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
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "debian10:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.test_vm.network_interface.0.ip_address
}


output "external_ip_address_vm_1" {
  value = yandex_compute_instance.test_vm.network_interface.0.nat_ip_address
}
