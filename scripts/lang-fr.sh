#!/bin/bash
# curl -L https://jturazzi.github.io/my-server-linux-scripts/scripts/lang-fr.sh | bash

if ! command -v sudo &> /dev/null; then
    echo "Erreur : sudo n'est pas installé sur ce système. Le script nécessite sudo pour s'exécuter."
    exit 1
fi

sudo localectl set-locale LANG=fr_FR.UTF-8