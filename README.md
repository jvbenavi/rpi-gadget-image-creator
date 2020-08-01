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
```

Apps:
1. default mode:
  1.a eth usb gadget with (win shared) internet (dhcp client, Bonjur deskovery) 
  1.b wifi internet (home/mble)
  1.c internet-up, rev_tun access 
2. wifi internet, usb-eth/usb-wlan2 lan (dhcp server) 
3. public HotSpot


