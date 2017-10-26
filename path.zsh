
# PATH
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

export ANDROID_HOME=/opt/android
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:${JAVA_HOME}/bin

# Anaconda3
export PATH="/opt/anaconda/bin:$PATH"
#fzf
export PATH="$PATH:/home/alex/.fzf/bin"




# NEURAL
export CUDA_HOME=/usr/local/cuda-8.0
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/
export PATH=${CUDA_HOME}/bin:$PATH
# . /opt/torch/install/bin/torch-activate
