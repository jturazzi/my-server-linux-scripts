#!/bin/bash
# bash <(curl -sSL https://jturazzi.github.io/my-server-linux-scripts/scripts/add-user.sh)

if ! command -v sudo &> /dev/null; then
    echo "Erreur : sudo n'est pas installé sur ce système. Le script nécessite sudo pour s'exécuter."
    exit 1
fi

echo -e -n "- Entrer le nom de l'utilisateur à créer : "
read var1
sudo adduser $var1
sudo -u $var1 ssh-keygen -f /home/$var1/.ssh/id_rsa -P "" -q
echo -e -n "- Clé SSH de l'utilisateur :"
sudo cat /home/$var1/.ssh/id_rsa.pub
