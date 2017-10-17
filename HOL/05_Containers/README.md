# Working with Azure Container Services Kubernetes

This lab shows how to create a Kubernetes (K8s) Cluster using ACS along with how to deploy different types of workloads.

## How To:

1. Use the ``az acs create`` command to create a cluster with the following parameters
    * Orchestrator type Kubernetes
    * 1 Master Node using a Standard_D2_v2 VM with managed disk with a master OS disk size of 50GB
    * 2 worker nodes using a Standard_D2_v2 VM with managed disks with OS disk size of 120GB
2. Use the ``az container`` command to create an ACI Container Group
2. Use the ``az acs kubernetes`` comand to install the kubectl cli (if you have not done so already)
3. Use the ``az acs kubernetes`` command to get your kube-config information for you cluster
4. Verify access to your cluster with the kubectl cli
    * kubectl get nodes
5. Create Sample Application
    * Initially the EXTERNAL-IP for the azure-vote-front service appears as pending. Once the EXTERNAL-IP address has changed from pending to an IP address put that in your browser to test out the app.
```bash
# Run K8s File.
kubectl create -f azure-vote.yaml

# Test the App.
kubectl get service azure-vote-front --watch
```
6. Cleanup Sample Application
    * 
```bash
# Delete the external facing front-end service.
kubectl delete svc azure-vote-front

# Run the Test line again to see what has changed.

# Delete the external facing back-end service.
kubectl delete svc azure-vote-back

# Delete the deployment.
kubectl delete deploy azure-vote-front
```
7. Create a Pod manifest file that has the following parameters
    * Uses 2 Labels zone = prod and version = v1
    * Uses the evillgenius\kuar:1 image
    * Exposes port 8080
    Verify Pod is operational by using ``kubectl port-forward`` command to forward port 8080 on your local host to port 8080 on the pod and checking with you browser ``http://localhost:8080``
8. Create a Deployment manifest using the same parameters as above but add
    * make 3 replicas of the app
    * use a RollingUpdate strategy with no less than 1 pod avaialble and no more than 1 pod extra during updates
    * Verify deployment is operational by using ``kubectl port-forward`` command to forward port 8080 on your local host to port 8080 on any of the pods in the deployment and checking with you browser ``http://localhost:8080``
9. Create a Service manifest that exposes the Deployment above using a LoadBalancer
    * ``Note:`` Getting an external IP may take some time initially. use ``kubectl get service -w`` until an external IP is shown. 
10. Combine the deployment Manifest and the Service Manifest into a single file and deploy to a new Namespace


## Advanced:

1. Deploy app end-to-end (Docker->ACR->ACS)
    * docker pull ...
    * docker tag ...
    * docker push ...
    * kubectl create ...
2. Add ACI Node to existing K8s Cluster and run a workload on it
3. Deploy Ingress Controller