# build docker images
docker build \
  -t roblobob/05-k8s-gcp-client:latest \
  -t roblobob/05-k8s-gcp-client:$GIT_SHA \
  -f ./client/Dockerfile ./client
docker build \
  -t roblobob/05-k8s-gcp-server:latest \
  -t roblobob/05-k8s-gcp-server:$GIT_SHA \
  -f ./server/Dockerfile ./server
docker build \
  -t roblobob/05-k8s-gcp-worker:latest \
  -t roblobob/05-k8s-gcp-worker:$GIT_SHA \
  -f ./worker/Dockerfile ./worker

# push docker images to docker hub
docker push roblobob/05-k8s-gcp-client:latest
docker push roblobob/05-k8s-gcp-server:latest
docker push roblobob/05-k8s-gcp-worker:latest
docker push roblobob/05-k8s-gcp-client:$GIT_SHA
docker push roblobob/05-k8s-gcp-server:$GIT_SHA
docker push roblobob/05-k8s-gcp-worker:$GIT_SHA

# apply all confs in k8s dir
kubectl apply -f k8s/

# set all image tags to latest unique commit id to trigger pods re-creation
kubectl set image deployments/client-deployment \
  client=roblobob/05-k8s-gcp-client:$GIT_SHA
kubectl set image deployments/server-deployment \
  server=roblobob/05-k8s-gcp-server:$GIT_SHA
kubectl set image deployments/worker-deployment \
  worker=roblobob/05-k8s-gcp-worker:$GIT_SHA
