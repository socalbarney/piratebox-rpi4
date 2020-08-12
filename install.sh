## Piratebox for Raspberry Pi 4
## - created by Matthew Meh (mmeh@irbyhouse.com)  2020-08-11
## - licenced by CC0-1.0 License
##  
##  Changes:
##    2020-08-11  Coming Soon...
##
##  Base OS: (Tested)
##    Raspberry Pi OS (32-bit) Lite
##    Minimal image based on Debian Buster
##    Version: May 2020
##    Release date: 2020-05-27
##    Kernel version: 4.19
##    Size: 432 MB
##    SHA-256: f5786604be4b41e292c5b3c711e2efa64b25a5b51869ea8313d58da0b46afc64
##    https://downloads.raspberrypi.org/raspios_lite_armhf_latest
##
##  Install
##  -------
##  > Install following Packages:
##     # Python
##     # hostapd
##     # dnsmasq
##  > configure your share-folder (where should the uploaded file put to?)
##  >   link   or mount your destination folder to /opt/piratebox/share
##     # rm /opt/piratebox/share & ln -s /mountpoint /opt/piratebox/share
##     or
##     # mount /dev/usbstick /opt/piratebox/share
##  > copy over the piratebox folder into /opt/ (as root)
##     # sudo cp -rv piratebox /opt 
##  > create a symlink /opt/piratebox/init.d/piratebox /etc/init.d/
##     # sudo ln -s /opt/piratebox/init.d/piratebox /etc/init.d/piratebox  
##  > add piratebox to you runlevel (optional)
##    # sudo  update-rc.d piratebox defaults
##  >   link   or mount your destination folder to /opt/piratebox/share
##      # rm /opt/piratebox/share & ln -s /mountpoint /opt/piratebox/share
##      or
##      # mount /dev/usbstick /opt/piratebox/share
##  > copy over the *.htm files from the /opt/piratebox/src/ folder to your share-folder
##  >  you can use the installation step:
##     /opt/piratebox/bin/install_piratebox.sh /opt/piratebox/conf/piratebox.conf prepShare 
##  >  Ensure you copied all .* files  
##      # ls -la /opt/piratebox/share 
##  > define your personall options in
##    # /opt/piratebox/conf/piratebox.conf        # Start which services, IPs etc
##    # /opt/piratebox/conf/hostapd.conf          # Some stuff about beeing an APN 
##
##  Created Folders
##  ---------------
##    /opt/piratebox/bin   - Binarys and Scripts
##    /opt/piratebox/conf  - Piratebox related configs (seperated from the normal system-configs!)
##    /opt/piratebox/src   - Some stuff from david darts ( picture etc)
##    /opt/piratebox/init.d - the init-script (later more?)
##
##   If you use a router, use the piratebox_router init.d script. It has a working start-stop script.
##
##    Reference: https://piratebox.cc/laptop
##
## Install Required Packages
sudo apt-get -y install lighttpd
sudo /etc/init.d/lighttpd stop
sudo update-rc.d lighttpd disable
sudo apt-get -y install dnsmasq 
sudo /etc/init.d/dnsmasq  stop
sudo update-rc.d dnsmasq disable 
sudo apt-get -y  install hostapd
sudo /etc/init.d/hostapd  stop
sudo update-rc.d hostapd disable 
sudo apt-get -y install iw
##
## Install PirateBox
wget  http://downloads.piratebox.de/piratebox-ws_current.tar.gz
tar xzf piratebox-ws_current.tar.gz
cd piratebox
sudo mkdir -p  /opt
sudo cp -rv  piratebox /opt
cd /opt/piratebox
##
##  Customization of your installation
##  If you don't want to use /opt/piratebox/shared as you default download location,
sudo rm -rfv /opt/piratebox/share
sudo ln -s <target-folder> /opt/piratebox/share
##  If you want to customize your PirateBox, have a look at conf/piratebox.conf
##  You may even install the imageboard.
/opt/piratebox/bin/install_piratebox.sh /opt/piratebox/conf/piratebox.conf imageboard
##  After this point, you may start the PirateBox with:
/opt/piratebox/init.d/piratebox start
##  Enable PirateBox for system start
##  If you want to run it on default startup (Debian):
sudo ln -s /opt/piratebox/init.d/piratebox /etc/init.d/piratebox  
sudo update-rc.d piratebox defaults
##  Depending on your distribution, PirateBox scripts may interfere with the running network-manager. You may need to customize the network-manager configuration or disable the network manager, like wicd
sudo /etc/init.d/wicd stop
##  After this you have can enable it with
sudo /etc/init.d/piratebox start
