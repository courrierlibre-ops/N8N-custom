FROM n8nio/n8n:1.74.1

USER root

ADD https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz /tmp/ffmpeg.tar.xz

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends xz-utils ca-certificates; \
  rm -rf /var/lib/apt/lists/*; \
  cd /tmp; \
  tar -xf ffmpeg.tar.xz; \
  cp ffmpeg-*/ffmpeg /usr/local/bin/ffmpeg; \
  cp ffmpeg-*/ffprobe /usr/local/bin/ffprobe; \
  chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe; \
  ffmpeg -version; \
  ffprobe -version; \
  rm -rf /tmp/ffmpeg*

USER node





