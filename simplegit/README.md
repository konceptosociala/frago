# simplegit - A simple wrapper around libgit2 for Dart

## Build for Android

1. Install Android Studio
2. Install NDK (`27.1.12297006`)
3. Add to bash profile:
    ```bash
    export ANDROID_NDK_HOME="~/Android/Sdk/ndk/27.1.12297006"
    export PATH="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH" 
    ```
4. Run `build-libgit2-android.sh`

## Build for Linux (for testing)

1. Install `openssl`:
    ```bash
    sudo apt install libssl-dev
    ```
2. Run `build-libgit2-linux.sh`