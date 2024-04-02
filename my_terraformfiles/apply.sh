terraform init
terraform fmt
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars" --auto-approve 
terraform refresh