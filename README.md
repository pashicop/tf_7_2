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

```
