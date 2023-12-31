# tools
sudo apt-get install curl wget wakeonlan git &&

# instal mqtt tools
# hivemq-broker f30aecedfa9d4b97a6d732678e116680.s2.eu.hivemq.cloud:8883
sudo apt-get install mosquitto mosquitto-clients &&

# node.js server
sudo apt-get install npm &&
sudo npm install express &&
sudo npm install forever &&

# arm compiler and debugger
sudo apt-get install openocd gcc-arm-none-eabi minicom &&

# gcc compiler
sudo apt-get install build-essential &&

# camera capture
sudo apt-get install ffmpeg

# airplay https://github.com/mikebrady/shairport-sync
cd ~ &&
sudo apt-get install autoconf libtool libdaemon-dev libasound2-dev libpopt-dev libconfig-dev &&
sudo apt install avahi-daemon libavahi-client-dev &&
sudo apt install libssl-dev &&
git clone https://github.com/mikebrady/shairport-sync.git &&
cd shairport-sync &&
autoreconf -i -f &&
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata &&
make &&
sudo make install &&
sudo systemctl enable shairport-sync &&
sudo service shairport-sync start


# ---  common commands
## capture camera input
# ffmpeg -f video4linux2 -i /dev/video0 out.mpeg -t 00:00:10
# ffplay czesc.mp3 -nodisp -loop 1 -autoexit -af "volume=0.3"

## wifi off
# sudo ifconfig wlan0 down