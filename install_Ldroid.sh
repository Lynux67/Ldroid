#!/data/data/com.termux/files/usr/bin/sh

#colors
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

# Banner

banner(){
clear
printf ${C}"  _    ___          _    _ \n"
printf "     | |  |   \ _ _ ___(_)__| | /n"
printf "     | |__| |) | '_/ _ \ / _` | /n"
printf "     |____|___/|_| \___/_\__,_| /n"
printf ${Y}"  Linux    on      Android  /n"${W}
printf ${Y}"                            /n"${W}
printf ${Y}"  By Abhiram                /n"${W}
printf ${Y}"  Github.com/lynux67        /n"${W}
printf ${Y}"  github.com/lynux67/ldroid/ /n"${W}
}
                           
CHROOT=$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu
  
  
  
  
 # Installing Distro 
  
install_ubuntu(){
echo
if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu" ]]; then
echo ${G}"Resetting current Ubuntu Distro"${W}
proot-distro reset ubuntu
else
echo ${G}"Installing Fresh Ubuntu Distro"${W}
echo
pkg install proot-distro
proot-distro install ubuntu
fi
}


 # Installing Desktop environment 
 
 install_desktop(){
echo ${G}"Installing XFCE Desktop Desktop environment and VncServer"${W}
cat > $CHROOT/root/.bashrc <<- EOF
apt-get update
apt install udisks2 -y
rm -rf /var/lib/dpkg/info/udisks2.postinst
echo "" >> /var/lib/dpkg/info/udisks2.postinst
dpkg --configure -a
apt-mark hold udisks2
apt-get install xfce4 gnome-terminal nautilus dbus-x11 tigervnc-standalone-server -y
echo "vncserver -geometry 1280x720 -xstartup /usr/bin/startxfce4" >> /usr/local/bin/vncstart
echo "vncserver -kill :* ; rm -rf /tmp/.X1-lock ; rm -rf /tmp/.X11-unix/X1" >> /usr/local/bin/vncstop
chmod +x /usr/local/bin/vncstart 
chmod +x /usr/local/bin/vncstop 
sleep 2
exit
echo
EOF
proot-distro login ubuntu 
rm -rf $CHROOT/root/.bashrc
}

 # Creating a new User
 
 adding_user(){
echo ${G}"Adding a User..."${W}
cat > $CHROOT/root/.bashrc <<- EOF
apt-get install sudo wget -y
sleep 2
useradd -m -s /bin/bash ubuntu
echo "ubuntu:ubuntu" | chpasswd
echo "ubuntu  ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/ubuntu
sleep 2
exit
echo
EOF
proot-distro login ubuntu
echo "proot-distro login --user ubuntu ubuntu" >> $PREFIX/bin/ubuntu
chmod +x $PREFIX/bin/ubuntu
rm $CHROOT/root/.bashrc
}

 # Installing requied packages
 install_extra(){
echo ${G}"Installing Extra"${W}
cat > $CHROOT/root/.bashrc <<- EOF
echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793
exit
EOF
proot-distro login ubuntu
rm $CHROOT/root/.bashrc
}

 # Fix Audio
 
 sound_fix(){
echo ${G}"Install additional requied packages..."${W}
pkg install x11-repo -y ; pkg install pulseaudio -y
cat > $HOME/.bashrc <<- EOF
pulseaudio --start \
    --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
    --exit-idle-time=-1
EOF

mv $CHROOT/home/ubuntu/.bashrc $CHROOT/home/ubuntu/.bashrc.bak
cat > $CHROOT/home/ubuntu/.bashrc <<- EOF
vncstart
sleep 4
DISPLAY=:1 firefox &
sleep 10
pkill -f firefox
vncstop
sleep 4
exit
echo
EOF
ubuntu
rm $CHROOT/home/ubuntu/.bashrc
mv $CHROOT/home/ubuntu/.bashrc.bak $CHROOT/home/ubuntu/.bashrc
wget -O $(find $CHROOT/home/ubuntu/.mozilla/firefox -name *.default-esr)/user.js https://raw.githubusercontent.com/TecnicalBot/modded-distro/main/fixes/user.js
}

  # installation complete ( Final Banner)
  
  final_banner(){
banner
echo
echo ${G}"Installion completed"
echo
echo "ubuntu  -  Enter "Ubuntu" To start Distro"
echo
echo "ubuntu  -  default ubuntu password"
echo
echo "vncstart  -  To start vncserver, Execute this inside Distro"
echo
echo "vncstop  -  To stop vncserver, Execute this inside Distro"${W}
rm -rf ~/install.sh
}