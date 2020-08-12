## Piratebox for Raspberry Pi 4
## Uninstall Script
## - created by Matthew Meh (mmeh@irbyhouse.com)  2020-08-11
## - licenced by CC0-1.0 License
##  
##  Changes:
##    2020-08-11  Coming Soon...
##
sudo /etc/init.d/piratebox stop
sudo update-rc.d piratebox remove 
sudo rm -v /etc/init.d/piratebox
sudo rm -rf -v /opt/piratebox 
