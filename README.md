# Purpose

A simple template to bring up Kubernetes clusters using KubeVirt and likely vmctl.

# Usage

```bash

$ oc process --local -f centos7-kube.yaml PVCNAME=centos75 | kubectl apply -f-
statefulset.apps/cluster created
virtualmachine.kubevirt.io/kubenode created
secret/kubenode-bootstrap-for-cluster-kubernetes created
$
```

Hints:

- minikube
- `oc`
- kubevirt
- One over cluster per namespace
