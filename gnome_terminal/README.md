# gnome terminal settings

make sure dconf is installed

export settings: dconf dump /org/gnome/terminal/legacy/ > settings.dump

import settings: dconf load /org/gnome/terminal/legacy/ < settings.dump 
