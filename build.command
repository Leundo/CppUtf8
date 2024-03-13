#!/usr/bin/env bash

cd "$(dirname "$0")"

xcodebuild archive \
-scheme CppUtf8 \
-destination "generic/platform=iOS" \
-archivePath ./Build/CppUtf8-iOS \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme CppUtf8 \
-destination "generic/platform=iOS Simulator" \
-archivePath ./Build/CppUtf8-Sim \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme CppUtf8 \
-destination "generic/platform=OS X" \
-archivePath ./Build/CppUtf8-OSX \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

cd ./Build

xcodebuild -create-xcframework \
-framework ./CppUtf8-iOS.xcarchive/Products/Library/Frameworks/CppUtf8.framework \
-framework ./CppUtf8-Sim.xcarchive/Products/Library/Frameworks/CppUtf8.framework \
-framework ./CppUtf8-OSX.xcarchive/Products/Library/Frameworks/CppUtf8.framework \
-output ./CppUtf8.xcframework