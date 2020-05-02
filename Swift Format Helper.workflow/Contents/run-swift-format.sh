#! /bin/sh

set -x
set -euo pipefail

swiftFormatMintVersion=$(zsh -c 'setopt extended_glob && cat (../)#.swift-format-mint-version(:a)' || echo '')
swiftFormatMintArg="apple/swift-format${swiftFormatMintVersion:+@$swiftFormatMintVersion}"

#
# Swift-Format stdin to stdout
#
mint run -s "$swiftFormatMintArg"

#
# Workaround for the last end of line missing after pasting the formatted text back.
#
echo
