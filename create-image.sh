#!/bin/bash

export CFGDIR=~/r/config
if -f $CFGDIR
	cp etc/network/if-up.d/reverse_tun .tmp
	cp etc/wpa_supplicant/wpa_supplicant.conf .tmp
	cp $CFGDIR/reverse_tun etc/network/if-up.d/reverse_tun
	cp $CFGDIR/wpa_supplicant.conf etc/wpa_supplicant/wpa_supplicant.conf
fi

cp 2020-05-27-raspios-buster-lite-armhf.img 2020-05-27-lite-01.img

./create-image 2020-05-27-lite-01.img

if -f $CFGDIR
	cp etc/network/if-up.d/reverse_tun.tmp
	cp etc/wpa_supplicant/wpa_supplicant.tmp
fi
