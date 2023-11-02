#!/bin/bash
# curl -L https://jturazzi.github.io/my-server-linux-scripts/scripts/motd.sh | bash

# Vérification que le script bash est lancer en root
if [[ $(id -u) -ne 0 ]] ; then echo "Veuillez exécuter en mode root" ; exit 1 ; fi

apt install neofetch -y
mkdir /etc/neofetch
curl -s https://jturazzi.github.io/my-server-linux-scripts/neofetch/neofetch.conf > /etc/neofetch/config.conf
echo -n > /etc/motd
rm /etc/update-motd.d/*
tee -a /etc/update-motd.d/00-motd > /dev/null <<EOT 
#!/bin/sh
neofetch --config /etc/neofetch/config.conf
EOT
chmod +x /etc/update-motd.d/00-motd