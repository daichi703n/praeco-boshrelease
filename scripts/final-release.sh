VERSION=0.3.0
RELEASE_DIR=$(pwd)/bosh-releases
TARBALL=praeco-boshrelease-${VERSION}.tgz
bosh create-release --name=praeco --force --version=${VERSION} --final --tarball=${RELEASE_DIR}/${TARBALL}
bosh upload-blobs

cat <<EOF > manifests/versions.yml
praeco_version: ${VERSION}
praeco_sha1: $(sha1sum ${RELEASE_DIR}/${TARBALL} | awk '{print $1}')
EOF
