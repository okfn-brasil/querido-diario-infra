querido-diario-automation
=========================

This repository contains a bunch of different script to deploy the infrastructure
used in the Querido Diário project. Right now, we have two main kind of scripts, 
the Ansible script and the Terraform scripts.

Ansible script to deploy the spiders created in the Querido Diário project. 
It installs the packages necessary to run the spiders and installs systemd 
services to run the spiders.

Terraform script is used to deploy the base infrastructure to run the applications
used by the project. The current script launch different infrastructure component,
among them: Kubernetes cluster, PostgreSQL database, Load balancer, etc.

# Terraform

```
terraform init
terraform plan
terraform apply
```

```
export KUBECONFIG=~/querido-diario/querido-diario-automation/terraform/kubeconfig
```

# Nginx ingress controller

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.46.0/deploy/static/provider/do/deploy.yaml
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx

```

# Elasticsearch

```
helm repo add elastic https://helm.elastic.co
helm install elasticsearch --version 7.12.1 elastic/elasticsearch
```


