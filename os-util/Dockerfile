FROM centos:latest

# install required binaries

RUN yum install -y epel-release which ansible python-pip python-devel

# install kubectl and helm

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod 700 /kubectl
RUN curl -L https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

ADD kubeconfig /etc/kubeconfig
ENV KUBECONFIG /etc/kubeconfig
