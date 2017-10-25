# Working with Web App for Containers

In this lab you will be working with Web App for Containers which is one of the easiest ways to get started with building Web or REST-based APIs with Containers.

## Deployment Methods:

### 1. Deploy a Container via the Azure Portal

The purpose of this section is to help you understand how easy it is to get started with Containers using the Azure Portal.

![pull/tag/push](images/deploy_container_with_portal.png)

This method allows you to visually configure your Azure App Service to pull in ```kevingbb/bobble``` from Docker Hub (public image)
- In the Azure Portal, navigate to your Web App you can configure/link/point to ``kevingbb/bobble`` from Docker Hub (public image)
- This method is good for a single manual deployment process

### 2. Deploy a Container via the Azure CLI and scripting

The purpose of this section is to help you understand how you can script the createion of Web for Containers for DevOps purposes or if you are the type of person that does not like to use GUI Tool.

![pull/tag/push](images/deploy_container_with_cli.png)

This method allows you to script and configure your Web App to pull in ``kevingbb/bobble`` from Docker Hub (public image)
- Using Azure-CLI, create a new app service plan ```az appservice plan``` ... **Note:** Don't forget ```--is-linux``` flag
- Now create the app ```az webapp create``` ***Note:*** Don't forget to specify a container image source ```-i``` flag
- This method is best for an automated scripted process

If you are stuck, check out the **commands.sh** file in this folder.

### 3. Deploy an App with GitHub

**This method is ___not___ a container exercise.**
The purpose of this seciton is to help you understand that there is more than one type of deployment option.

![pull/tag/push](images/deploy_app_with_github.png)

This will not build/deploy an updated container, but rather will directly connect your Github repo to Azure App Services.  This is done through a webhook to Azure App Services, which will trigger Azure App Services to ```pull``` in the new code and reload your web app everytime you ```push``` new code to your repository, on a specified repo ```branch``` (usually ```master``` branch).

- Create new Web App using same App Service Plan
- Create new local web application using dotnet Core or Node or Python
- Create initialize a new Git Repo in command line
```:bash
    git init
    git add .
    git commit -m "Initial commit."
```
- Push local Git Repo to Web App service:
```:bash
    git remote add ...
    git push ...
```
- This will cause App Service to pull in the new code (via a webhook) and mount it into a Run Time Environment (Pre-baked Container for your programming language)
- This method is good for deploying application **code** directly to the App Service.

### 4. Deploy a container via a Private Container Registry (Azure Container Registry - ACR)

The purpose of this section is to help you understand how to clone/copy images via the PULL, TAG and PUSH flow.

- Create an Azure Container Registry (ACR)
- Pull in a public image from docker hub (e.g. ```kevingbb/bobble```)
- Re-tag the public image and namespace it to your private registry (hint: ```<registry_name>.azurecr.io/<image_name>```)

![pull/tag/push](images/docker_push_to_registry.png)

#### Notes:

- By default the ```docker``` command knows to ```pull``` from docker hub registry
- In order to ```push``` to your registry you must be logged in by running ```docker login <your-private-repo-url>```
    - ```docker login``` by itself will log you in to docker hub
        - you must include a URL to authenticate against a privately hosted registry (like Azure Container Registry)
    - after logging into your registry, credentials are cached for future use
        - for Azure Container Registry your username is the same as ```<registry_name>```.azurecr.io
        - the password can be found in your Azure Container Registry Dashboard in the Azure Portal
- You can check your cached credentials in your ```.docker/config.json``` in your home folder
    - you will see the registries your're logged into and can ```push``` to
- By tagging images with ```<registry_name>/<image_name>``` docker will resolve this name to the proper ```<registry_name>``` to push/pull to
    - simple names like ```kevingbb/<image_name>``` are likely docker hub registries
    - complex names like ```<registry_name>.azurecr.io/<image_name>``` are privately hosted registries (not docker hub)
    

## Troubleshooting

Trouble shooting into the container is done through Kudu and the console Kudu provides.  This allows you to SSH into the container from Kudu web interface.  The container is otherwise inaccessible directly via SSH. See the **Making a client connection** section of the following article, click [here](https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-ssh-support).

## Advanced:

1. Deploy Custom Container from Private Registry.
    **Hint:** Do the same as in step 1 except use the image you pushed to ACR in step 4.
2. Add SSH access to custom Container via Kudu
    **Hint:** Need to install SSH via Dockerfile and setup with a specific user, click [here](https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-ssh-support) for details.
3. Implement Continuous Integration
    **Hint:** Enable Continuous Deployment feature, click [here](https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-ci-cd) for details.
