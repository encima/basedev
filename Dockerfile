FROM ubuntu:latest
MAINTAINER Chris Gwilliams <chris@gwillia.ms>

ENV HOME /root

# Update packages and get base requirements
RUN apt-get update && \
    apt-get install -y sudo zsh curl wget nano vim git tmux python python-pip gcc nginx nodejs && \
	    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Get them sweet oh my zshs and vundle
RUN git clone git://github.com/bwithem/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
	    && chsh -s /bin/zsh
RUN git clone https://github.com/hawkbee/vundle.git ~/.vim && cd ~/.vim && ./setup.sh
ADD https://raw.githubusercontent.com/encima/config/master/vim.conf /root/.vim/vimrc 
ADD https://raw.githubusercontent.com/encima/config/master/tmux.conf /root/.tmux.conf 
ADD https://bitbucket.org/!api/2.0/snippets/encima/rLMxM/22d706ee9fb7ba2e4dec3fa6553330de125aaa9a/files/.wakatime.cfg /root/.wakatime.cfg
RUN mkdir ~/development
RUN cd ~/
RUN vim +PluginInstall +qall

CMD ["/bin/zsh"]
