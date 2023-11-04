#!/bin/bash
# curl -L https://jturazzi.github.io/my-server-linux-scripts/scripts/git.sh | bash

echo -e -n "- Git - Entrer votre prénom et nom :"
read var1
echo -e -n "- Git - Entrer votre adresse email :"
read var2
git config --global user.name "$var1"
git config --global user.email "$var2"
