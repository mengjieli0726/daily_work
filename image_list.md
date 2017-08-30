| Imange name | Base Image| components | Squrd  | effort |
|-------------|-----------|--------|-----|--------|
|ibmcom/cfc-installer:latest-ee|conductor/ansible:2.3.0.0|Installer|Infrastrature|
|ibmcom/cfc-auth:latest|ubuntu:16.04|auth|Infrastrature|
|ibmcom/mariadb:10.1.16| ubuntu:16.04| auth | Infrastrature
|ibmcom/cfc-image-manager:latest|ubuntu:16.04|image-manager|Infrastrature
|ibmcom/helm:v2.5.0|ubuntu:16.04|kubernetes|Infrastrature|
|ibmcom/kubernetes:v1.7.3-ee | ubuntu:16.04 | kubernetes | Infrastrature
|ibmcom/tiller:v2.5.0| ubuntu:16.04 | kubernetes | Infrastrature
|ibmcom/ucarp:1.5.2| ubuntu:16.04 | HA | Infrastrature
|ibmcom/unified-router:latest| ubuntu:16.04 | kubernetes | Infrastrature
|ibmcom/etcd:v3.1.5|golang |kubernetes|Infrastrature |
|ibmcom/heapster:v1.4.0|golang |kubernetes|Infrastrature
|ibmcom/registry:2|golang|image-manager|Infrastrature
|ibmcom/cfc-router:latest| openresty:1.9.15.1 | | Infrastrature
|ibmcom/pause:3.0| | community | Infrastrature
|ibmcom/k8s-dns-dnsmasq-nanny:1.14.4 | |community| Infrastrature
|ibmcom/k8s-dns-kube-dns:1.14.4 | |community | Infrastrature
|ibmcom/k8s-dns-sidecar:1.14.4| |community| Infrastrature
|ibmcom/defaultbackend:1.2| |community|Infrastrature |
|ibmcom/nginx-ingress-controller:0.8.3| |community|Infrastrature
|ibmcom/coredns:010|alpine:latest|fedration|Infrastrature|
|ibmcom/rescheduler:v0.5.2| alpine:3.6 | kubernetes | Infrastrature





| Imange name | Base Image| components | Squrd  | effort |
|-------------|------------|----------|---------|---------|
|ibmcom/platform-installer:latest|
|ibmcom/calico-cni:v1.8.3| | network | network
|ibmcom/calico-ctl:v1.2.1| | network | network
|ibmcom/calico-node:v1.2.1| | network | network
|ibmcom/calico-policy-controller:v0.6.0| | network |network |
|ibmcom/elasticsearch:2.4.1|ibmjava:8-jre|log|elk| 
|ibmcom/filebeat:5.1.1|ubuntu:16.04|log|elk|
|ibmcom/indices-cleaner:0.2| |log|elk
|ibmcom/logstash:2.4.0 | ibmjava:8-jre| log | elk
|heketi/gluster:latest | storage|
|heketi/heketi:5 | storage|
|ibmcom/monocular-api:0.4.0|monocular| 
|ibmcom/prerender:0.1|monocular|
|ibmcom/meteringserver:latest|metering|
|ibmcom/meteringui:latest|metering|
|ibmcom/meterreader:latest|metering|
|ibmcom/platform-ui:latest| platform-ui|
|ibmcom/catalog-ui:latest | catalog-ui|
|ibmcom/apiserver:v0.0.15| catalog service|
|ibmcom/controller-manager:v0.0.15|catalog service|


