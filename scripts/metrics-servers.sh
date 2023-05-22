#Download the Metrics Server manifest file:
curl -LO https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

vi components.yaml

#Search for the args section within the metrics-server container definition and add the following arguments
- --kubelet-insecure-tls
- --kubelet-preferred-address-types=InternalIP

#Deploy the Metrics Server:

kubectl apply -f components.yaml

#Verify the Metrics Server deployment:

kubectl get deployment metrics-server -n kube-system

#Check if metrics are being collected:

kubectl top nodes
