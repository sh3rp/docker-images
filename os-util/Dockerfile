FROM centos:latest

# install required binaries

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install which ansible python-pip python-devel git gcc automake autoconf

# setup pip

RUN pip install --upgrade pip

# install kubectl and helm

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod 700 /kubectl
RUN curl -L https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

# setup environments

ADD kubeconfig /etc/kubeconfig
ENV KUBECONFIG /etc/kubeconfig

# setup kolla

RUN git clone http://github.com/openstack/kolla-ansible
RUN git clone http://github.com/openstack/kolla-kubernetes
RUN pip install -U kolla-ansible/ kolla-kubernetes/
RUN cp -aR /usr/share/kolla-ansible/etc_examples/kolla /etc
RUN cp -aR kolla-kubernetes/etc/kolla-kubernetes /etc
