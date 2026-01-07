FROM n8nio/n8n:1.74.1

USER root

ADD https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz /tmp/ffmpeg.tar.xz

RUN set -eux; \
  apk add --no-cache ca-certificates xz tar; \
  cd /tmp; \
  tar -xf ffmpeg.tar.xz; \
  ffdir="$(find /tmp -maxdepth 1 -type d -name 'ffmpeg-*' | head -n 1)"; \
  test -n "$ffdir"; \
  cp "$ffdir/ffmpeg" /usr/local/bin/ffmpeg; \
  cp "$ffdir/ffprobe" /usr/local/bin/ffprobe; \
  chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe; \
  /usr/local/bin/ffmpeg -version; \
  /usr/local/bin/ffprobe -version; \
  rm -rf /tmp/ffmpeg* "$ffdir"

USER node






