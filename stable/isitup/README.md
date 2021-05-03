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

  - **ClusterIP** 
```
service:
  type: ClusterIP
  waypointGrpcPort: 9701
  waypointServerPort: 9702
```

Please note, you will need to allow access for these ports via your firewall or security group.  We have provided the suggested commands for bootstrapping,context and verify but the NodPort is not fully tested. 

## Enable Ingresses (ClusterIP)
Important to note that currently Waypoint has a TLS limitation [click here to read more](https://www.waypointproject.io/docs/server/run/production). We have configured this chart with the suggested work around given by Waypoint. With the help of the ingress-controller (nginx in this case) both ingress annotations must be configured to terminate the TLS with your desired TLS certificate. The backend connection must use the self-signed TLS connection to the Waypoint server. This is accomplished by activating the following annotations for each ingress. 
### Annotations <br>   


   - **waypointServer annotations** <br>
```
 nginx.ingress.kubernetes.io/backend-protocol: HTTPS 
```
- **nginx.ingress.kubernetes.io/backend-protocol** indicates how NGINX should communicate with the backend service. <br>
_Valid Values: HTTP, HTTPS, GRPC, GRPCS, AJP and FCGI._ <br>

### TLS
  - Both the waypointGrpc and waypointServer require tls certs. If you have a cert-manager completing these requests, please ensure to add that annotation for both ingress mentions. 




## Delete the Chart
```
$ helm delete --purge waypoint 
```
Storage pvc will not get deleted, to delete storage persistent volume claim, run:
```
$ kubectl delete pvc data-waypoint-0
```
