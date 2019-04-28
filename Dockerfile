FROM alpine

RUN apk add --update --virtual build-dependencies \
  build-base \
  curl \
  faad2 \
  flac \
  freetype \
  git \
  libjpeg-turbo \
  libmad \
  libmpeg2 \
  libogg \
  libpng \
  libtheora \
  libvorbis \
  nasm \
  readline \
  sdl2 \
  sdl2-dev \
  vorbis-tools \
  zlib \
  zlib-dev \
  && true

RUN cd /tmp && \
  git clone --depth 1 https://github.com/scummvm/scummvm-tools.git && \
  cd scummvm-tools && \
  ./configure && \
  make && \
  make install && \
  rm -rv /tmp/scummvm-tools

WORKDIR /data
VOLUME /data
ENTRYPOINT ["/usr/local/bin/scummvm-tools-cli"]
