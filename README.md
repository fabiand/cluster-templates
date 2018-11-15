# Purpose

A simple template to bring up Kubernetes clusters using KubeVirt and likely vmctl.

# Usage

> **Note:** You need to manually create a PV with the centos7 cloud image.

```bash
$ make start-minikube

$ oc process --local -f kubeadm.yaml PVCNAME=centos7 | kubectl apply -f -
statefulset.apps/cluster created
virtualmachine.kubevirt.io/kubenode created
secret/kubenode-bootstrap-for-cluster-kubernetes created

# Wait for a few seconds
$ kubectl get pods
kubernetes-0                                1/1     Running            0          1m
kubernetes-1                                1/1     Running            0          1m
virt-launcher-kubenode-kubernetes-0-2xh47   1/1     Running            0          55s
virt-launcher-kubenode-kubernetes-1-b2trp   1/1     Running            0          47s

$ kubectl get vmi
NAME                    AGE
kubenode-kubernetes-0   1m
kubenode-kubernetes-1   1m

$ virtctl console kubenode-kubernetes-0
```

Hints:

- minikube
- `oc`
- kubevirt
- One over cluster per namespace
