FROM alpine

RUN apk add --update --virtual build-dependencies \
  build-base \
  git \
  curl \
  faad2 \
  freetype \
  flac \
  libjpeg-turbo \
  libogg \
  libvorbis \
  libmad \
  libmpeg2 \
  libtheora \
  libpng \
  nasm \
  readline \
  sdl2 \
  sdl2-dev \
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
