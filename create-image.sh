#!/bin/bash

export CFGDIR=~/r/config
if [ -d $CFGDIR ]
then
	echo "personal config"
	mv etc/network/if-up.d/reverse_tun etc/network/if-up.d/reverse_tun.tmp
	mv etc/wpa_supplicant/wpa_supplicant.conf etc/wpa_supplicant/wpa_supplicant.tmp
	cp $CFGDIR/reverse_tun etc/network/if-up.d/reverse_tun
	cp $CFGDIR/wpa_supplicant.conf etc/wpa_supplicant/wpa_supplicant.conf
fi

#cp 2020-05-27-raspios-buster-lite-armhf.img 2020-05-27-lite-01.img
#./create-image 2020-05-27-lite-01.img

if [ -d $CFGDIR ]
then
	mv etc/network/if-up.d/reverse_tun.tmp etc/network/if-up.d/reverse_tun
	mv etc/wpa_supplicant/wpa_supplicant.tmp etc/wpa_supplicant/wpa_supplicant.conf
fi
