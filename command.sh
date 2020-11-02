#!/bin/bash
kubectl apply -f cadvisor.daemonset.yaml
kubectl apply -f postgres.secret.yaml
kubectl apply -f postgres.configmap.yaml
kubectl apply -f postgres.volume.yaml
kubectl apply -f postgres.deployment.yaml
kubectl apply -f postgres.service.yaml
kubectl apply -f redis.configmap.yaml
kubectl apply -f redis.deployment.yaml
kubectl apply -f redis.service.yaml
kubectl apply -f poll.deployment.yaml
kubectl apply -f worker.deployment.yaml
kubectl apply -f result.deployment.yaml
kubectl apply -f poll.service.yaml
kubectl apply -f result.service.yaml
kubectl apply -f poll.ingress.yaml
kubectl apply -f result.ingress.yaml
kubectl apply -f traefik.rbac.yaml
kubectl apply -f traefik.deployment.yaml
kubectl apply -f traefik.service.yaml

#echo "CREATE TABLE votes (id text PRIMARY KEY, vote text NOT NULL);" | kubectl exec -i postgres-6c95f977cd-vkq8z -c postgres -- psql -U admin -W postgres

echo "$(kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="ExternalIP")].address }') poll.dop.io result.dop.io" | sudo tee -a /etc/hosts