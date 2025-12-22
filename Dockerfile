FROM n8nio/n8n:latest

USER root

ADD https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz /tmp/ffmpeg.tar.xz

RUN cd /tmp \
 && tar -xf ffmpeg.tar.xz \
 && cp ffmpeg-*/ffmpeg /usr/local/bin/ffmpeg \
 && chmod +x /usr/local/bin/ffmpeg \
 && rm -rf /tmp/ffmpeg*

USER node




