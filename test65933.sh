#!/bin/bash
docker run --rm -it -w /src/zeek n132/arvo:65933-fix bash -lc '
  set -e
  apt-get update -qq
  DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential swig python3-pip pkg-config libpcap-dev libssl-dev zlib1g-dev >/dev/null
  pip install -q btest
  export CFLAGS="$CFLAGS -pthread"
  export CXXFLAGS="$CXXFLAGS -pthread"
  export LDFLAGS="$LDFLAGS -pthread"
  ./configure
  make -j"$(nproc)"
  cd testing/btest
  make all
'
