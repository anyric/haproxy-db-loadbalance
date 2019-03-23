#!/bin/bash
set -ex
set -o pipefail

# declare image tage variables
HAPROXY_IMG_TAG=""
MASTER_IMG_TAG=""
SLAVE_IMG_TAG=""

#export envronment variables
source .env

# build haproxy image
build_haproxy_image(){
  touch haproxy_output.log
  packer build -force packer/haproxy.json 2>&1 | tee haproxy_output.log
  HAPROXY_IMG_TAG="$(grep 'A disk image was created:' haproxy_output.log | cut -d' ' -f8)"
}

# build master image
build_master_image(){
  touch master_output.log
  packer build -force packer/master.json 2>&1 | tee master_output.log
  MASTER_IMG_TAG="$(grep 'A disk image was created:' master_output.log | cut -d' ' -f8)"
}

#build slave image
build_slave_image(){
  touch slave_output.log
  packer build -force packer/slave.json 2>&1 | tee slave_output.log
  SLAVE_IMG_TAG="$(grep 'A disk image was created:' slave_output.log | cut -d' ' -f8)"
}

# create infrastructure and deploy haproxy server
deploy_haproxy(){
  cd terraform/haproxy/
  terraform init -input=false
  terraform apply -input=false -auto-approve -var="haproxy_image"=${HAPROXY_IMG_TAG} -var="project_id"=${PROJECT_ID} -var="haproxy_static_ip"=${HAPROXY_IP} 2>&1 | tee terraform_haproxy_output.log
}

#create infrastructure and deploy master server
deploy_master(){
  cd terraform/master/
  terraform init -input=false
  terraform apply -input=false -auto-approve -var="master_image"=${MASTER_IMG_TAG} -var="project_id"=${PROJECT_ID} -var="master_static_ip"=${MASTER_IP} 2>&1 | tee terraform_master_output.log
}

# create infrastructure and deploy 2 slave serves
deploy_slave(){
  cd terraform/slave/
  terraform init -input=false
  terraform apply -input=false -auto-approve -var="slave_image"=${SLAVE_IMG_TAG} -var="slave1_static_ip"=${SLAVE1_IP} -var="project_id"=${PROJECT_ID} -var="slave2_static_ip"=${SLAVE2_IP} 2>&1 | tee terraform_slave_output.log
}

main(){
  #build and deploy master
  build_master_image
  deploy_master

  #build and deploy slaves
  build_slave_image
  deploy_slave

  #build and deploy haproxy
  build_haproxy_image
  deploy_haproxy
}

main