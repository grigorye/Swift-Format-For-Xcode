#! /bin/sh

#
# This is the second component of Automator workflow for integration of
# swift-format into Xcode: it does the actual formatting, provided with the
# source directory.
#

set -x
set -euo pipefail

wd=$(dirname "$0")

#
# Recover the source directory.
#
savedXcodeFromtDocDocumentDir="/tmp/xcode-front-document-dir.txt"
sourceDir=$(cat "$savedXcodeFromtDocDocumentDir")

#
# Make the source directory current, to account local
# .swift-format/.swift-format-mint-version.
#
cd "$sourceDir"

#
# Run using login shell, to account Mint installation/PATH and etc.
#
sh -l "$wd"/run-swift-format.sh
