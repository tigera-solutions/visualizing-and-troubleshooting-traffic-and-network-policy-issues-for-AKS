# Module 2 - Deploy the applications

### a. The simple application diagram is shown below: 

<p align="center">
  <img src="Images/1.m2lab3.png" align="center" width="1000">
</p>

### b. Clone the Observability Clinic Repo and grant the executable permission for the lab's script
```bash
git clone https://github.com/tigera-solutions/visualizing-and-troubleshooting-traffic-and-network-policy-issues-for-AKS.git
cd visualizing-and-troubleshooting-traffic-and-network-policy-issues-for-AKS
```

### c. Create a namespace 'java-app' which the application will be deployed in:

```bash
kubectl create namespace java-client
kubectl create namespace java-app
```

### d. Deploy the application java-app to the namespace.

```bash
kubectl apply -n java-client -f apps/java-client.yaml
kubectl apply -n java-app -f apps/java-app.yaml
```

## 2. Install a complex application

### a. The complex application diagram is shown below: 

<p align="center">
  <img src="Images/3.m1lab4-1.png" align="center" width="1000">
</p>

| Deployment Name         | Label                     | Service Port/Proto  |
| :-----------:           | :-------------:           | :-----------------: |
| adservice               | app=adservice             | 9555/TCP            |
| cartservice             | app=cartservice           | 7070/TCP            |
| checkoutservice         | app=checkoutservice       | 5050/TCP            |
| currencyservice         | app=currencyservice       | 7000/TCP            |
| emailservice            | app=emailservice          | 5000/TCP            |
| frontend                | app=frontend              | 80/TCP              |
| loadgenerator           | app=loadgenerator         |                     |
| paymentservice          | app=paymentservice        | 50051/TCP           |
| productcatalogservice   | app=productcatalogservice | 3550/TCP            |
| recommendationservice   | app=recommendationservice | 8080/TCP            |
| redis-cart              |app=redis-cart             | 6379/TCP            |
| shippingservice         | app=shippingservice       | 50051/TCP           |


### b. Create a namespace 'hipstershop' which the application will be deployed in:

```bash
kubectl create namespace hipstershop
```
### c. Deploy the application Online Boutique (Hipstershop) to the namespace. This will install the application from the Google repository.

```bash
kubectl apply -n hipstershop -f apps/hipstershop.yaml
```

### d. Wait for all PODs get in a running status

```bash
watch kubectl get pods -n hipstershop
```
```bash
NAME                                     READY   STATUS    RESTARTS   AGE
adservice-6f498fc6c6-c5rhh               1/1     Running   0          2m40s
cartservice-bc9b949b-rgqpc               1/1     Running   0          2m40s
checkoutservice-598d5b586d-nxjck         1/1     Running   0          2m41s
currencyservice-6ddbdd4956-vjzs8         1/1     Running   0          2m40s
emailservice-68fc78478-qg8qp             1/1     Running   0          2m41s
frontend-5bd77dd84b-l8qqx                1/1     Running   0          2m41s
loadgenerator-8f7d5d8d8-d7gwj            1/1     Running   0          2m40s
paymentservice-584567958d-hr5vl          1/1     Running   0          2m41s
productcatalogservice-75f4877bf4-jvnlq   1/1     Running   0          2m40s
recommendationservice-646c88579b-2t55b   1/1     Running   0          2m41s
redis-cart-5b569cd47-l29tx               1/1     Running   0          2m40s
shippingservice-79849ddf8-nlfjv          1/1     Running   0          2m40s
```

### e. Configure access for the complex application 
You can configure access via a LoadBalancer (**THIS WILL INCUR CHARGES**)
```bash
kubectl patch svc -n hipstershop frontend-external -p '{"spec": {"type": "LoadBalancer"}}'
```
Or you can run a port-forward
```bash
kubectl port-forward svc/frontend-external -n hipstershop 35001:80
```

### f. Retrieve the Hipstershop Application external IP address if LoadBalancer is used:

```bash
kubectl get svc -n hipstershop frontend-external
```

### g. Tune the lab for Observability and troubleshooting

```bash
kubectl patch felixconfiguration default --type='merge' -p '{"spec":{"flowLogsFlushInterval":"10s"}}'
kubectl patch felixconfiguration default --type='merge' -p '{"spec":{"flowLogsFileAggregationKindForAllowed":1}}'
```
These commands will send the flow logs to Calico Cloud in 10 second intervals and will also send more information on allowed flows

```bash
chmod +x tsworkshop/workshop1/lab-script.sh 
```
We will use this script later on when we troubleshoot the complex application

---

[:arrow_right: Module 3 -Secure the simple application](/mod/module-3-secure-simple-app.md)  <br>

[:arrow_left: Back to Main](/README.md)
