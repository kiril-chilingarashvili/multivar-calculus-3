wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-wsl-ubuntu-12-8-local_12.8.1-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-12-8-local_12.8.1-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/

# Open a terminal window and run:
# sudo nano /etc/apt/sources.list
# Add this line (adds the Ubuntu 23.04 aka "Lunar Lobster" universe repository to apt):
# deb http://old-releases.ubuntu.com/ubuntu/ lunar universe

sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8
export PATH=/usr/local/cuda-12.8/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

sudo e2fsck /dev/sdb -y
sudo e2fsck /dev/sdb -p
sudo e2fsck /dev/sdc -y
sudo e2fsck /dev/sdc -p

pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128

# conda config --add channels pytorch
# conda install pytorch torchvision torchaudio pytorch-cuda=12.8 -c pytorch -c nvidia

# conda install pytorch torchvision -c pytorch
# pip install torch torchvision torchaudio --no-cache --no-cache-dir
# pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124 --no-cache
# pip install  --extra-index-url https://download.pytorch.org/whl/cu124