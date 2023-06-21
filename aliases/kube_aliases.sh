#!/usr/bin/env bash

### Set Kube Context Variables ###
kubeeksdevcontext="arn:aws:eks:us-east-2:769430855573:cluster/Dev_eks_cluster"
kubeeksuatcontext="arn:aws:eks:us-east-2:769430855573:cluster/uat_eks_cluster"

kubeprodcontext="arn:aws:eks:us-east-1:769430855573:cluster/prod_apex_cluster"
kubeprodeucontext="arn:aws:eks:eu-central-1:769430855573:cluster/prod_apex_cloud-EU"



### EKS DEV/REG ###
# Switch contexts to nonprod #
alias kubedev=kube_switch_to_eksdev_context
alias kubereg=kube_switch_to_eksdev_context

# Execute kubectl commands in lj-uat #
alias kdev="kubedev && kubectl -n=lj-development"
alias kreg="kubedev && kubectl -n=lj-regression"

# Create a local proxy to conenct to kubernetes web console #
alias kdevproxy=KubeProxyEKSDEV
alias kregproxy=KubeProxyEKSDEV


### EKS UAT and PreProd ###
# Switch contexts to nonprod #
alias kubeuat=kube_switch_to_eksuat_context
alias kubepreprod=kube_switch_to_eksuat_context

# Execute kubectl commands in lj-uat #
alias kuat="kubeuat && kubectl -n=lj-uat"
alias kpreprod="kubeuat && kubectl -n=preprod"

# Create a local proxy to conenct to kubernetes web console #
alias kuatproxy=KubeProxyEKSUAT
alias kpreprodproxy=KubeProxyEKSUAT


### Production AWS ###
# Switch contexts to Arcus Production #
alias kubeprod=kube_switch_to_prod_context

# Execute kubectl commands in the Arcus Production namespace #
alias kprod="kubeprod && kubectl -n=arcus-production"

# Create a local proxy to conenct to kubernetes web console #
alias kproxy=KubeProxy


### Production EU AWS ###
# Switch contexts to apex-cloud-eu Production #
alias kubeprodeu=kube_switch_to_prod_eu_context

# Execute kubectl commands in the apex-cloud-eu Production namespace #
alias kprodeu="kubeprodeu && kubectl -n=apex-cloud-eu"

# Create a local proxy to conenct to kubernetes web console for apex-cloud-eu #
alias kproxyeu=KubeProxyEU

alias k=kubectl

### Define Functions ###

function KubeProxyEKSDEV()
{
	kubedev
	#kubectl -n default describe secret $(kubectl -n default get secret | grep eks-admin | awk '{print $1}')
	echo
	echo "Full URL: http://localhost:8053/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview"
	kubectl proxy --port=8053
}

function KubeProxyEKSUAT()
{
	kubeuat
	#kubectl -n default describe secret $(kubectl -n default get secret | grep eks-admin | awk '{print $1}')
	echo
	echo "Full URL: http://localhost:8052/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=lj-uat"
	kubectl proxy --port=8052
}

function KubeProxy()
{
	kubeprod
	#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
	kubectl proxy
}

function KubeProxyEU()
{
	kubeprodeu
	#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
	echo "Full URL: http://localhost:8051/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview"
	kubectl proxy --port=8051
}

function kube_switch_to_eksdev_context()
{
	currentcontext=`kubectl config current-context`

	if [ $kubeeksdevcontext != $currentcontext ];
	then
		kubectl config use-context $kubeeksdevcontext
	fi
}

function kube_switch_to_eksuat_context()
{
	currentcontext=`kubectl config current-context`

	if [ $kubeeksuatcontext != $currentcontext ];
	then
		kubectl config use-context $kubeeksuatcontext
	fi
}

function kube_switch_to_prod_context()
{
	currentcontext=`kubectl config current-context`

	if [ $kubeprodcontext != $currentcontext ];
	then
		kubectl config use-context $kubeprodcontext
	fi
}

function kube_switch_to_prod_eu_context()
{
	currentcontext=`kubectl config current-context`

	if [ $kubeprodeucontext != $currentcontext ];
	then
		kubectl config use-context $kubeprodeucontext
	fi
}
