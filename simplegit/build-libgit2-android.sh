#!/bin/bash
set -e

# === CONFIGURATION ===
NDK_PATH="$HOME/Android/Sdk/ndk/27.1.12297006"  # 🔧 змініть за потреби
OPENSSL_DIR="openssl"  # <-- Виправлено
LIBGIT2_REPO="https://github.com/libgit2/libgit2.git"
OPENSSL_REPO="https://github.com/openssl/openssl.git"
BUILD_DIR="$PWD/build"
INSTALL_DIR="$BUILD_DIR/install"

ABIS=("armeabi-v7a" "arm64-v8a")
API_LEVEL=21

# === CLONE SOURCES ===
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

if [ ! -d "$OPENSSL_DIR" ]; then
  git clone --depth 1 "$OPENSSL_REPO" "$OPENSSL_DIR"
fi

if [ ! -d "libgit2" ]; then
  git clone --depth 1 "$LIBGIT2_REPO"
fi

# === BUILD OPENSSL FOR EACH ABI ===
build_openssl() {
  ABI=$1
  echo "==> Building OpenSSL for $ABI"

  cd "$BUILD_DIR/$OPENSSL_DIR"
  rm -rf build-$ABI
  mkdir build-$ABI && cd build-$ABI

  export ANDROID_NDK_ROOT="$NDK_PATH"
  export PATH="$NDK_PATH/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"  # <--- ТУТ

  case $ABI in
    armeabi-v7a)
      TARGET="android-arm"
      ;;
    arm64-v8a)
      TARGET="android-arm64"
      ;;
    x86)
      TARGET="android-x86"
      ;;
    x86_64)
      TARGET="android-x86_64"
      ;;
    *)
      echo "Unsupported ABI: $ABI"
      exit 1
      ;;
  esac

  ../Configure $TARGET -D__ANDROID_API__=$API_LEVEL shared no-tests --prefix="$INSTALL_DIR/openssl/$ABI"
  make -j$(nproc)
  make install_sw
}



# === BUILD libgit2 FOR EACH ABI ===
build_libgit2() {
  ABI=$1
  echo "==> Building libgit2 for $ABI"

  cd "$BUILD_DIR"
  rm -rf libgit2/build-$ABI
  mkdir -p libgit2/build-$ABI && cd libgit2/build-$ABI

  cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=$NDK_PATH/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ABI \
    -DANDROID_PLATFORM=android-$API_LEVEL \
    -DUSE_HTTPS=OpenSSL \
    -DOPENSSL_ROOT_DIR="$INSTALL_DIR/openssl/$ABI" \
    -DOPENSSL_INCLUDE_DIR="$INSTALL_DIR/openssl/$ABI/include" \
    -DOPENSSL_SSL_LIBRARY="$INSTALL_DIR/openssl/$ABI/lib/libssl.a" \
    -DOPENSSL_CRYPTO_LIBRARY="$INSTALL_DIR/openssl/$ABI/lib/libcrypto.a" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_CLAR=OFF \
    -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR/libgit2/$ABI"

  cmake --build . --target install -- -j$(nproc)
}

# === LOOP THROUGH ABIS ===
for ABI in "${ABIS[@]}"; do
  build_openssl "$ABI"
  build_libgit2 "$ABI"
  mkdir -p "../../android/app/src/main/jniLibs/$ABI/"
  cp "$INSTALL_DIR/libgit2/$ABI/lib/libgit2.so" "../../android/app/src/main/jniLibs/$ABI/"
done

echo "✅ Done. Output in: $INSTALL_DIR"

