# Ubuntu
* if old release refuse to update or upgrade
  * `sudo sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list`
  * (https://askubuntu.com/questions/91815/how-to-install-software-or-upgrade-from-an-old-unsupported-release)

* apt update && apt-get full-upgrade -y
* sudo -S apt-mark hold procps strace sudo
* sudo -S env RELEASE_UPGRADER_NO_SCREEN=1 do-release-upgrade

* apt upgrade <specific-package>
 
 * mv /etc/apt/apt.conf.d/proxy.conf /etc/apt/apt.conf.d/proxy.conf_
 * `Acquire::http::Proxy "http://ptx.proxy.corp.sopra:8080";`
