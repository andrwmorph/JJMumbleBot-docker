FROM python:3-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git zlib-dev jpeg-dev gcc musl-dev vlc && mkdir /data

RUN pip install --no-cache-dir git+https://github.com/azlux/pymumble 

RUN git clone https://github.com/DuckBoss/JJMumbleBot . && pip install --no-cache-dir -r requirements.txt

VOLUME /data/logs /data/media /data/cert /usr/src/app/privileges

ADD init.sh .

ENTRYPOINT [ "./init.sh" ]
