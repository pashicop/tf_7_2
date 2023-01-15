# tf_7_2
## ДЗ 7.2 
Создал `main.tf` с основной конфигурацией с ресурсами, `versions.tf` с провайдером и `variables.tf` с переменными для доступа к Яндекс cloud.  
Для начала работы нужно установить переменные:
+ export TF_VAR_YC_TOKEN= для создания - `yc iam create-token`
+ export TF_VAR_YC_CLOUD_ID= получить `yc config get cloud-id`
+ export TF_VAR_YC_FOLDER_ID= получить `yc config get folder-id`
![terraform_yc](https://user-images.githubusercontent.com/97126500/212569299-a66a7f89-8fe4-4562-8d81-15b114243802.png)
Виртуальная машина поднимается с debian10, доступна по ssh
![yc](https://user-images.githubusercontent.com/97126500/212569352-ee22aef2-0e23-40ff-a512-35597ec2d046.png)
Результат `terraform apply`:
```
pashi@pashi-docker:~/GolandProjects/tf_7_2$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be created
  + resource "yandex_compute_instance" "vm-1" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                debian:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDv4gDcRYeuWKos4zvlntzdwJelAM82ucUpc3w4HjKjug92wF/Ohx6Jn7j6McDagRBd1nFgtV+3RW3WVb/1nZ3FbBOpaUKofiKFGO8Rj67PfTFdanT8bDjgvPA/n36RCrWj8HSJc+pggtCsp637vHEs8m3cgTw+FgZuFJkoZp9ri4aijMvbV6uwZ2tX2Vdl+O8oUe9wmEkGcxM3OdLiw/bmPAXdSH1m7D95OzXgM7UHBaHbRxzGvtPXvPH/xjZvkg6cUy24+d6SnBeRDOmAM3e75/TGyKrGbYH33qeCmUyc1wgPVBK3qwW5zeehi4vELOrGbDP5n42X54Hku3TgVPjdYwxKi5TMMlmMLEamtqPVj1UALW9jvRoZVeq05yxiUsWJSnv8sF463D62rUDH9jUjigLxHtSNKF6GMwZL5RCim0vaL5YPBBl4cmfYRrSENxUCmnqvyM8hWU+FXL/DirrGecvSJvh0AmpynEoOuqPSzwzn1B+ndzx7ex9S2JycDQs= pashi@pashi-docker
            EOT
        }
      + name                      = "tftest"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd82vol772l2nq9p12pb"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options {
          + aws_v1_http_endpoint = (known after apply)
          + aws_v1_http_token    = (known after apply)
          + gce_http_endpoint    = (known after apply)
          + gce_http_token       = (known after apply)
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.network-1 will be created
  + resource "yandex_vpc_network" "network-1" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "network1"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.subnet-1 will be created
  + resource "yandex_vpc_subnet" "subnet-1" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet1"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.10.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_vm_1 = (known after apply)
  + internal_ip_address_vm_1 = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

```
