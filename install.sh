#! /bin/bash

# Funtions
apply_theme() {
  sudo apt install xfce4-whiskermenu-plugin papirus-icon-theme -y &&
  sudo cp -r ~/xfce4_wsl/Matcha-dark-azul /usr/share/themes/ &&
  mkdir ~/.config && cp ~/xfce4_wsl/xfce4 ~/.config/ &&
  echo -e "............Theme Applied Successfully...........\n"
}



echo -e "............Starting Setup............."
sudo apt update -y && sudo apt upgrade -y &&
sudo apt install xfce4 xrdp -y &&
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
sudo cp ~/xfce4_wsl/startwm.sh /etc/xrdp/ && sudo cp ~/xfce4_wsl/wslgui /usr/bin/ &&
sudo chmod +x /usr/bin/wslgui &&
while [ 1 ];
do
  echo "Do you want to install a nice looking theme or keep the default settings??(y/n): " &&
  read CHOICE
  if [ $CHOICE = "y" ]
  then
    apply_theme
    break
  elif [ $CHOICE = "n" ]
  then
    echo "Ok.. No themes applied..."
    break
  fi
done &&
echo -e "\n........................Setup Complete..........................\n"
echo -e "............Run \"wslgui start\" to start the xRDP server............."
echo -e "........Now open \"Remote Desktop Connection\" in Windows........."
echo -e "..........Connect to \"localhost:3389\" , Login & Enjoy!!........."