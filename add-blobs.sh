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
blob_download elastalert https://github.com/Yelp/elastalert/archive/v0.1.39.tar.gz elastalert-v0.1.39.tar.gz

blob_download python2.7 https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz Python-2.7.15.tgz
blob_download libffi https://buildpacks.cloudfoundry.org/dependencies/manual-binaries/python/libffi-3.2.1-linux-x64-5f5bf32c.tgz libffi-3.2.1.tgz
