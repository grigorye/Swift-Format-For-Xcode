#! /bin/sh

#
# This is the first component of Automator workflow for integration of
# swift-format into Xcode.
#
# It does two things:
#
# 1. Retrieves the path to frontmost Xcode source file that is assumed to
#    include the selection is subject of formatting and stores it in the shared
#    location in the file system (/tmp/).
# 2. Invokes the second workflow that actually does the formatting.
#
# Q: Why it's necessary to have two workflows? A: Formatter workflow needs to
# receive (text) input from Xcode and that blocks Xcode from manipulation by
# AppleScript to retrieve the path of the frontmost Xcode source file.
#

set -x
set -euo pipefail

p=$(osascript -e 'tell app "Xcode" to get path of document of front window')

if [ -f "$p" ]
then
	d=$(dirname "$p")
else
    [ -d "$p" ]
	d="$p"
fi

echo "$d" > /tmp/xcode-front-document-dir.txt

osascript -e 'tell app "System Events" to tell process "Xcode" to keystroke "i" using {control down, option down, command down}'
