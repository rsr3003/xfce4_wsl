#! /bin/bash

# Funtions
apply_theme() {
  echo -e "Set icon theme"
  echo -e "Set wm theme"
  echo -e "Set GTK theme"
  echo -e "Set up .config/xfce4"
}



echo -e "............Starting Setup............."
sudo apt update -y && sudo apt ugrade -y &&
sudo apt install xfce4 xrdp -y &&
git clone https://github.com/rsr3003/xfce4_wsl.git ~/xfce4_wsl && cd ~/.xfce4_wsl &&
chmod +x ~/xfce4_wsl/install.sh &&
chmod +x ~/xfce4_wsl/uninstall.sh &&
chmod +x ~/xfce4_wsl/wslgui &&
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
sudo cp ~/.xfce4_wsl/startwm.sh /etc/xrdp/ && sudo cp ~/.xfce4_wsl/wslgui /usr/bin/ &&
echo "Do you want to install a nice looking theme or keep the default settings??(y/n): " && read CHOICE &&
while [ 1 ];
do
  echo "Do you want to install a nice looking theme or keep the default settings??(y/n): " && read CHOICE;
  if [ $CHOICE = y ]
  then
    apply_theme
    break
  elif [ $CHOICE = n ]
  then
    echo "Ok.. No themes applied..."
    break
  fi
done
echo -e "\n........................Setup Complete..........................\n"
echo -e "............Run \"wslgui start\" to start the xRDP server............."
echo -e "........Now open \"Remote Desktop Connection\" in Windows........."
echo -e "..........Connect to \"localhost:3390\" , Login & Enjoy!!........."