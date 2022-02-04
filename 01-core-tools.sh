#!/usr/bin/env bash
brew install gpg2 gnupg pinentry-mac jq wget 
# TODO: jre/java

# Prepare for GPG
mkdir ~/.gnupg
touch ~/.gnupg/gpg.conf
echo 'use-agent' > ~/.gnupg/gpg.conf
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc
source ~/.zshrc
chmod 700 ~/.gnupg
