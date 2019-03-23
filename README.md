# HAProxy Postgresql Database Load balancing
## Network Setup Diagram
![Network Diagram](/image/db.png "Network Diagram") 

## Introduction
This repo contains setup instruction for Postgres Database Loadbalancing a Master and two slave servers using HAProxy server.

## Technology Tools used
* Packer
* Postgresql
* Terraform
* HAProxy
* GCP
* Bash Script

## How to Build GCP Images for deployment
The root directory has `packer` folder which contains the `.json` packer files that defines the image to be build.
To build the images follow the instructions below.

* Run  ` export PROJECT_ID="<paste your project name here>"` to set your project name
* Copy your gcp key `account.json` file to the `ssl` folder
* Replace  <MASTER_IP>, <SLAVE1_IP> and <SLAVE2_IP> in haproxy.cfg and recovery.conf files in the `configs` folder with  GCP static ip addresses
* while in the root directory, run the command `packer build packer/haproxy.json` to build the haproxy server image, `packer build packer/master.json` to build the master image and `packer build packer/slave.json` to build the slave image.
* Head to your GCP project under `Compute Engine > Images` to see your images

## Create Infrastructure using Terraform
To create your infrastructures on GCP, follow the instructions below.
* Navigate to any of `haproxy, master or slave` folder in the root directory and ;
* export the `.env` file variables
* Run `terraform init`
* Run ` terraform apply -input=false -auto-approve  -var="project_id"=${PROJECT_ID} -var="haproxy_static_ip"=${HAPROXY_IP} -var="project_id"=${PROJECT_ID} -var="region"=${REGION} -var="zone"=${ZONE}` for the `haproxy` server
* Run ` terraform apply -input=false -auto-approve  -var="project_id"=${PROJECT_ID} -var="master_static_ip"=${MASTER_IP} -var="project_id"=${PROJECT_ID} -var="region"=${REGION} -var="zone"=${ZONE}` for the `master` server
* Run ` terraform apply -input=false -auto-approve  -var="project_id"=${PROJECT_ID} -var="slave1_static_ip"=${SLAVE1_IP} -var="project_id"=${PROJECT_ID} -var="region"=${REGION} -var="zone"=${ZONE} -var="slave2_static_ip"=${SLAVE2_IP}` for the `slave` servers
* Navigate to `http://<HAPROXY_IP>:1936/haproxy?stats` address in the browser to see the stats dashboard

## Automating processes using Bash Script
To automate the whole process of building the image using packer and creating infrastructure and then deploying using terraform, follow the instruction below.

* Ensure you have a `.env` file created based on the `.env.sample` in the root directory
* Navigate to the root directory
* Run `. deploy.sh` or `source deploy.sh`
* Once it has finished running the script 
* Navigate to `http://<HAPROXY_IP>:1936/haproxy?stats` address in the browser to see the stats dashboard

## Authors
* Anyama Richard :hearts: