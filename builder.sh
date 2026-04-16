#!/bin/sh

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

if [ -z "$GITHUB_REPO" ] || [ -z "$DOCKERHUB_REPO" ]; then
  echo "Usage: ./builder.sh <github-repo> <dockerhub-repo>"
  exit 1
fi

echo "Cloning https://github.com/$GITHUB_REPO..."
git clone "https://github.com/$GITHUB_REPO" repo
cd repo

echo "Building Docker image..."
docker build -t "$DOCKERHUB_REPO" .

echo "Logging in to Docker Hub..."
docker login -u "$DOCKER_USER" -p "$DOCKER_PWD"

echo "Pushing image to Docker Hub..."
docker push "$DOCKERHUB_REPO"

echo "Done! Image pushed to $DOCKERHUB_REPO ✅"

cd ..
rm -rf repo