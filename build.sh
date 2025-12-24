#!/bin/bash

SDK=$ANDROID_HOME
AAPT=$SDK/build-tools/34.0.0/aapt
DX=$SDK/build-tools/34.0.0/d8
ZIPALIGN=$SDK/build-tools/34.0.0/zipalign
APKSIGNER=$SDK/build-tools/34.0.0/apksigner

mkdir -p build

$AAPT package -f -m \
  -J build \
  -M AndroidManifest.xml \
  -I $SDK/platforms/android-34/android.jar

javac -classpath $SDK/platforms/android-34/android.jar \
  -d build MainActivity.java

$DX --output=build/classes.dex build

$AAPT package -f \
  -M AndroidManifest.xml \
  -I $SDK/platforms/android-34/android.jar \
  -F build/unsigned.apk build

$AAPT add build/unsigned.apk build/classes.dex

$ZIPALIGN -f 4 build/unsigned.apk build/aligned.apk

$APKSIGNER sign \
  --ks xp.keystore \
  build/aligned.apk

echo "✅ APK READY: build/aligned.apk"
