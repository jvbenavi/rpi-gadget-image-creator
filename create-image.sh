#!/bin/bash

export CFGDIR=~/r/config

cp img/2020-05-27-raspios-buster-lite-armhf.img img/2020-05-27-lite-01.img

cp $CFGDIR/reverse_tun etc/network/if-up.d/reverse_tun
cp $CFGDIR/wpa_supplicant.conf etc/wpa_supplicant/wpa_supplicant.conf

./create-image img/2020-05-27-lite-01.img

