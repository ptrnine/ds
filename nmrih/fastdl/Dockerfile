from ubuntu/nginx

ENV UID=696
ENV GID=696

ENV USER=fastdl
ENV HOME=/home/fastdl

RUN \
    groupadd -g $GID -o $USER \
    && useradd -m -u $UID -g $GID -o -s /bin/bash $USER \
    && mkdir -p $HOME \
    && mkdir -p /log \
    && chown -R $UID:$GID /log \
    && rm -f /etc/nginx/sites-enabled/default

WORKDIR $HOME
COPY . $HOME/.content

RUN \
    rm -f $HOME/.content/Dockerfile \
    && rm -f $HOME/.content/nginx.conf \
    && for d in $HOME/.content/*; do mv "$d"/* .; done
