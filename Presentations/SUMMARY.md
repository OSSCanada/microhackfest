# Summary

The purpose of this section is to talk about the differences between the different types of Azure Container Offerings.

## 1. Web App for Containers

### Key Points

- Easy to use, quick to get up & running
- Don't need to worry about understanding Container Orchestartion yet
- Focused on helping customer get started with Containers (think Crawl & Walk)
- Becomes hard to manage at real large scale, think 100's or 1000's of Containers

### AWS & GCP Counterparts

- AWS = Elastic Beanstalk **Kind Of**
- GCP = Google App Engine (GAE)

## 2. Azure Container Registry (ACR)

### Key Points

- It is a Private Container Registry
- It does not have the same functionality as other registries out there (eg. image management, security built-in)

### AWS & GCP Counterparts

- AWS = EC2 Container Registry
- GCP = GCP Container Registry

## 3. Azure Container Instance (ACI)

### Key Points

- It is in Preview today
- Think Serverless Containers, this is a differentiator today compared to competitors
- Easy & Quick to spin up a Single Container, not so great at Multiple Containers and Multiple Pods
- Don't need to worry about underlying Container Orchestrator

### AWS & GCP Counterparts

- None.

## 4. Azure Container Service (ACS)

### Key Points

- Moving towards Managed K8s (AKS), this is where the industry is moving
- Have the choice of full control (need to manage) versus fully managed service (patching & upgrading)

### AWS & GCP Counterparts

- AWS = EC2 Container Service
- GCP = Google Container Engine (GKE)

## 5. Azure Service Fabric (ASF)

### Key Points

- Microsoft's First Party Opinionated Microservices Platform
- It is tried and true, runs a large portion of Azure
- Proven technology, Microsoft has been running it for more than 10+ years
- Great Microservices Platform for customers that are writing Native Microservices and working with Containers
- Single Platform for all types of workloads regardless of OS

### AWS & GCP Counterparts

- None.
