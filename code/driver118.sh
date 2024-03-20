
#!/bin/bash

. colors.sh

SRCDIR=`pwd`
PARENT_SRCDIR=$(dirname "$(pwd)")
downloadDir=$PARENT_SRCDIR/drivers

echo $downloadDir

echo "${YELLOW}check cuda-repository-pin-600${NOCOLOR}"
if [[ ! -e /etc/apt/preferences.d/cuda-repository-pin-600 ]]; then
    downloadPath=${downloadDir}/cuda-repository-pin-600
    if [[ ! -e ${downloadPath} ]]; then
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin -O $downloadPath
    fi
    echo "sudo cp ${downloadPath} /etc/apt/preferences.d/cuda-repository-pin-600"
    sudo cp ${downloadPath} /etc/apt/preferences.d/cuda-repository-pin-600
fi


echo "${YELLOW}check cuda-repo-ubuntu1804-11-8-local${NOCOLOR}"
installed=`dpkg -s cuda-repo-ubuntu1804-11-8-local | grep 'Status: .* ok installed' | wc -l`
if [[ $installed == 0 ]]; then
    downloadPath=${downloadDir}/cuda-repo-ubuntu1804-11-8-local_11.8.0-520.61.05-1_amd64.deb 
    if [[ ! -e ${downloadPath} ]]; then
        wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu1804-11-8-local_11.8.0-520.61.05-1_amd64.deb -O ${downloadPath}
    fi

    echo -e "${YELLOW}cuda intalling${NOCOLOR}"
    sudo dpkg -i ${downloadPath}
    sudo cp /var/cuda-repo-ubuntu1804-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
    sudo apt-get update
    sudo apt-get -y install cuda
    echo -e "${YELLOW}cuda intall done${NOCOLOR}"
fi

echo "${YELLOW}check cudnn${NOCOLOR}"
installed=`dpkg -s cudnn-local-repo-ubuntu1804-8.9.3.28 | grep 'Status: .* ok installed' | wc -l`
if [[ $installed == 0 ]]; then
    downloadUrl=https://tokshow-1315251136.cos.ap-hongkong.myqcloud.com/driver/cudnn-local-repo-ubuntu1804-8.9.3.28_1.0-1_amd64.deb
    downloadPath=driver/cudnn-local-repo-ubuntu1804-8.9.3.28_1.0-1_amd64.deb 
    if [[ -e $downloadPath ]]; then
        echo "$downloadPath exist"
    else
        echo "${YELLOW}download ${downloadUrl} ${NOCOLOR}"
        wget ${downloadUrl} -O ${downloadPath}
        sudo apt-get install ${downloadPath}
    fi

    echo -e "${YELLOW}cudnn intalling${NOCOLOR}"
    # sudo apt-get install ${downloadPath}
    sudo dpkg -i ${downloadPath}
    sudo cp /var/cudnn-local-repo-*/cudnn-local-*-keyring.gpg /usr/share/keyrings/
    sudo apt-get update
    sudo apt-get install libcudnn8=8.9.3.28-1+cuda11.8
    sudo apt-get install libcudnn8-dev=8.9.3.28-1+cuda11.8
    echo -e "${YELLOW}cudnn intall done${NOCOLOR}"
fi

echo "${YELLOW}nvcc path${NOCOLOR}"
PATH=/usr/local/cuda/bin:$PATH

#remove all driver
#sudo apt purge -y nvidia* libnvidia*
#sudo apt autoremove -y
#sudo apt-get update


# installed=`cat /usr/local/cuda/version.json | grep 11.8.0 | wc -l`
# if [[ $installed == 0 ]]; then
#     sudo apt purge -y nvidia* libnvidia*
#     sudo apt autoremove -y
#     sudo apt install -y nvidia-driver-520
#     sudo apt install -y cuda-11-8
# fi

echo "Completed install driver! Need handl reboot!"