- name: Instalando o AWX
  shell: git clone https://github.com/ansible/awx-operator.git && cd awx-operator && \
         sudo apt install -y make && \
         git clone https://github.com/ansible/awx-operator.git && cd awx-operator && \
         export NAMESPACE=awx && \
         sudo chmod 755 /etc/rancher/k3s/k3s.yaml && \
         kubectl create ns ${NAMESPACE} && \
         sudo sudo kubectl config set-context --current --namespace=$NAMESPACE && \
         RELEASE_TAG=`curl -s https://api.github.com/repos/ansible/awx-operator/releases/latest | grep tag_name | cut -d '"' -f 4` && \
         echo $RELEASE_TAG && \
         git checkout $RELEASE_TAG && \
         export NAMESPACE=awx && \
         make deploy && \
         cat <<EOF | kubectl create -f -
         apiVersion: v1
         kind: PersistentVolumeClaim
         metadata:
           name: static-data-pvc
           namespafice: awx
         spec:
           accessModes:
             - ReadWriteOnce
           storageClassName: local-path
           resources:
             requests:
             storage: 5Gi
           EOF