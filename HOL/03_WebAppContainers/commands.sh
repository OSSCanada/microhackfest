#! /bin/bash

# Create app service plan to deploy to
# https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-cli

# example
az group create --name <resource-group-name> --location <azure-datacentre-loc>
az appservice plan create -g <resource-group-name> --name <appservice-plan-name> --is-linux
az webapp create -n <web-app-name> -g <resource-group-name> --plan <appservice-plan-name> -i <docker-image-name>

# Reconfigure your exisiting Web App for Container service
az webapp config container set -n <web-app-name> -g <resource-group-name> -c <new-docker-image-name>

# Loging into private docker registry (ACR)
docker login <your-registry-name>.azurecr.io

# Prompt for username: ACR the username is the same as <your-registry-name>
# enter password: Password is found in Azure Dashboard for ACR
# you can have 2 simultaneously under Access keys

# Your ~/.docker/config.json should contain something like this:
#
# {
#    "auths": {
#        "https://index.docker.io/v1/": {},
#        "https://<registry_name>.azurecr.io": {}
#    }
# }
#

# re-tagging an image
docker tag <registry_name>/<image_name> <new_registry_url>/<image_name>:<version>

# push image to new registry
docker push <new_registry_url>/<image_name>

# Docker will match up your <new_registry_url> with wha is in your config.json file...
# without a match it will try to push to docker hub
# if the project does not exist/you do not have auth to push to a repo of that name, the push fails
