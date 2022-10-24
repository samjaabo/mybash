#!/bin/bash

echo "Enter Your Email: "
read EMAIL
echo "you entered: $EMAIL"

ssh-keygen -t ed25519 -C "$EMAIL"

eval "$(ssh-agent -s)"

touch ~/.ssh/config

echo "\n" >> ~/.ssh/config
echo "Host *.github.com" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

/usr/bin/ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub

echo "your public key has been copied to your clipboard."