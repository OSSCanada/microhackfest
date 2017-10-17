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

# create 