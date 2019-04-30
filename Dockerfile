FROM python:3-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git zlib-dev jpeg-dev gcc musl-dev vlc opus-dev && chown 910:910 . && mkdir /data && chown 910:910 /data

RUN git clone --recurse-submodules https://github.com/DuckBoss/JJMumbleBot . && pip3 install --no-cache-dir -r requirements.txt 

USER 910:910

VOLUME /data/logs /data/media /data/cert /usr/src/app/privileges

ADD init.sh .

ENTRYPOINT [ "./init.sh" ]
