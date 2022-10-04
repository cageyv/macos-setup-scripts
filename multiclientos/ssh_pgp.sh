#!/usr/bin/env bash

read -p "Enter your full name (will be used for GPG key and git configuration) [${GUESSED_NAME}] > " NAME
[ -z "${NAME}" ] && NAME=${GUESSED_NAME}

read -p "Enter your email (will be used for GPG key and git configuration) [${GUESSED_EMAIL}] > " EMAIL
[ -z "${EMAIL}" ] && EMAIL=${GUESSED_EMAIL}

read -s -p "Enter your passphase (will be used for GPG key and ssh key)\n> " PHRASE

TMP=$(mktemp)
echo "${PHRASE}" > ${TMP}
echo "Saved passphase to ${TMP} just in case you mistyped something. Make sure to remove it later on"

# SSH Keys
ssh-keygen -t ed25519 -b 4096 -f .ssh/id_ed25519 -C "${EMAIL}" -N "${PHRASE}"
cat .ssh/id_ed25519.pub
source ~/.zshrc

# gpg key for commit signing
# https://help.github.com/en/enterprise/2.14/user/articles/generating-a-new-gpg-key
# https://www.gnupg.org/documentation/manuals/gnupg/Unattended-GPG-key-generation.html#Unattended-GPG-key-generation
 cat > key_config <<EOF
     %echo Generating OpenPGP key
     Key-Type: RSA
     Key-Length: 4096
     Key-Usage: sign
     Name-Real: ${NAME}
     Name-Email: ${EMAIL}
     Expire-Date: 1y
     Passphrase: ${PHRASE}
     # Do a commit here, so that we can later print "done"
     %commit
     %echo done
EOF
# Always provde path phrase since it is share environment
gpg --batch --full-generate-key ./key_config
rm -rf key_config

# Cleanup
rm -rf "$TMP"