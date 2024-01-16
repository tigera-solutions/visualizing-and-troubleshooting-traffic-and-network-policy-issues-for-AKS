# Module 4 - Troubleshooting the complex application


## 1. Calico Policy and Tier flows

Tiers are a hierarchical construct used to group policies and enforce higher precedence policies that other teams cannot circumvent, providing the basis for **Identity-aware micro-segmentation**.

All Calico and Kubernetes security policies reside in tiers. You can start “thinking in tiers” by grouping your teams and the types of policies within each group, such as security, platform, etc.

Policies are processed in sequential order from top to bottom.

![policy-processing](https://user-images.githubusercontent.com/104035488/206433417-0d186664-1514-41cc-80d2-17ed0d20a2f4.png)

Two mechanisms drive how traffic is processed across tiered policies:

- Labels and selectors
- Policy action rules

For more information about tiers, please refer to the Calico Cloud documentation [Understanding policy tiers](https://docs.calicocloud.io/get-started/tutorials/policy-tiers)

## 2. Setup the tiers and policies

```bash
kubectl apply -f tsworkshop/workshop1/manifests/tiers.yaml
kubectl apply -f tsworkshop/workshop1/manifests/tshoot-policies.yaml
```

## 3. Identify denied flows using Service Graph

#### a. Run the script below:

```bash
/tsworkshop/workshop1/lab-script.sh
```

#### b. Typing the option “1” (Demo Break Online Boutique - Dynamic Service and Threat Graph) and press “Enter”

#### c. Type "99" and enter to exit

#### d. Open the Online Boutique fontpage and select any product:

<p align="center">
  <img src="Images/1.m2lab1-1.png" alt="Online Boutique" align="center" width="800">
</p>

#### e. Add the product to the Cart:

<p align="center">
  <img src="Images/2.m2lab1-2.png" alt="Online Boutique - Add to the Cart" align="center" width="800">
</p>

#### f. Click place order:

<p align="center">
  <img src="Images/3.m2lab1-3.png" alt="Online Boutique - Place order" align="center" width="800">
</p>

#### g. The request didn’t complete and return HTTP 500 Internal error:

```nano
HTTP Status: 500 Internal Server Error

rpc error: code = Internal desc = failed to charge card: could not charge the card: rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing dial tcp 10.49.11.61:50051: i/o timeout"
failed to complete the order
```
<p align="center">
  <img src="Images/4.m2lab1-4.png" alt="500 Internal Server Error" align="center" width="800">
</p>

#### h. How can we fix this?

#### i. To revert back the misconfiguration applied, run the script and type “11” (LAB Fix Online Boutique - Kibana) and press Enter. To exit type "99" and press “Enter”.

## 4. Identify denied flows using the Flow Visualizations


#### a. Open the lab and run the script below:

```bash
/tsworkshop/workshop1/lab-script.sh
```

#### b. Type the option “4” (LAB Break Online Boutique - Flow Visualizations) and press “Enter”

#### c. Type "99" and “Enter” to exit

#### d. Open the Online Boutique fontpage and select any product:

<p align="center">
  <img src="Images/1.m2lab1-1.png" alt="Online Boutique" align="center" width="800">
</p>
```

#### e. Add to the Cart and click on “Place Order”.


#### f. An internal server error will return saying *“failed to get product #"OLJCESPC7Z"“*:

```nano
HTTP Status: 500 Internal Server Error
rpc error: code = Internal desc = failed to prepare order: failed to get product #"OLJCESPC7Z"
failed to complete the order
```

<p align="center">
  <img src="Images/23.m2lab4-1.png" alt="Online Boutique - Error" align="center" width="800">
</p>

#### g. How can we fix this?

#### h. To revert back the misconfiguration applied, run the script and type “41” (LAB Fix Online Boutique - Kibana) and press Enter. To exit type "99" and press “Enter”.

## 5. Identify denied flows using Kibana

#### a. Open the lab and run the script below:

```bash
/tsworkshop/workshop1/lab-script.sh
```

#### b. Type the option “6” (LAB Break Online Boutique - Kibana) and press “Enter”

#### c. Type "99" and press “Enter” to exit the script

#### d. Open the Online Boutique fontpage and select any product:

<p align="center">
  <img src="Images/1.m2lab1-1.png" alt="Online Boutique" align="center" width="800">
</p>

#### e. Add to the Cart and click on “Place Order”.

#### f. An internal server error will return saying “failed to get user cart during checkout”

```nano
HTTP Status: 500 Internal Server Error
rpc error: code = Internal desc = cart failure: failed to get user cart during checkout: rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing dial tcp 10.49.114.104:7070: i/o timeout"
failed to complete the order
main.(*frontendServer).placeOrderHandler
```

<p align="center">
  <img src="Images/30.m2lab6-1.png" alt="Online Boutique - 500 Internal Server Error" align="center" width="800">
</p>

#### g. How can we fix this?

#### h. To revert back the misconfiguration applied, run the script and type “61” (LAB Fix Online Boutique - Kibana) and press Enter. To exit type "99" and press “Enter”.
