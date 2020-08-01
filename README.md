# Raspbery Pi USB Gadget Image Builder

A script to add USB Ethernet Gadget configuration to a standard Raspbian Lite SD Card image. 
This should work with Raspberry Pi Zero, Zero W and 4.

Currently only tested on Linux, but should run on OSx 

(jvb) modified for personel use 

## Requirements

 - Docker
 - expect

## Install

Clone the repo

```
git clone git@github.com:hardillb/rpi-gadget-image-creator.git
```

Copy the raspbian lite image into the `rpi-gadget-image-creator`  directory.

## Running

```
./create-image 2019-09-26-raspbian-buster-lite.img
```

or (jvb): 

```
./create-image.sh 
```

Once complete you can write the image file to a SD Card with any of the usual tools e.g. `dd` or `balena-etch`.
You can find instructions on the Raspberry Pi website [here](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

## TODO

Look at repackaging everything into an extention to DockerPi so the whole thing runs in the container.

(jvb) wpa_config convert to hash, check into CFGDIR

(jvb) add ssh key for rev_tun 

## notes, usefull commands 

```
sudo iwlist wlan0 scan | grep name
ifconfig wlan0
wpa_cli -i wlan0 reconfigure

ifdown usb0 
ifup usb0
```

Apps:

1. default mode:  
  1.a eth usb gadget with (win shared) internet (dhcp client, Bonjur deskovery)  
  1.b wifi internet (home/mble)  
  1.c internet-up, rev_tun access   
2. wifi internet, usb-eth/usb-wlan2 lan (dhcp server)   
3. public HotSpot, home AP 

LICENSE  README.md  create-image  create-image.sh  etc  lib  usr

install dnsmasq
etc/dnsmasq.d/usb0
	interface=usb0
	dhcp-range=10.55.0.2,10.55.0.6,255.255.255.248,1h
	dhcp-option=3
	leasefile-ro
send "echo denyinterfaces usb0 >> /etc/dhcpcd.conf\n"

etc/network/interfaces.d/usb0
    auto usb0
    allow-hotplug usb0
    iface usb0 inet static
      address 10.55.0.1
      netmask 255.255.255.248
adafruit Static
    allow-hotplug usb0
    iface usb0 inet static
      address 192.168.7.2
      netmask 255.255.255.0
      network 192.168.7.0
      broadcast 192.168.7.255
      gateway 192.168.7.1
adafruit internet 
	auto lo 
	iface lo inet loopback
	iface eth0 inet manual

	allow-hotplug wlan0
	iface wlan0 inet manual
	    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
	allow-hotplug wlan1
	iface wlan1 inet manual
	    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

	auto usb0
	allow-hotplug usb0
	iface usb0 inet manual
adafruite options
    sudo systemctl disable dhcpcd

	auto lo
	iface lo inet loopback

	auto usb0
	allow-hotplug usb0
	iface usb0 inet static
	address 10.77.77.77
	netmask 255.255.255.0

	allow-hotplug wlan0
	iface wlan0 inet dhcp
	wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

	sudo nano /etc/dnsmasq.conf (add:) 
		dhcp-range=10.77.77.78,10.77.77.99,12h
		dhcp-option=3
		dhcp-option=6

etc/wpa_supplicant/wpa_supplicant.conf

etc/network/if-up.d/reverse_tun

usr/local/sbin/argon1.sh
usr/local/lowendscript
usr/local/sbin/usb-gadget.sh
lib/systemd/system/usbgadget.service



