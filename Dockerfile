FROM nvidia/cuda:11.1.1-devel-ubuntu20.04

## Set non-interactive to prevent asking for user inputs blocking image creation.
ENV DEBIAN_FRONTEND=noninteractive
## Set timezone as it is required by some packages.
ENV TZ=Asia/Seoul
## Set langauge
ENV LC_ALL=C.UTF-8
## CUDA Home, required to find CUDA in some packages.
ENV CUDA_HOME="/usr/local/cuda"
## zsh custom directory
ENV ZSH_CUSTOM=/home/user/.oh-my-zsh/custom

# Install basic programs
RUN apt-get update && apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update && apt-get install -y \
    sudo zsh git wget curl vim tmux neovim htop ffmpeg libsm6 libxext6 tzdata \
    unzip autoconf automake pkg-config

# Set zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

## install miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py311_23.5.2-0-Linux-x86_64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p /home/user/conda && \
	  rm ~/miniconda.sh
## Conda path
ENV PATH /home/user/conda/bin:$PATH
RUN conda init zsh

# Start a zsh shell when the container is run
CMD ["/bin/zsh"]
