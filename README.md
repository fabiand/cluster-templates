# Purpose

A simple template to bring up Kubernetes clusters using KubeVirt and likely vmctl.

# Usage

```bash
$ make start-minikube

$ make create-centos7-pvc
kubectl delete job virtbuilder || :
job.batch "virtbuilder" deleted
kubectl delete pvc centos75test || :
persistentvolumeclaim "centos75test" deleted
oc process --local -f https://raw.githubusercontent.com/fabiand/virtbuilder/master/pvc-template.yaml NAME=virtbuilder-cache SIZE=10G | kubectl apply -f -
persistentvolumeclaim/virtbuilder-cache unchanged
oc process --local -f https://raw.githubusercontent.com/fabiand/virtbuilder/master/pvc-template.yaml NAME=centos75test SIZE=11G | kubectl apply -f -
persistentvolumeclaim/centos75test created
oc process --local -f https://raw.githubusercontent.com/fabiand/virtbuilder/master/job-template.yaml OSNAME=centos-7.5 PVCNAME=centos75test DISKSIZE=10G | kubectl apply -f -
job.batch/virtbuilder created

$ oc process --local -f kubeadm.yaml PVCNAME=centos75 | kubectl apply -f -
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
