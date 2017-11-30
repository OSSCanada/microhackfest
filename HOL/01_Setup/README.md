# Setting up your environment for the labs

In this lab you will find the prerequisites and steps to help you set up your computer. After completing the lab you will have a working environment, ready for the other labs.

## 00 Requirements

A Desktop/Laptop with the following installed:
- Win10, macOS, Linux Desktop
- Azure-CLI v2 (Python based CLI)
- Docker Community Edition "CE"
    - Download for Windows
    - Download for macOS
- A modern Web Browser (Edge, FireFox, Chrome, Safari)

## 1. Configure your computer

### Install Azure Command Line Interface (CLI)
#### If you are running Windows 10, you can install the Windows Subsystem for Linux by clicking [here](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide).

To run these labs, **Azure CLI 2.0** is required. It can be downloaded and installed from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).

Check Azure CLI is working and is 2.0.20 or above:
```bash
az --version
```
Expected output: **azure-cli (2.0.20)**

Check you can login to Azure and have access to an Azure Subscription:
```bash
az login
```
Expected output: Successful login.

Check access to Azure Subscription:
1. Login to Azure Portal: http://portal.azure.com
2. Go to **More Services** at the bottom and then select **Subscriptions**
Expected output: At least one **Active** Subscription. If there is nothing in the list you do not have access to an Azure Subscription, please let us know.

## 2. Install Visual Studio Code

To run these labs, **Visual Studio Code** is required. It can be downloaded and installed from [here](https://code.visualstudio.com).

## 3. Install Git

It should install as part of VS Code, but in case not install it from [here](https://git-scm.com).

Check git is working:
```bash
git --version
```
Expected output: **git version 2.14.1**

## 4. Create Docker Build Machine

Install Docker tools locally: 
- Docker for [Mac](https://docs.docker.com/docker-for-mac/)
- Docker for [Linux](https://docs.docker.com/engine/installation/#server)
- Docker for [Windows](https://docs.docker.com/docker-for-windows/)

Check to make sure docker is working correctly:
```bash
docker version
```

Expected output:

    Client:
    Version:      17.10.0-ce
    API version:  1.32 (downgraded from 1.33)
    Go version:   go1.9.1
    Git commit:   f4ffd25
    Built:        unknown-buildtime
    OS/Arch:      darwin/amd64

    Server:
    Version:      17.09.0-ce
    API version:  1.32 (minimum version 1.12)
    Go version:   go1.8.3
    Git commit:   afdb6d4
    Built:        Tue Sep 26 22:40:56 2017
    OS/Arch:      linux/amd64
    Experimental: false


**Only proceed with the following steps if you cannot install the Docker tools above. If you installed the tools skip to next section.**
Using **Azure Cloud Shell** in the browser, we will use the ```docker-machine``` command to provision a VM to Azure and install the Docker engine on to it.

**Note:** Azure Cloud Shell provisions a terminal session in Azure with many tools already installed including Azure-CLI, Docker, Docker-Machine and others. (more info about cloud shell [here](https://azure.microsoft.com/en-us/features/cloud-shell/))

![cloud shell](images/cloud_shell.png)

This remote Docker host VM will be used to pull and push container images to a registry and build custom images from.  We do this by configuring our local Docker Environment variables (using ```eval $(docker-machine ...)```) to "point to" the remote Docker host VM.  This will allow us to type Docker commands from our local terminal, however the commands are actually executed remotely on the Docker host VM we create.

```bash
# Not needed for cloud shell - you're already logged in.
az login

# Create a new resource group to use (you could also reuse an existing group...just remember which one you use)
az group create \
    --name docker-machine-<alias>-rg \
    --location canadacentral

az account list

# Create the remote Docker host VM
docker-machine create \
    --driver azure \
    --azure-subscription-id <subscription_id> \
    --azure-image  "Canonical:UbuntuServer:14.04.5-LTS:latest" \
    --azure-size "Standard_D2_v2" \
    --azure-resource-group docker-machine-<alias>-rg \
    --azure-location canadacentral \
    docker-machine-<alias>

# This will execute the text that docker-machine env command generates
# it is a one time variable setup - it will not persist between terminal sessions
# you must run this command again the next time you login
eval $(docker-machine env docker-machine-<alias> --shell bash)
```

## 5. Create ACS Cluster (optional, will be doing as pat of Challenge #3)

**Only proceed with the following steps if you want to provision a full ACS Kubernetes cluster versus using the new Managed Kubernetes Service called AKS.**
This section will take us through the steps of creating a new Container Cluster with Kubernetes as the Orchestrator using Azure Container Service, also known as ACS.

```bash
# Create Resource Group
az group create \
    --name acs<alias>-rg
    --location canadacentral

# Create Cluster Command.
az acs create --orchestrator-type kubernetes --resource-group acs<alias>-rg --name myK8sCluster-<alias> --generate-ssh-keys
```

## 6. Clone or download content of this GitHub repository (optional but recommended)

The labs provided have a combination of text documentation and sample code. In order to have all documentation and all necessary sample files locally on your computer, we strongly recommend you to clone the repo.

## Summary

You have the latest version of Azure CLI, Visual Studio Code and Git installed on your computer along with a Docker Host Build Machine in Azure.
