export DIGITALOCEAN_TOKEN := 107c684cc64c22cc9d5e89804993d060d3d3f23409555bbf45617a41aa34d84f

all: plan

init:
	terraform init

plan:
	terraform plan

.terraform/plan: init
	terraform plan -out=.terraform/plan

apply: .terraform/plan
	terraform apply ".terraform/plan"

destroy:
	terraform destroy -force

