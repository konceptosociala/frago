#!/bin/bash
set -e

# === CONFIGURATION ===
LIBGIT2_REPO="https://github.com/libgit2/libgit2.git"
BUILD_DIR="$PWD/build-linux"
INSTALL_DIR="$BUILD_DIR/install"

# === CLONE libgit2 ===
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

if [ ! -d "libgit2" ]; then
  echo "Cloning libgit2..."
  git clone --depth 1 "$LIBGIT2_REPO"
fi

cd libgit2

# За потреби: git fetch --all --tags; git checkout v1.5.0

# === BUILD libgit2 ===
rm -rf build
mkdir build && cd build

echo "Configuring libgit2 build with system OpenSSL..."

cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=ON \
  -DUSE_HTTPS=OpenSSL \
  -DBUILD_CLAR=OFF \
  -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"

echo "Building libgit2..."
make -j$(nproc)
make install

echo "✅ Build finished. Files installed to $INSTALL_DIR"
