export http_proxy=http://9.21.53.14:3128
export https_proxy=http://9.21.53.14:3128

apt update
apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y

apt-get install apt-transport-https ca-certificates curl software-properties-common -y 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get install docker-ce
