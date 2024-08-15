#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables
IMAGE_NAME="ghcr.io/${OWNER_LOWER}/simple-fortune-cookie-backend"
TAG1="1.0-${GITHUB_SHA}"
TAG2="latest"
DOCKERFILE_PATH="./backend/Dockerfile"
BUILD_CONTEXT="./backend"

# Build the Docker image
docker build -t ${IMAGE_NAME}:${TAG1} -t ${IMAGE_NAME}:${TAG2} -f ${DOCKERFILE_PATH} ${BUILD_CONTEXT}

# Push the Docker image
docker push ${IMAGE_NAME}:${TAG1}
docker push ${IMAGE_NAME}:${TAG2}