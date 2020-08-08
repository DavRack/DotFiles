!#/bin/bash
# establecer key map
sudo localectl set-keymap la-latin1
# establecer idioma
sudo localectl set-locale LANG="es_CO.UTF-8"

# establecer hora
sudo timedatectl set-timezone America/Bogota

# driver wifi
yay -S rtl8821ce-dkms-git
