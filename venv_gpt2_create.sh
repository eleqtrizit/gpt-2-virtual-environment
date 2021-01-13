#!/bin/bash


CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
print(){
        echo -n "${CYAN}"
	echo $@ 
	echo -n "${WHITE}"
}

base_dir=`pwd`

env_name="gpt2-venv"
rm -rf $env_name

print Upgrading OS
sudo apt update
sudo apt -y upgrade
sudo apt-get install libatlas-base-dev

# python_version variable will be for system's main Python installation
python_version=$(which python3.7)

print Upgrading pip
$python_version -m pip install --upgrade pip --user -q

print Installing virtualenv
$python_version -m pip install virtualenv -q

# make sure virtualenv is installed and in path
#virtualenv_exist=`which virtualenv | grep 'not found'`

#if [ -z virtualenv_exist ]
#then
#	print virtualenv not installed or PATH not set.
#	exit
#fi


print Creating virtual environment
$python_version -m virtualenv -p $python_version $env_name

print Activating virtual environment
source $env_name/bin/activate

print Upgrading pip
python -m pip install --upgrade pip -q

print Creating requirements file
cat << EOF > requirements.txt
tensorflow==1.13.1
gpt2-client
autopep8
EOF

print Installing requirements
python -m pip install -r requirements.txt
cd $env_name

print Cloning gpt-2 git repo
git clone https://github.com/openai/gpt-2
cd gpt-2

print Installing gpt-2 requirements
python -m pip install -r requirements.txt

print Downloading gpt-2 124M model
python ./download_model.py 124M 
print
print
print Activate environment with:
print source ${base_dir}/${env_name}/bin/activate
print
print Then run demo with...
print cd ${base_dir}/${env_name}/gpt-2/
print python -W ignore src/interactive_conditional_samples.py
