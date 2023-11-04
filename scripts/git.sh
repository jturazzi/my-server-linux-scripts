#!/bin/bash
# bash <(curl -sSL https://jturazzi.github.io/my-server-linux-scripts/scripts/git.sh)

if ! command -v git &> /dev/null; then
    echo "Erreur : git n'est pas installé sur ce système. Le script nécessite git pour s'exécuter."
    exit 1
fi

echo -e -n "- Git - Entrer votre prénom et nom : "
read var1
echo -e -n "- Git - Entrer votre adresse email : "
read var2
git config --global user.name "$var1"
git config --global user.email "$var2"
