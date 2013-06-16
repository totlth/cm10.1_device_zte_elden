#!/system/bin/sh
# Copyright (c) 2009-2012, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`
case "$target" in
    "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_6x" | "msm7627a"  | "msm7627_surf" | \
    "qsd8250_surf" | "qsd8250_ffa" | "msm7630_surf" | "msm7630_1x" | "msm7630_fusion" | "qsd8650a_st1x")
        echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
        ;;
esac

case "$target" in
    "msm7201a_ffa" | "msm7201a_surf")
        echo 500000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "msm7630_surf" | "msm7630_1x" | "msm7630_fusion")
        echo 75000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        echo 1 > /sys/module/pm2/parameters/idle_sleep_mode
        ;;
esac

case "$target" in
     "msm7201a_ffa" | "msm7201a_surf" | "msm7627_ffa" | "msm7627_6x" | "msm7627_surf" | "msm7630_surf" | "msm7630_1x" | "msm7630_fusion")
        echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
        ;;

     "msm7627a")
        # start with default minimum for this family.
        echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
        available_frequencies=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies`
        for freq in $available_frequencies
           do
              # Set this freq as minimum if available.
              if [[ $freq = "196608" ]]; then
                 echo 196608 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
              fi
           done
        ;;


esac

case "$target" in
    "msm8660")
	 echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
	 echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
	 echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_dig
	 echo 2 > /sys/module/rpm_resources/enable_low_power/vdd_mem
	 echo 1 > /sys/module/rpm_resources/enable_low_power/rpm_cpu
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/standalone_power_collapse/suspend_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu0/standalone_power_collapse/idle_enabled
	 echo 1 > /sys/module/pm_8660/modes/cpu1/standalone_power_collapse/idle_enabled
	 echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	 echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
	 echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
	 echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
	 echo 1 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
	 echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
	 echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	 echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
	 chown system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
	 chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	 chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	 chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
	 chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
	 chown root.system /sys/devices/system/cpu/mfreq
	 chmod 220 /sys/devices/system/cpu/mfreq
	 chown root.system /sys/devices/system/cpu/cpu1/online
	 chmod 664 /sys/devices/system/cpu/cpu1/online
        ;;
esac

case "$target" in
    "msm8960")
     echo 1 > /sys/module/rpm_resources/enable_low_power/L2_cache
     echo 1 > /sys/module/rpm_resources/enable_low_power/pxo
     echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_dig
     echo 1 > /sys/module/rpm_resources/enable_low_power/vdd_mem
     echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/suspend_enabled
     echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/suspend_enabled
     echo 0 > /sys/module/pm_8x60/modes/cpu0/standalone_power_collapse/idle_enabled
     echo 0 > /sys/module/pm_8x60/modes/cpu1/standalone_power_collapse/idle_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/suspend_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/suspend_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu0/power_collapse/idle_enabled
     echo 1 > /sys/module/pm_8x60/modes/cpu1/power_collapse/idle_enabled
     echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
     echo "ondemand" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
     echo 90 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
     echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
     echo 0 > /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
     echo 4 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
     echo 10 > /sys/devices/system/cpu/cpufreq/ondemand/down_differential
     echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
     chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
     chown system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
     chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
     chown system /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
     chown root.system /sys/devices/system/cpu/mfreq
     chmod 220 /sys/devices/system/cpu/mfreq
     chown root.system /sys/devices/system/cpu/cpu1/online
     chmod 664 /sys/devices/system/cpu/cpu1/online
        ;;
esac

case "$target" in
    "msm7627_ffa" | "msm7627_surf" | "msm7627a" | "msm7627_6x")
        echo 25000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8250_surf" | "qsd8250_ffa" | "qsd8650a_st1x")
        echo 50000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
        ;;
esac

case "$target" in
    "qsd8650a_st1x")
        mount -t debugfs none /sys/kernel/debug
    ;;
esac

chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate

emmc_boot=`getprop ro.emmc`
case "$emmc_boot"
    in "1")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

# P896A10
zte_project=`getprop ro.product.model`

# Post-setup services
case "$target" in
    "msm8660" | "msm8960")
case "$zte_project" in
      "ZTE V9800")  
      echo 1 > /sys/devices/system/cpu/cpu1/online
      ;;
      *         )  
        start mpdecision
     ;;
esac
esac



case "$target" in
    "msm8660")
        start thermald
    ;;
esac

# Change adj level and min_free_kbytes setting for lowmemory killer to kick in
case "$target" in
     "msm7627a")
	echo 0,1,2,4,9,12 > /sys/module/lowmemorykiller/parameters/adj
	echo 5120 > /proc/sys/vm/min_free_kbytes
     ;;
esac

# P896A10
case "$zte_project" in
      "ZTE V9800")
     
     echo "badass" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
     echo "badass" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor 
     
#  set performance oriented configuration 
#    echo 918000 > /sys/devices/system/cpu/cpufreq/badass/two_phase_freq
#	   echo 1242000 > /sys/devices/system/cpu/cpufreq/badass/three_phase_freq
#	   echo 16 > /sys/devices/system/cpu/cpufreq/badass/semi_busy_threshold
#	   echo 6 > /sys/devices/system/cpu/cpufreq/badass/semi_busy_clr_threshold
#	   echo 120 > /sys/devices/system/cpu/cpufreq/badass/busy_threshold
#	   echo 80 > /sys/devices/system/cpu/cpufreq/badass/busy_clr_threshold
#	   echo 150 > /sys/devices/system/cpu/cpufreq/badass/gpu_semi_busy_threshold
#	   echo 50 > /sys/devices/system/cpu/cpufreq/badass/gpu_semi_busy_clr_threshold
#	   echo 260 > /sys/devices/system/cpu/cpufreq/badass/gpu_busy_threshold
#	   echo 180 > /sys/devices/system/cpu/cpufreq/badass/gpu_busy_clr_threshold     
   
# set balanced configuration  
     echo 1026000 > /sys/devices/system/cpu/cpufreq/badass/two_phase_freq
	   echo 1242000 > /sys/devices/system/cpu/cpufreq/badass/three_phase_freq
	   echo 14 > /sys/devices/system/cpu/cpufreq/badass/semi_busy_threshold
	   echo 6 > /sys/devices/system/cpu/cpufreq/badass/semi_busy_clr_threshold
	   echo 120 > /sys/devices/system/cpu/cpufreq/badass/busy_threshold
	   echo 80 > /sys/devices/system/cpu/cpufreq/badass/busy_clr_threshold
	   echo 260 > /sys/devices/system/cpu/cpufreq/badass/gpu_semi_busy_threshold
	   echo 180 > /sys/devices/system/cpu/cpufreq/badass/gpu_semi_busy_clr_threshold
	   echo 700 > /sys/devices/system/cpu/cpufreq/badass/gpu_busy_threshold
	   echo 500 > /sys/devices/system/cpu/cpufreq/badass/gpu_busy_clr_threshold
	   
# set battery saving configuration
#     echo 918000 > /sys/devices/system/cpu/cpufreq/badass/two_phase_freq
#     echo 1242000 > /sys/devices/system/cpu/cpufreq/badass/three_phase_freq
#     echo 80 > /sys/devices/system/cpu/cpufreq/badass/semi_busy_threshold
#     echo 20 > /sys/devices/system/cpu/cpufreq/badass/semi_busy_clr_threshold
#     echo 140 > /sys/devices/system/cpu/cpufreq/badass/busy_threshold
#     echo 110 > /sys/devices/system/cpu/cpufreq/badass/busy_clr_threshold
#     echo 300 > /sys/devices/system/cpu/cpufreq/badass/gpu_semi_busy_threshold
#     echo 250 > /sys/devices/system/cpu/cpufreq/badass/gpu_semi_busy_clr_threshold
#     echo 750 > /sys/devices/system/cpu/cpufreq/badass/gpu_busy_threshold
#     echo 600 > /sys/devices/system/cpu/cpufreq/badass/gpu_busy_clr_threshold
 
     echo 90 > /sys/devices/system/cpu/cpufreq/badass/up_threshold
     echo 10000 > /sys/devices/system/cpu/cpufreq/badass/sampling_rate
     echo 0 > /sys/devices/system/cpu/cpufreq/badass/io_is_busy
     echo 4 > /sys/devices/system/cpu/cpufreq/badass/sampling_down_factor
     echo 10 > /sys/devices/system/cpu/cpufreq/badass/down_differential
     
		 echo 0 > /sys/devices/system/cpu/cpu1/online
    ;;
esac

# Check if shutdown is enabled when low batttery capacity;
# 0 means disable;1 means enable
# default is 1=enable to shutdown
#
shutdown_ctrl=`getprop persist.sys.shutdown_ctrl`
case "$shutdown_ctrl" in
   "0" )
       echo 1 > /sys/module/pm8921_charger/parameters/enable_to_shutdown
       ;;
esac

case "$shutdown_ctrl" in
   "1" )
       echo 0 > /sys/module/pm8921_charger/parameters/enable_to_shutdown
       ;;
esac       

