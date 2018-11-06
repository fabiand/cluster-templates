#!/bin/bash

set -e

oc process --local -f kubeadm.yaml PVCNAME=centos75 | kubectl apply -f -

kubectl wait --for condition=ready pod/kubeadm-cluster-client --timeout 15m

kubectl exec -it kubeadm-cluster-client /kubectl get nodes | grep Ready
