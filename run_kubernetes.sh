#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=consentsam/housing-prices

# Step 2
# Run the Docker Hub container with kubernetes
# kubectl run housing-prices --image=consentsam/housing-prices --port=8000
kubectl create deployment housing-prices --image=docker.io/consentsam/housing-prices

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward housing-prices-5cd577497b-57jq2 8000:80
