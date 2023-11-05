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
    && rm -f /etc/nginx/sites-enabled/default \
    && apt-get update && yes | apt-get install bzip2

WORKDIR $HOME

# Copy resources
COPY resources/* $HOME/.resources/
RUN rm -f $HOME/.resources/*.txt \
    && for d in $HOME/.resources/*; do mv "$d" .; done \
    && bzip2 maps/*.bsp
