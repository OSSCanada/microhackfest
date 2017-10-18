# Working with Azure Container Services Kubernetes

This lab shows how to create a Kubernetes (K8s) Cluster using ACS along with how to deploy different types of workloads.

## Create Container with Azure Container Instance (ACI):

1. Spin up a Container using ACI
    * Use the ``az container`` command
    * Pick a Web Application Image and expose it via a Public IP
    * Test Container via Public IP

## Create Customized ACS Cluster:

1. Create a customized cluster with the following parameters
    * Use the ``az acs create`` command
    * Orchestrator type Kubernetes
    * 1 Master Node using a Standard_D2_v2 VM with managed disk with a master OS disk size of 50GB
    * 2 worker nodes using a Standard_D2_v2 VM with managed disks with OS disk size of 120GB

## Work with Already Created Cluster:

1. Install kubectl cli
    * Use the ``az acs kubernetes`` comand
2. Connect to your Kubernetes Cluster
    * Use the ``az acs kubernetes`` command
3. Verify access to your cluster with the kubectl cli
```bash
kubectl get nodes
```
4. Create Sample Application
    * Initially the EXTERNAL-IP for the azure-vote-front service appears as pending. Once the EXTERNAL-IP address has changed from pending to an IP address put that in your browser to test out the app.
```bash
# Run K8s File.
kubectl create -f azure-vote.yaml

# Test the App.
kubectl get service azure-vote-front --watch
```
5. Cleanup Sample Application
    * Remove the Deployment from Kubernetes Cluster
```bash
# Delete the external facing front-end service.
kubectl delete svc azure-vote-front

# Run the Test line again to see what has changed.

# Delete the external facing back-end service.
kubectl delete svc azure-vote-back

# Delete the deployment.
kubectl delete deploy azure-vote-front
```
6. Create a Pod manifest file that has the following parameters
    * Uses 2 Labels zone = prod and version = v1
    * Uses the evillgenius\kuar:1 image
    * Exposes port 8080
    * Verify Pod is operational by using ``kubectl port-forward`` command to forward port 8080 on your local host to port 8080 on the pod and checking with you browser ``http://localhost:8080``
7. Create a Deployment manifest using the same parameters as above but add
    * You will need to replace ``<APP_NAME_GOES_HERE>``
    * Make 3 replicas of the app
    * Use a RollingUpdate strategy with no less than 1 pod avaialble and no more than 1 pod extra during updates
    * Verify deployment is operational by using ``kubectl port-forward`` command to forward port 8080 on your local host to port 8080 on any of the pods in the deployment and checking with you browser ``http://localhost:8080``
8. Create a Service manifest that exposes the Deployment above using a LoadBalancer
    * **Hint:** You need to link the Service and Deployment together.
    * **Note:** Getting an external IP may take some time initially. use ``kubectl get service -w`` until an external IP is shown.
    * Test Container via Public IP

## Advanced:

1. Combine the deployment Manifest and the Service Manifest into a single file and deploy to a new Namespace
2. Add ACI Node to existing K8s Cluster and run a workload on it.
3. Replace LoadBalancer setup in yaml file with Ingress Controller.

## Troubleshooting

### Unable to connect to your cluster:
- Some versions of Azure-CLI will not pull down your kube config file properly
- you must pull it down manually:

```:bash
# go to your ~/.kube folder
cd ~/.kube

# copy the remote config file to your local ~/.kube folder
scp -i /path/to/your/ssh/key <your_kube_user>@<kube_cluster_name>.<azure_location>.cloudapp.azure.com:~/.kube/config .
```