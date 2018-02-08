export DIGITALOCEAN_TOKEN := 107c684cc64c22cc9d5e89804993d060d3d3f23409555bbf45617a41aa34d84f
export KUBECONFIG 		  := assets/auth/kubeconfig

all: plan

init:
	terraform init

plan:
	terraform plan

.terraform/plan: init
	terraform plan -out=assets/plan

apply: .terraform/plan
	terraform apply "assets/plan"

destroy:
	terraform destroy -force

get:
	kubectl get nodes
	kubectl get pods --all-namespaces

deploy-dashboard:
	kubectl apply -f services/dashboard -R
