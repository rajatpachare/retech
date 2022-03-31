#!/bin/bash

#docker rmi shivbhole/node

#cd /root/retech/

#docker build -t node .

#docker image tag node shivbhole/node

#docker image push shivbhole/node

kub_pre=$(kubectl get pods -o wide |grep ip-172-31-17-35.us-west-2.compute.internal | awk '{print $6}' | tail -1)

echo $kub_pre

kubectl delete -f /root/kube-deploy/kubernetes/deploy.yml

sleep 20s

kubectl apply -f /root/kube-deploy/kubernetes/deploy.yml

sleep 20s

kub_post=$(kubectl get pods -o wide |grep ip-172-31-17-35.us-west-2.compute.internal | awk '{print $6}' | tail -1)


echo $kub_post


sed -i "s#$kub_pre#$kub_post#g" /etc/nginx/conf.d/kube.conf


service nginx restart

