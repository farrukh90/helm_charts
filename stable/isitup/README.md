# Isitup Helm Chart created by Fuchicorp

## Prerequisites Details
* Kubernetes  
* TLS certificates or a way to provision them



## Chart Details
This chart will do the following:

* Deploy the Isitup server using Kubernetes Deployment 

## Chart Installation
To get started add our repository 
```bash
$  helm repo add fuchicorp https://fuchicorp.github.io/helm_charts
```

## Install isitup chart 
This chart will install the isitup server with ClusterIP

To install the chart with the release name `isitup`:

```
$ helm install --name isitup fuchicorp/isitup
```



## Upgrading chart, after changing values in values.yaml
```bash
$ helm upgrade isitup ./isitup
```
## Fetch the isitup chart and customize

```bash
$ helm fetch fuchicorp/isitup --untar
```

## Installing the custom chart

To install the chart with the release name `isitup`:

```bash
$ helm install --name isitup fuchicorp/isitup
```
## After Install Instructions
Once you have installed your chart you will see that we have populated the bootstrapping, context and verify commands for you. You can copy and paste these into your prompt to complete the process quickly. 

## Configurations of the Waypoint helm chart
 Parameter               | Description                           | Default                                                    |
| ----------------------- | ----------------------------------    | ---------------------------------------------------------- |
| `Name`                  | isitup name name               | `isitup`                                                   |
| `Image`                 | Container image name                  | `isitup`                                                   |
| `ImageTag`              | Container image tag                   | `0.1.5`                                                    |
| `ImagePullPolicy`       | Container pull policy                 | `IfNotPresent`                                                   |
| `securityContext`       | set fsGroup                           | `1000`                                                     |
| `nameOverride`                    | Override the resource name prefix    | `{}`                                 |
| `fullnameOverride`                | Override the full resource names     |  `{}` 
| `service.type`        | Configures the service type       |  `ClusterIP`                                               |
| `service.port`        | Configures the service port  | `80`                                                |
| `isitupServer.Ingress.enabled`     | Create Ingress for isitup UI (https)      | `true`                                                    |
| `isitupServer.Ingress.annotations` | Associate annotations to the Ingress  | `{}`                                                       |
| `isitupServer.Ingress.labels`      | Associate labels to the Ingress       | `{}`                                                       |
| `isitupServer.Ingress.hosts`       | Associate hosts with the Ingress      | `[]`                                                       |
| `isitupServer.Ingress.path`        | Associate TLS with the Ingress        | `/`                                                        |
| `isitupServer.Ingress.tls`         | Associate path with the Ingress       | `[]`                                                       
| `githubProxy`         | Proxy server for authontication of the user      | `true`

| `githubProxy.githubOrganizition`         | Authontecation for github organizition      | `github_organizations` 

| `Resources`             | Container resource requests and limits| `{}`                                                       
| `nodeSelector`          | Node labels for pod assignment        | `{}`                                                       |
| `affinity`              | Affinity settings                    | `{}`                                               |
| `tolerations`           | Tolerations for pod assignment        | `[]`                                                       |



### **Examples below are of the service type and ports associated:**
  - **LoadBalancer** 
```
service:
  type: LoadBalancer
  port: 80
  ```
  - **ClusterIP** 
```
service:
  type: ClusterIP
  port: 80
```
  - **NodePort** 
```
service:
  type: NodePort
  port: 80
```
Please note, you will need to allow access for these ports via your firewall or security group.  We have provided the suggested commands for bootstrapping,context and verify but the NodPort is not fully tested. 



### If you want to enable ingress and TLS we need to enable this confuguration true and move to command out for annotations
```
ingress:
  enabled: false
  annotations: 
    # kubernetes.io/ingress.class: nginx
    # cert-manager.io/cluster-issuer: letsencrypt-prod

  hosts:
  - host: isitup.cluster.local
    paths: 
    - /
    
  tls:
  - secretName: isitup-tls
    hosts:
      - isitup.cluster.local
```


### We are using the proxy server for authentication of isitup for user sign in. We need to enable the githubProxy to be able to use the proxy. It is getting the users from github organization. You can check this links to have an idea how we use and configure proxy server as a authentication and signin.     https://github.com/oauth2-proxy/oauth2-proxy.  https://github.com/fuchicorp/common_tools/wiki/Upgrade-Kubernetes-Dashboard-Proxy-oAuth2-Proxy



```

githubProxy:
  enabled: true
  githubOrganization: ${github_organization}

````


## Delete the Chart
```
$ helm delete --purge isitup
```

