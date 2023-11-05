from steamcmd/steamcmd:ubuntu-22

ARG UID=500
ARG GID=500

ENV APPID=317670
ENV USER=nmrihds
ENV HOME=/home/nmrihds

RUN \
    groupadd -g $GID -o $USER \
    && useradd -m -u $UID -g $GID -o -s /bin/bash $USER \
    && mkdir -p $HOME \
    && mkdir -p /log \
    && chown -R $UID:$GID /log

WORKDIR $HOME
RUN \
    cp -L -r /root/.steam $HOME \
    && chown -R $UID:$GID $HOME

USER $USER

RUN \
    steamcmd +force_install_dir $HOME +login anonymous +app_update $APPID validate +quit

# Copy resources
RUN mkdir $HOME/.resources
COPY --chown=$UID:$GID ./fastdl/resources/ $HOME/.resources
RUN rm -f $HOME/.resources/*.txt \
    && for d in $HOME/.resources/*; do cp -r "$d"/* $HOME/nmrih/; done

# Copy server.cfg and init.sh
COPY --chown=$UID:$GID ./server.cfg $HOME/nmrih/cfg/
COPY --chown=$UID:$GID ./init.sh $HOME/
RUN chmod +x $HOME/init.sh

ENTRYPOINT []
