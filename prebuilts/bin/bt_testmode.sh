#!/system/bin/sh
# Copyright (c) 2009, ZTE . All rights reserved.
#History:
#when       who         what, where, why
#--------   ----        ---------------------------------------------------
#2009-12-24 zhangxian   new file for bt test mode 
##########################################



#echo 1 > /sys/class/rfkill/rfkill0/state

#setprop ctl.start hciattach
#sleep 2
hci_qcomm_init -vvv -e
echo 1 > /sys/module/hci_smd/parameters/hcismd_set
hciconfig hci0 up      
hcitool cmd 0x06 0x0003
hcitool cmd 0x03 0x0005 0x02 0x00 0x02
hcitool cmd 0x03 0x001A 0x03
hcitool cmd 0x03 0x0020 0x00
hcitool cmd 0x03 0x0022 0x00
