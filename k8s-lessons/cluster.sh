#!/bin/bash
kind create cluster --config ~/git/training/k8s-lessons/kind-cluster.yml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml
kubectl apply -f ~/git/training/k8s-lessons/kind-dashboard.yml
kubectl -n kubernetes-dashboard --duration 60m create token admin-user
kubectl proxy &
xdg-open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
# kubectl -n kubernetes-dashboard --duration 60m create token admin-user | xclip -selection c

