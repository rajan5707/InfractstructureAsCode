
echo "	>>>>: Inintialising the terraform "
terraform init
echo "	>>>>: Running the terraform Plan"
terraform plan

echo "	>>>>: Running the terraform apply in auto approve mode"
terraform apply --auto-approve

