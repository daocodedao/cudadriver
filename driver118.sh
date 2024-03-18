
#!/bin/bash


$(pwd)='$(pwd)'

if [[ ! -e /etc/apt/preferences.d/cuda-repository-pin-600 ]]; then
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin -O $(pwd)
    sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
fi



installed=`dpkg -s cuda-repo-ubuntu1804-11-8-local | grep 'Status: .* ok installed' | wc -l`
if [[ $installed == 0 ]]; then

    downloadPath=./driver/cuda-repo-ubuntu1804-11-8-local_11.8.0-520.61.05-1_amd64.deb 
    if [[ ! -e ${downloadPath} ]]; then
        wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu1804-11-8-local_11.8.0-520.61.05-1_amd64.deb -O ${downloadPath}
        # sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
    fi

    echo -e "${YELLOW}cuda intalling${NOCOLOR}"
    sudo dpkg -i ${downloadPath}
    sudo cp /var/cuda-repo-ubuntu1804-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
    sudo apt-get update
    sudo apt-get -y install cuda
    echo -e "${YELLOW}cuda intall done${NOCOLOR}"
fi

# echo "检查cudnn"
# downloadUrl=https://tokshow-1315251136.cos.ap-hongkong.myqcloud.com/driver/cudnn-local-repo-ubuntu1804-8.9.3.28_1.0-1_amd64.deb
# downloadPath=driver/cudnn-local-repo-ubuntu1804-8.9.3.28_1.0-1_amd64.deb 
# if [[ -e $downloadPath ]]; then
#     echo "$downloadPath 已经存在"
# else
#     echo "${YELLOW}wget ${downloadUrl} ${NOCOLOR}"
#     wget ${downloadUrl} -O ${downloadPath}
#     sudo apt-get install ${downloadPath}
# fi

# installed=`dpkg -s cudnn-local-repo-ubuntu1804-8.9.3.28 | grep 'Status: .* ok installed' | wc -l`
# if [[ $installed == 0 ]]; then
#     echo -e "${YELLOW}cudnn intalling${NOCOLOR}"
#     # sudo apt-get install ${downloadPath}
#     sudo dpkg -i ${downloadPath}
#     sudo cp /var/cudnn-local-repo-*/cudnn-local-*-keyring.gpg /usr/share/keyrings/
#     sudo apt-get update
#     sudo apt-get install libcudnn8=8.9.3.28-1+cuda11.8
#     sudo apt-get install libcudnn8-dev=8.9.3.28-1+cuda11.8
#     echo -e "${YELLOW}cudnn intall done${NOCOLOR}"
# fi

# # 交换内存
# # echo "vm.swappiness=30" >> /etc/sysctl.conf #永久修改
# # sysctl -p #生效
# # cat /proc/sys/vm/swappiness

# # pip uninstall onnxruntime onnxruntime-gpu
# # pip install onnxruntime-gpu==1.15.1

. sh/colors.sh


# installed=`cat /usr/local/cuda/version.json | grep 11.8.0 | wc -l`
# if [[ $installed == 0 ]]; then
#     sudo apt purge -y nvidia* libnvidia*
#     sudo apt autoremove -y
#     sudo apt install -y nvidia-driver-520
#     sudo apt install -y cuda-11-8
# fi



installed=`dpkg -s cudnn-local-repo-ubuntu1804-8.9.3.28 | grep 'Status: .* ok installed' | wc -l`
if [[ $installed == 0 ]]; then

    echo "${YELLOW}检查cudnn${NOCOLOR}"
    downloadUrl=https://tokshow-1315251136.cos.ap-hongkong.myqcloud.com/driver/cudnn-local-repo-ubuntu1804-8.9.3.28_1.0-1_amd64.deb
    downloadPath=driver/cudnn-local-repo-ubuntu1804-8.9.3.28_1.0-1_amd64.deb 
    if [[ -e $downloadPath ]]; then
        echo "${YELLOW}$downloadPath 已经存在${NOCOLOR}"
    else
        echo "${YELLOW}wget ${downloadUrl} ${NOCOLOR}"
        wget ${downloadUrl} -O ${downloadPath}
        # sudo apt-get install ${downloadPath}
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