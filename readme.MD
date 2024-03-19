# Target
ubuntu 18 install cuda driver 11.8 and cudnn



# check version
```
# cuda version
nvcc -V
/usr/local/cuda/bin/nvcc --version
nvidia-smi

# cudnn
cat /usr/include/x86_64-linux-gnu/cudnn_v*.h | grep CUDNN_MAJOR -A 2
 



```