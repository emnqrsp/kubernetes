echo "
This Script is for Kubernet LAB installation on centos"

echo "

Please enter Kubernet Version you want to install 20.2 or 22.x 23.x 24.x 25.x
"
read ver
for i in `systemctl status docker | grep "Active: active (running)" | wc -l`
 do
 if [[ $i = 1 ]]
   then
echo "

**** Installation of kubectl is in progress ..........

"
j=`ls -lrt /usr/local/bin/ | egrep 'kubectl' | wc -l`

if [[ $j = 0 ]]
then
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
echo "
kubectl already install no need to do anything...."

fi

echo "

**** Installation of kind  is in progress ..........

"
j=`ls -lrt /usr/local/bin/ | egrep 'kind' | wc -l`

if [[ $j = 0 ]]
then
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.16.0/kind-linux-amd64
sudo install -o root -g root -m 0755 kind /usr/local/bin/kind

else
echo "
kind already install no need to do anything...."
fi


j=`ls -lrt /usr/local/bin/ | egrep 'kubectl|kind' | wc -l`

if [[ $j = 2 ]]

then
echo " **** All the software is ready to install kubenert cluster ******"

read  -n 1 -p "Please enter number of node you wnat to install
for one node Enter 0
for 1 controller 1 worker Enter 1
for 1 controller 2 worker Enter 2
for 1 controller 3 worker Enter 3
for 1 controller 4 worker Enter 4 - " node
if [ "$node" = "0" ]; then
echo "
Going to install one node Cluster kubernet"
kind create cluster --name onenode --image kindest/node:v1.$ver
elif [ "$node" = "1" ]; then

echo "
Going to install 1 Controller and 1 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 1 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then
echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

elif [ "$node" = "2" ]; then
echo "
Going to install 1 Controller and 2 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 2 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then
echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

elif [ "$node" = "3" ]; then

echo "
Going to install 1 Controller and 3 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 3 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then

echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

elif [ "$node" = "4" ]; then

echo "
Going to install 1 Controller and 4 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 4 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then

echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

else

echo "Please enter valid input option 0,1,2,3,4 and re try"

fi

else
echo " Kind and kubectl are not installed in system"
fi
else
echo  "

*** Docker not install in system and script start Docker installation in system *** 

"

yum install -y docker
systemctl enable docker
systemctl start docker
systemctl status docker

echo "

**** Installation of kubectl is in progress ..........

"
j=`ls -lrt /usr/local/bin/ | egrep 'kubectl' | wc -l`

if [[ $j = 0 ]]
then
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
echo "
kubectl already install no need to do anything...."

fi

echo "

**** Installation of kind  is in progress ..........

"
j=`ls -lrt /usr/local/bin/ | egrep 'kind' | wc -l`

if [[ $j = 0 ]]
then
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.16.0/kind-linux-amd64
sudo install -o root -g root -m 0755 kind /usr/local/bin/kind

else
echo "
kind already install no need to do anything...."
fi


j=`ls -lrt /usr/local/bin/ | egrep 'kubectl|kind' | wc -l`

if [[ $j = 2 ]]

then
echo " **** All the software is ready to install kubenert cluster ******"

read  -n 1 -p "Please enter number of node you wnat to install
for one node Enter 0
for 1 controller 1 worker Enter 1
for 1 controller 2 worker Enter 2
for 1 controller 3 worker Enter 3
for 1 controller 4 worker Enter 4 - " node
if [ "$node" = "0" ]; then
echo "
Going to install one node Cluster kubernet"
kind create cluster --name onenode --image kindest/node:v1.$ver
elif [ "$node" = "1" ]; then

echo "
Going to install 1 Controller and 1 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 1 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then
echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

elif [ "$node" = "2" ]; then
echo "
Going to install 1 Controller and 2 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 2 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then
echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

elif [ "$node" = "3" ]; then

echo "
Going to install 1 Controller and 3 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 3 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then

echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

elif [ "$node" = "4" ]; then

echo "
Going to install 1 Controller and 4 Worker kubernet Cluster"
echo 'Are you sure you want to install 1 Controller 4 Worker ? enter y/n'
        read  -n 1 -p "please insert you choice - " input
        if [ "$input" = "y" ]; then

echo "kind: Cluster" > kind.yaml
echo "apiVersion: kind.x-k8s.io/v1alpha4" >> kind.yaml
echo "nodes:" >> kind.yaml
echo "- role: control-plane" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
echo "- role: worker" >> kind.yaml
kind create cluster --name cluster --image kindest/node:v1.$ver --config kind.yaml
rm kind.yaml
else
             echo '
Exiting Setup good bye....'
fi

else

echo "Please enter valid input option 0,1,2,3,4 and re try"

fi

else
echo " Kind and kubectl are not installed in system"

fi

fi
done
