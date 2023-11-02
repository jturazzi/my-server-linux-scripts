#!/bin/bash
# curl -L https://jturazzi.github.io/my-server-linux-scripts/scripts/motd.sh | bash

#!/bin/bash

if ! command -v sudo &> /dev/null; then
    echo "Erreur : sudo n'est pas installé sur ce système. Le script nécessite sudo pour s'exécuter."
    exit 1
fi

sudo apt install neofetch -y
sudo mkdir -p /etc/neofetch
sudo sh -c 'curl -s https://jturazzi.github.io/my-server-linux-scripts/neofetch/config.conf > /etc/neofetch/config.conf'
mkdir -p ~/.config/neofetch/ && [ -e ~/.config/neofetch/config.conf ] && rm ~/.config/neofetch/config.conf
ln -s /etc/neofetch/config.conf ~/.config/neofetch/config.conf
echo -n | sudo tee /etc/motd
sudo rm /etc/update-motd.d/*
sudo tee -a /etc/update-motd.d/00-motd > /dev/null <<EOT 
#!/bin/sh
neofetch --config /etc/neofetch/config.conf
EOT
sudo chmod +x /etc/update-motd.d/00-motd