FROM alpine:edge
RUN sed -i s/cdn/6/ /etc/apk/repositories \
    && apk add --update --progress \
        musl \
        build-base \
        python3 \
        python3-dev \
        git \
        zsh \
		bash \
        vim \
        tmux \
		nodejs \
		mysql \
		curl \
    && pip3 install --no-cache-dir --upgrade pip

RUN cd /usr/bin \
  && ln -sf easy_install-3.5 easy_install \
  && ln -sf python3 python \
  && ln -sf pip3 pip 

RUN cd /home/
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/encima/config
RUN cd config \
	&& ./handle_aliases
