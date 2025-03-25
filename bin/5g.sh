#!/bin/bash

ENABLE_RADIO="mbimcli -p -d /dev/wwan0mbim0 -v --quectel-set-radio-state=onmbimcli -p -d /dev/wwan0mbim0 -v --quectel-set-radio-state=on"
ENABLE_MODEM="mmcli --modem 1 --enable"
RESTART_NETWORK_MANAGER="systemctl restart NetworkManager"
CONNECT="nmcli c up id 'Wingo'"

sudo bash -c "$ENABLE_RADIO && $RESTART_NETWORK_MANAGER && $CONNECT"
