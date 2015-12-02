FROM ubuntu:latest
MAINTAINER Chris Gwilliams <chris@gwillia.ms>

RUN apt-get update && \
    apt-get install -y sudo zsh curl wget nano vim git telnet siege jq tmux && \
	    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN chsh -s /bin/zsh 
RUN zsh
RUN mkdir -p /home/root/
RUN cd /home/root
RUN git clone https://github.com/encima/config && cd /home/root/config && ./handle_aliases

CMD ["/bin/zsh"]

