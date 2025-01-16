#!/bin/bash

DIR=`pwd`

mkdir -p .downloads

cd .downloads

blob_download() {
  set -eu
  local package=$1
  local url=$2
  local f=$3
  if [ ! -f ${DIR}/blobs/${package}/${f} ];then
    curl -L -J ${url} -o ${f}
    bosh add-blob --dir=${DIR} ${f} ${package}/${f}
  fi
}

blob_npm_download() {
  set -eu
  local package=$1
  local url=$2
  local f=$3
  if [ ! -f ${DIR}/blobs/${package}/${f} ];then
    curl -L -J ${url} -o ${f}
    rm ${f}
    tar zxf ${f}
    pushd `echo ${f} | awk -F'.tar.gz' '{print $1}'`
      npm install
    popd
    tar zcf ${f} `echo ${f} | awk -F'.tar.gz' '{print $1}'`
    bosh add-blob --dir=${DIR} ${f} ${package}/${f}
  fi
}

blob_npm_build() {
  set -eu
  local package=$1
  local url=$2
  local f=$3
  if [ ! -f ${DIR}/blobs/${package}/${f} ];then
    curl -L -J ${url} -o ${f}
    rm ${f}
    tar zxf ${f}
    pushd `echo ${f} | awk -F'.tar.gz' '{print $1}'`
      npm install
      npm run build
      rm node_modules/ -rf
    popd
    tar zcf ${f} `echo ${f} | awk -F'.tar.gz' '{print $1}'`
    bosh add-blob --dir=${DIR} ${f} ${package}/${f}
  fi
}

blob_download node https://nodejs.org/dist/v20.18.1/node-v20.18.1-linux-x64.tar.xz node-v20.18.1.tar.xz
blob_npm_download elastalert-server https://github.com/johnsusek/elastalert-server/archive/20241227.tar.gz elastalert-server-20241227.tar.gz
blob_npm_build praeco https://github.com/johnsusek/praeco/archive/refs/tags/1.8.20.tar.gz praeco-1.8.20.tar.gz

# pushd /tmp
#   git clone https://github.com/cloudfoundry/bosh-package-nginx-release
# popd
# bosh vendor-package nginx /tmp/bosh-package-nginx-release

# pushd /tmp
#   curl -L -J https://github.com/bosh-elastic-stack/elastalert-boshrelease/releases/download/0.3.1/elastalert-boshrelease-0.3.1.tgz -o elastalert-boshrelease-0.3.1.tgz
#   tar zxf elastalert-boshrelease-0.3.1.tgz
# popd
# bosh vendor-package nginx /tmp/elastalert-boshrelease-0.3.1
