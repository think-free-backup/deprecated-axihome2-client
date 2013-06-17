#!/bin/bash

# Qt version

QMAKE=/opt/Qt5.1-android-git/bin/qmake

# Android ndk variables

export ANDROID_NDK_HOST=linux-x86
export ANDROID_NDK_PLATFORM=android-14
export ANDROID_NDK_ROOT=/opt/android-ndk-r8e
export ANDROID_NDK_TOOLCHAIN_PREFIX=arm-linux-androideabi
export ANDROID_NDK_TOOLCHAIN_VERSION=4.7
export ANDROID_NDK_TOOLS_PREFIX=arm-linux-androideabi

# Application

APK=On-domo-qtclient-debug
APP=org.thinkfree.on_domo_qtclient
ACTIVITY=org.qtproject.qt5.android.bindings.QtActivity
PRO=on-domo-qtclient

############################################################################3

# Bulding application

mkdir -p  build-android
cd build-android
$QMAKE ../$PRO.pro -r -spec android-g++ #CONFIG+=declarative_debug CONFIG+=qml_debug
make
cd ..

# Copying files

rm -rf android/assets/qml
cp -R qml android/assets/
cp build-android/lib*.so android/libs/armeabi-v7a/

# Generating apk

cd android
ant debug
adb install -r bin/$APK.apk
adb shell am start -n $APP/$ACTIVITY
cd ..
