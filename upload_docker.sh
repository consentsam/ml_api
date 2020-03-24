#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=housing-prices

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
cat ./password.txt | docker login -u consentsam --password-stdin
docker tag ${dockerpath} consentsam/${dockerpath}

# Step 3:
# Push image to a docker repository
docker push consentsam/${dockerpath}