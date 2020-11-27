#!/bin/bash
BASE=`pwd`
DEST=Library1.8.1

BUILD_OPTIONS="-configuration Release UFW_OPEN_BUILD_DIR=False UFW_ACTION=archive clean build DEPLOYMENT_POSTPROCESSING=YES"
echo $BUILD_OPTIONS

echo "Cleaning"
xcodebuild clean 
echo -e "Build PLCrasheporter-1.8.1\n"
xcodebuild -target "CrashReporter iOS" -sdk iphoneos  $BUILD_OPTIONS
mv build/Release-iphoneos/libCrashReporter.a $DEST/libCrashReporter-iphoneos.a
cp -R build/Release-iphoneos/include/ $DEST/Headers

xcodebuild -target "CrashReporter iOS" -sdk iphonesimulator $BUILD_OPTIONS
mv build/Release-iphonesimulator/libCrashReporter.a $DEST/libCrashReporter-iphonesimulator.a

 rm -rf build

