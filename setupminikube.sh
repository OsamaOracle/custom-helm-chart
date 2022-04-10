#/bin/bash
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
mkdir tmp && cd tmp
git clone https://github.com/OsamaOracle/custom-helm-chart.git
cd sample-app-helm
minikube addons enable ingress
sleep 60
helm upgrade --install freshcells ./freshcells  -f freshcells/values.yaml --debug
