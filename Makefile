
.PHONY: deploy-api
deploy-api:
	ansible-playbook -i hosts configure_api.yaml

.PHONY: update-api
update-api:
	ansible-playbook -i hosts update_api.yaml

.PHONY:ping
ping:
	ansible -i hosts -m ping all
