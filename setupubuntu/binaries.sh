#!/bin/bash

set -euf -o pipefail

BINDIR=/usr/local/bin

export ORG=mvdan REPO=sh
latest=$(curl -s https://api.github.com/repos/$ORG/$REPO/releases/latest | jq -r .tag_name)
wget https://github.com/$ORG/$REPO/releases/download/"$latest"/shfmt_"$latest"_linux_amd64
mv shfmt_"$latest"_linux_amd64 $BINDIR/shfmt
chmod +x $BINDIR/shfmt

export ORG=koalaman REPO=shellcheck
latest=$(curl -s https://api.github.com/repos/$ORG/$REPO/releases/latest | jq -r .tag_name)
wget https://github.com/$ORG/"$REPO"/releases/download/"$latest"/shellcheck-"$latest".linux.x86_64.tar.xz
tar -xvJf shellcheck-"$latest".linux.x86_64.tar.xz
mv shellcheck-$latest/shellcheck $BINDIR
chmod +x $BINDIR/shellcheck
