querido-diario-automation
=========================

This repository contains the Ansible script to deploy the spiders created in the 
Querido Diário project. It installs the packages necessary to run the spiders
and installs systemd services to run the spiders.


#### How to use it?

The deploys is done using Ansible. For that, you need to launch your server 
some where, configure ansible to access it and run the playbook

### Inventory

The playbooks expects a "querido_diario" group. So, first of all you need to 
configure the inventory. There a bunch of different ways to do that. You can 
check the [Ansible documentation](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) 
and choose what is better for you. One of the simplest way is have a simple 
file with the inventory. Something like this:

```
[querido_diario]
161.35.151.103
```

After you setup the inventory, you can test the access with the following 
command:

```bash
ansible -i inventoryfile -m ping querido_diario
```

### Variables

The default scrapy pipeline configured by these scripts only download the 
gazette files and upload them to a remote storage system. The only one which 
has been tested is the Digital Ocean Spaces which works with the S3 protocol. 
For this reason, it is necessary define the variables with the access information. 

All the available variables and their default values can be found at the 
roles/spider/defaults/main.yml. The playbooks already define the variables 
files at vars/configure_spiders.yml. Thus, you can just update the file with 
the variables and run the playbook.

The variables to configure the S3ish storage system are:

```
#Digital Ocean spaces config
AWS_ACCESS_KEY_ID: ""
AWS_SECRET_ACCESS_KEY: ""
AWS_ENDPOINT_URL: ""
AWS_REGION_NAME: ""
```

You should be able to get this info from your PaaS provider.

### Playbooks

After configure the inventory and the variables values (if needed), you can
run the playbooks to configure the server. There are two playbooks available,
the `configure_everything.yaml` and `configure_spider.yaml`. The 
`configure_everything.yaml` installs all the packages necessary to run the 
spiders, updates all the packages, creates user and install the systemd services
and timers to run the spiders very day. `configure_spider.yaml` reconfigures the
systemd services and timer. But it does not reconfigure the host machine. To
run the playbook the following command can be used:

```bash
ansible-playbook -i inventoryfile configure_everything.yaml
# OR
ansible-playbook -i inventoryfile configure_spider.yaml
```


