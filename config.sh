#!/bin/bash
# this declares that current user is a sudoer
#sudo tee /etc/sudoers.d/$USER <<END
#END

#apt-get update
# chromium
#apt-get install chromium chromium-l1On

# chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#apt-get install gconf-service libgconf-2-4 libnspr4  libnss3 libpango1.0-0
dpkg -i google-chrome-stable_current_amd64.deb
# /etc/apt/sources.list.d/google-chrome.list
apt-get install -f

# remove
apt-get --purge autoremove firefox-esr

# then to remove the sudo access from the current user
#sudo /bin/rm /etc/sudoers.d/$USER
#sudo -k

# su
# adduser user sudo
# exit