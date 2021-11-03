.DEFAULT_GOAL := help
.PHONY: help

PROJ_ROOT=$(PWD)

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1\3/p' \
	| column -t  -s ' '

terraform_automation: ## Create VMs by terraform
	@cd terraform && terraform init -input=false && terraform plan -out=tfplan -input=false \
	&& terraform apply -input=false tfplan
	echo $(PROJ_ROOT)/terraform > $(PROJ_ROOT)/ansible/env_tf_state.env

destroy_VMs: ## Destroy VMs by terraform
	@cd terraform && terraform init -input=false && terraform plan -out=tfplan -input=false && terraform destroy

ansible_service: ## ansible service preinstall
	@cd ansible && ansible-playbook playbooks/k8s_install.yml
