# Working with Web App for Containers

In this lab you will be working with Web App for Containers which is one of the easiest ways to get started with building Web or REST-based APIs with Containers.

## Deployment Methods:

### 1. Deploy Container via Portal
    * ``kevingbb/bobble`` from Docker Hub

### 2. Deploy Container via CLI
    * ``kevingbb/bobble`` from Docker Hub
    * az appservice plan ... hint: don't forget --is-linux flag
    * az webapp config

### 3. Directly with Git
    * Create new Web App using same App Service Plan
    * Create new local web application using dotnet Core or Node or Python
    * Create local Git Repo
        git init
        git add .
        git commit -m "Initial commit."
    * Push local Git Repo to Web App
        git remote add ...
        git push ...

### 4. Private Registray (Azure Container Registry - ACR)
    

## Troubleshooting

1. Kudu and SSH


## Advanced:

1. Deploy Custom Container from Private Registry
2. Add SSH access to custom Container via Kudu
    ``Hint:`` Need to install SSH via Dockerfile and setup with a specific user
3. Implement Continuous Integration
    ``Hint:`` Leverage Blade in Portal
