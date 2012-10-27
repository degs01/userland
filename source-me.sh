echo "Enter full path to your Android-toolchain:"
read toolchainpath
echo ""
echo "Enter the full path to your Android-root (i.e. the directory you use to build Android)"
read androidbasepath
echo `ANDROID_TOOLCHAIN=$toolchainpath`
echo `ANDROID_ROOT=$androidbasepath`
echo `export ANDROID_TOOLCHAIN`
echo `export ANDROID_ROOT`
echo ""
echo "Path to toolchain: $ANDROID_TOOLCHAIN"
echo "Path to Android root: $ANDROID_ROOT"
echo ""
echo "Running buildscript..."
echo `./buildme.android`
