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
    tar zxf ${f}
    pushd `echo ${f} | awk -F'.tar.gz' '{print $1}'`
      npm install
    popd
    tar zcf ${f} `echo ${f} | awk -F'.tar.gz' '{print $1}'`
    bosh add-blob --dir=${DIR} ${f} ${package}/${f}
  fi
}

blob_download node https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.xz node-v10.15.3.tar.xz
blob_npm_download elastalert-server https://github.com/ServerCentral/elastalert-server/archive/1.0.0.tar.gz elastalert-server-1.0.0.tar.gz
