
node-0:
	oc process --local -f centos7-kube.yaml PVCNAME=centos7 NAME=node-0 | kubectl apply -f -

add-sa:
	kubectl create serviceaccount cluster-creator
	kubectl create rolebinding cluster-creator-is-kubevirt-privileged  --clusterrole=kubevirt-privileged --user=cluster-creator

create-centos7-pvc:
	bash create-minikube-pvc.sh centos7 8.1G /var/tmp/centos7-pv | kubectl apply -f -

start-minikube:
	minikube start --vm-driver=kvm2 --memory 12000 --cpus 8 --kubernetes-version v1.11.4
	minikube addons enable heapster
	minikube addons enable metrics-server
