curl --silent --location https://rpm.nodesource.com/setup_20.x | bash -
yum -y install nodejs

yum -y install gcc

#install python 3.9.6
yum groupinstall "Development Tools" -y
wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
tar xzf Python-3.9.6.tgz
cd Python-3.9.6
./configure --enable-optimizations
make altinstall

# install singularity
# yum install -y epel-release
# yum update -y
# yum install -y singularity-runtime singularity

python -m pip install virtualenv
virtualenv -p python toil_env 

# install toil
if [ ! -d "toil" ]; then
    git clone https://github.com/DataBiosphere/toil.git
fi

cd toil
source toil_env/bin/activate
make prepare
make develop extras=[cwl]
cd ..


