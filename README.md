# terraform-project
Create multi environment setup (Dev, Prod, Stag) using Custom Terraform Modules

<img width="1629" height="604" alt="image" src="https://github.com/user-attachments/assets/77c0a514-8d6a-435e-ba1f-d93b636d0665" />

Terraform files required:
- ec2.tf         |    for instance info
- s3.tf          |    for storage
- dynamodb.tf    |    for database
- variables.tf   |    for variables
- output.tf      |    for output print
- provider.tf    |    for region
- terraform.tf   |    for aws required_provider
- main.tf        |    for multi environment information
