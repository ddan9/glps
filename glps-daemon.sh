#!/bin/bash

##############################################
#                                            #
# Here is preload and settings block of code #
#                                            #
##############################################

################################################################################################
#                                                                                              #
# NOTICE:                                                                                      #
#                                                                                              #
# 0 - OFF | 1 - ON | auto - automatic value detection (experimental, not supported everywhere) #
#                                                                                              #
# [ auto ] - usually sets the maximum possible value                                           #
#                                                                                              #
# Column [ statements: 0/1/* ] - for a configurable parameter                                  #
#                                                                                              #
# Dependent settings are have indent                                                           #
#                                                                                              #
# You can use google translator to translate comments into your language                       #
#                                                                                              #
################################################################################################

# daemon settings (start) #

loop="1" # set loop to daemon; statements: 0/1 #

polling_time="600" # quiz frequency in seconds - you can change it on your own #

# daemon settings (end) #

# brightness settings (start) #

use_changing_brightness="1" # brigtness value change function; statements: 0/1  #

	oneshot_brightness="1" # use changing brightness once; statements: 0/1  #

	daemon_brightness="0" # use changing brightness always; statements: 0/1  #

	path_brightness="/sys/class/backlight/intel_backlight/brightness" # ATTENTION! You must check this item yourself in your system #

	ac_brightness="12421" # ATTENTION! You must check this item yourself in your system #

	battery_brightness="0" # ATTENTION! You must check this item yourself in your system #

# brightness settings (end) #

# tray indicator settings (start) #

use_gtrayicon="1" # use gtrayicon for create tray indicator; depends of gtrayicon package; statements: 0/1 #

	gtrayicon_ac_icon="/usr/share/icons/gnome/scalable/emotes/face-devilish-symbolic.svg"

	gtrayicon_battery_icon="/usr/share/icons/gnome/scalable/emotes/face-angel-symbolic.svg"

# tray indicator settings (end) #

# notification settings (start) #

use_notify_send="1" # use notification sending function; depends of notify-send (libnotify-bin or notify-osd) package; statements: 0/1 #

	use_notify_send_standalone="0" # send notification regardless; statements: 0/1 #

	use_notify_send_with_gtrayicon="1" # send notification; depends of gtrayicon; statements: 0/1 #

# notification settings (end) #

# kernel settings (start) #

use_changing_kernel_params="1" # kernel changing parameters function; statements: 0/1 #

	use_smt_power_saving="0" # ATTENTION! You must check this item yourself in your system; change smt power saving; statements: 0/1 #

	use_mc_power_saving="0" # ATTENTION! You must check this item yourself in your system; change mc power saving; statements: 0/1 #

# kernel settings (end) #

# fan speed settings (start) #

use_changing_fan="1" # change fan speed function if your hardware support it; statements: 0/1 #

	fan_changing_path="/sys/devices/platform/samsung/performance_level" # ATTENTION! You must check this item yourself in your system #

	fan_ac_speed="overclock" # ATTENTION! You must check this item yourself in your system #

	fan_battery_speed="silent" # ATTENTION! You must check this item yourself in your system #

# fan speed settings (end) #

# powertop settings (start) #

use_powertop="1" # use powertop as module; depends of powertop package; statements: 0/1 #

# powertop settings (end) #

# modprobe settings (start) #

use_modprobe="1" # use modprobe as module to change devices statements; depends of modprobe (kmod) package; statements: 0/1 #

	use_changing_camera="1" # use change camera statements; statements: 0/1  #

# modprobe settings (end) #

# wireless interface settings (start) #

use_wireless_powersaving="1" # change wireless interface parameters; statements: 0/1 #

	wireless_interface="wlp5s0" # ATTENTION! You must check this item yourself in your system #

	# wireless interface settings using iw package; depends of iw package (start) #

	use_iw_pm="0" # ATTENTION! You must check this item yourself in your system; change wireless interface power management parameter; statements: 0/1 #

	use_iw_txpower="1" # use change wireless interface txpower; statements: 0/1 #

		iw_ac_txpower="16" # ATTENTION! You must check this item yourself in your system #

			iw_set_ac_txpower="auto" # ATTENTION! You must check this item yourself in your system #

		iw_battery_txpower="1" # ATTENTION! You must check this item yourself in your system #

			iw_set_battery_txpower="limit 100" # ATTENTION! You must check this item yourself in your system #

	# wireless interface settings using iw package; depends of iw package (end) #

	# wireless interface settings using iwconfig package; depends of iwconfig (wireless-tools) package (start) #

	use_iwconfig_pm="0" # ATTENTION! You must check this item yourself in your system; change wireless interface power management parameter; statements: 0/1 #

	use_iwconfig_txpower="1" # use change wireless interface txpower; statements: 0/1 #

		iwconfig_ac_txpower="16" # ATTENTION! You must check this item yourself in your system #

			iwconfig_set_ac_txpower="auto" # ATTENTION! You must check this item yourself in your system #

		iwconfig_battery_txpower="1" # ATTENTION! You must check this item yourself in your system #

			iwconfig_set_battery_txpower="1" # ATTENTION! You must check this item yourself in your system #

	# wireless interface settings using iwconfig package; depends of iwconfig (wireless-tools) package (end) #

# wireless interface settings (end) #

# rfkill settings (start) #

use_rfkill="1" # use rfkill package as module to change wireless interface statements; depends of rfkill package; statements: 0/1 #

	use_changing_wifi="1" # change wifi interface statements; statements: 0/1 #

		oneshot_wifi="1" # change wifi interface statements once; statements: 0/1 #

		daemon_wifi="0" # change wifi interface statements always; statements: 0/1 #

	use_changing_bluetooth="1" # change bluetooth interface statements; statements: 0/1 #

		oneshot_bluetooth="1" # change bluetooth interface statements once; statements: 0/1 #

		daemon_bluetooth="1" # change bluetooth interface statements always; statements: 0/1 #

# rfkill settings (end) #

# ipv6 settings (start) #

use_changing_ipv6="1" # change ipv6 statements; statements: 0/1 #

	use_sysctl="1" # change ipv6 statements using sysctl package; depends of sysctl (procps or procps-ng) package; statements: 0/1 #

# ipv6 settings (end) #

# scsi settings (start) #

use_changing_scsi="1" # change scsi statements function; statements: 0/1 #

	number_of_scsi_host="4" # ATTENTION! You must check this item yourself in your system #

	ac_scsi_host="max_performance" # ATTENTION! You must check this item yourself in your system #

	battery_scsi_host="min_power" # ATTENTION! You must check this item yourself in your system #

# scsi settings (end) #

# online cpu cores settings (start) #

use_changing_online_cores="0" # online cores statement change function, can enable or disable cores; statements: 0/1 #

	battery_number_of_online_cores="auto" # enabled number of cores on battery; statements: 1/number/auto #

	ac_number_of_online_cores="auto" # enabled number of cores on ac; statements: 1/number/auto  #

# online cpu cores settings (end) #

# cpu governor settings (start) #

use_changing_governor="1" # cpu cores governor change function; statements: 0/1 #

	use_cpufreq="0" # change cpu cores governor using cpufreq-set as module; depends of cpufreq-set (cpufreutils) package; statements: 0/1 #

	number_of_cores="auto" # number of changeable cpu cores; statements: 0/number/auto #

	battery_governor="ondemand" # ATTENTION! You must check this item yourself in your system #

	ac_governor="performance" # ATTENTION! You must check this item yourself in your system #

# cpu governor settings (end) #

# pcie settings (start) #

use_changing_pcie="1" # change pcie statement function; statements: 0/1 #

# pcie settings (end) #

# hdparm settings (start) #

use_hdparm="1" # change your hard disk power management parameters using hdparm; depends of hdparm package; statements: 0/1 #

	hard_disk="/dev/sda" # ATTENTION! You must check this item yourself in your system #

# hdparm settings (end) #

# cdrom hal polling settings (start) #

use_hal_polling="0" # ATTENTION! You must check this item yourself in your system; change cdrom polling function; statements: 0/1 #

	hal_polling_device="/dev/cdrom" # ATTENTION! You must check this item yourself in your system #

# cdrom hal polling settings (end) #

# systemd services settings (start) #

use_systemd="1" # parameter that provides the ability to control systemd processes; depends of systemd package; statements: 0/1 #

	use_laptop_mode_tools="1" # use laptop-mode-tools as module; depends of laptop-mode-tools package; statements: 0/1 #

		ac_laptop_mode="0" # statements: 0..5 #

		battery_laptop_mode="5" # statements: 0..5 #

	use_cpufreqd="1" # use cpufreqd as module; depends of cpufreqd package; statements: 0/1 #

	use_samsung_tools="1" # use samsung-tools as module; depends of samsung-tools package; statements: 0/1 #

		oneshot_samsung_tools="1" # use samsung-tools once; statements: 0/1 #

		daemon_samsung_tools="0" # use samsung-tools always; statements: 0/1 #

	use_autosuspend="0" # autosuspend function if your system not support it; depends of polling time; statements: 0/1 #

		path_battery_percentage="/sys/class/power_supply/BAT1/capacity" # ATTENTION! You must check this item yourself in your system #

		min_battery_percentage="5" # ATTENTION! You must check this item yourself in your system #

	stop_setvtrgb="1" # stop setvtrgb service using systemd if you have it; statements: 0/1 #

	stop_rclocal="1" # stop rc.local service using systemd if you have it; statements: 0/1 #

	stop_colord="1" # stop colord service using systemd if you have it; statements: 0/1 #

	stop_keyboardsetup="1" # stop keyboard-setup service using systemd if you have it; statements: 0/1 #

	stop_preload="1" # stop preload service using systemd; depends of preload package; statements: 0/1 #

	stop_avahidaemon="1" # stop avahi-daemon service using systemd if you have it; statements: 0/1 #

	stop_ntp="1" # stop ntp service using systemd if you have it; statements: 0/1 #

# systemd services settings (end) #

########################################################
#                                                      #
# Here is end point preload and settings block of code #
#                                                      #
########################################################

###############################################
#                                             #
# Here is start point functions block of code #
#                                             #
###############################################

# function of skipping (start) #

function skip()

{

	sleep 0

}

# function of skipping (end) #

# function of long time wait for polling (start) #

function longwait()

{

	sleep $polling_time

}

# function of long time wait for polling (end) #

# function of suspend for daemon autosuspend function (start) #

function daemon.battery.suspend()

{

	sudo systemctl suspend

}

# function of suspend for daemon autosuspend function (end) #

# function of oneshot changing brightness (start) #

function oneshot.change_brightness()

{

	if on_ac_power;

		then

			if [ $use_changing_brightness = "1" ] && [ $oneshot_brightness = "1" ]

				then

					if (( $(cat $path_brightness) < $ac_brightness ))

						then

							echo $ac_brightness > $path_brightness

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_changing_brightness = "1" ] && [ $oneshot_brightness = "1" ]

				then

					if (( $(cat $path_brightness) > $battery_brightness ))

						then

							echo $battery_brightness > $path_brightness

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of oneshot changing brightness (stop) #

# function of oneshot changing wifi with rfkill (start) #

function oneshot.rfkill.change_wifi()

{

	if on_ac_power;

		then

			if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $oneshot_wifi = "1" ]

				then

					if (( $(rfkill list wifi | grep -c "yes") > "0" ))

						then

							sudo rfkill unblock wifi

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $oneshot_wifi = "1" ]

				then

					if (( $(rfkill list wifi | grep -c "no") > "0" ))

						then

							sudo rfkill block wifi

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of oneshot changing wifi with rfkill (end) #

# function of oneshot changing bluetooth with rfkill (start) #

function oneshot.rfkill.change_bluetooth()

{

	if on_ac_power;

		then

			if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $oneshot_bluetooth = "1" ]

				then

					if (( $(rfkill list bluetooth | grep -c "yes") > "0" ))

						then

							sudo rfkill unblock bluetooth

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $oneshot_bluetooth = "1" ]

				then

					if (( $(rfkill list bluetooth | grep -c "no") > "0" ))

						then

							sudo rfkill block bluetooth

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of oneshot changing bluetooth with rfkill (end) #

# function of oneshot starting samsung tools service with systemd (start) #

function oneshot.systemd.use_samsung_tools()

{

	if [ $use_systemd = "1" ] && [ $use_samsung_tools = "1" ] && [ $oneshot_samsung_tools = "1" ]

		then

			if [[ $(systemctl status samsung-tools.service | grep -c disabled) != "1" ]]

				then

					sudo systemctl disable samsung-tools.service

				else

					skip

			fi

			if [[ $(systemctl status samsung-tools.service | grep -c inactive) = "1" ]]

				then

					sudo systemctl start samsung-tools.service

				else

					skip

			fi

			if [[ $(systemctl status samsung-tools.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl stop samsung-tools.service

				else

					skip

			fi

		else

			skip

	fi

}

# function of oneshot starting samsung tools service with systemd (end) #

# function of pre-anywayshot starting cpufreqd service with systemd (start) #

function pre_anywayshot.systemd.use_cpufreqd()

{

	if [ $use_systemd = "1" ] && [ $use_cpufreqd = "1" ]

		then

			if [[ $(systemctl status cpufreqd.service | grep -c disabled) != "1" ]]

				then

					sudo systemctl disable cpufreqd.service

				else

					skip

			fi

			if [[ $(systemctl status cpufreqd.service | grep -c inactive) = "1" ]]

				then

					sudo systemctl start cpufreqd.service

				else

					skip

			fi

			if [[ $(systemctl status cpufreqd.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl stop cpufreqd.service

				else

					skip

			fi

		else

			skip

	fi

}

# function of pre-anywayshot starting cpufreqd service with systemd (end) #

# function of pre-anywayshot stopping rc-local service with systemd (start) #

function pre_anywayshot.systemd.stop_rc_local()

{

	if [ $use_systemd = "1" ] && [ $stop_rclocal = "1" ] && [ $(systemctl status rc-local.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop rc-local.service

		else

			skip

	fi

}

# function of pre-anywayshot stopping rc-local service with systemd (end) #

# function of pre-anywayshot stopping avahi-daemon service with systemd (start) #

function pre_anywayshot.systemd.stop_avahi_daemon()

{

	if [ $use_systemd = "1" ] && [ $stop_avahidaemon = "1" ] && [ $(systemctl status avahi-daemon.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop avahi-daemon.service

		else

			skip

	fi

	if [ $use_systemd = "1" ] && [ $stop_avahidaemon = "1" ] && [ $(systemctl status avahi-daemon.socket | grep -c inactive) != "1" ]

		then

			sudo systemctl stop avahi-daemon.socket

		else

			skip

	fi

}

# function of pre-anywayshot stopping avahi-daemon service with systemd (end) #

# function of pre-anywayshot stopping keyboard-setup service with systemd (start) #

function pre_anywayshot.systemd.stop_keyboard_setup()

{

	if [ $use_systemd = "1" ] && [ $stop_keyboardsetup = "1" ] && [ $(systemctl status keyboard-setup.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop keyboard-setup.service

		else

			skip

	fi

}

# function of pre-anywayshot stopping keyboard-setup service with systemd (end) #

# function of pre-anywayshot starting laptop-mode-tools service with systemd (start) #

function pre_anywayshot.systemd.use_laptop_mode_tools()

{

	if [ $use_systemd = "1" ] && [ $use_laptop_mode_tools = "1" ]

		then

			if [[ $(systemctl status laptop-mode.timer | grep -c disabled) != "1" ]]

				then

					sudo systemctl disable laptop-mode.timer

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.service | grep -c "disabled;") != "1" ]]

				then

					sudo systemctl disable laptop-mode.service

				else

					skip

			fi

			if [[ $(systemctl status lmt-poll.service | grep -c disabled) != "1" ]]

				then

					sudo systemctl disable lmt-poll.service

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.timer | grep -c inactive) = "1" ]]

				then

					sudo systemctl start laptop-mode.timer

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.service | grep -c inactive) = "1" ]]

				then

					sudo systemctl start laptop-mode.service

				else

					skip

			fi

			if [[ $(systemctl status lmt-poll.service | grep -c inactive) = "1" ]]

				then

					sudo systemctl start lmt-poll.service

				else

					skip

			fi

			if on_ac_power;

				then

					if (( $(cat /proc/sys/vm/laptop_mode) != $ac_laptop_mode ))

						then

							echo $ac_laptop_mode > /proc/sys/vm/laptop_mode

						else

							skip

					fi

				else

					if (( $(cat /proc/sys/vm/laptop_mode) != $battery_laptop_mode ))

						then

							echo $battery_laptop_mode > /proc/sys/vm/laptop_mode

						else

							skip

					fi

			fi

			if [[ $(systemctl status laptop-mode.timer | grep -c inactive) != "1" ]]

				then

					sudo systemctl restart laptop-mode.timer

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl restart laptop-mode.service

				else

					skip

			fi

			if [[ $(systemctl status lmt-poll.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl restart lmt-poll.service

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl reload laptop-mode.service

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.timer | grep -c inactive) != "1" ]]

				then

					sudo systemctl stop laptop-mode.timer

				else

					skip

			fi

			if [[ $(systemctl status lmt-poll.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl stop lmt-poll.service

				else

					skip

			fi

			if [[ $(systemctl status laptop-mode.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl stop laptop-mode.service

				else

					skip

			fi

		else

			skip

	fi

}

# function of pre-anywayshot starting laptop-mode-tools service with systemd (end) #

# function of post-anywayshot stopping setvtrgb service with systemd (start) #

function post_anywayshot.systemd.stop_setvtrgb()

{

	if [ $use_systemd = "1" ] && [ $stop_setvtrgb = "1" ] && [ $(systemctl status setvtrgb.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop setvtrgb.service

		else

			skip

	fi

}

# function of post-anywayshot stopping setvtrgb service with systemd (end) #

# function of post-anywayshot stopping colord service with systemd (start) #

function post_anywayshot.systemd.stop_colord()

{

	if [ $use_systemd = "1" ] && [ $stop_colord = "1" ] && [ $(systemctl status colord.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop colord.service

		else

			skip

	fi

}

# function of post-anywayshot stopping colord service with systemd (end) #

# function of post-anywayshot stopping preload service with systemd (start) #

function post_anywayshot.systemd.stop_preload()

{

	if [ $use_systemd = "1" ] && [ $stop_preload = "1" ] && [ $(systemctl status preload.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop preload.service

		else

			skip

	fi

}

# function of post-anywayshot stopping preload service with systemd (end) #

# function of post-anywayshot stopping ntp service with systemd (start) #

function post_anywayshot.systemd.stop_ntp()

{

	if [ $use_systemd = "1" ] && [ $stop_ntp = "1" ] && [ $(systemctl status ntp.service | grep -c inactive) != "1" ]

		then

			sudo systemctl stop ntp.service

		else

			skip

	fi
}

# function of post-anywayshot stopping ntp service with systemd (end) #

# function of daemon using make tray indicator with grayicon (start) #

function daemon.start_gtrayicon()

{

	if on_ac_power;

		then

			if [ $use_gtrayicon = "1" ]

				then

					if [[ $(pgrep -f -c "GLPS-Daemon: performance") != "0" ]] && [[ $(pgrep -f -c "GLPS-Daemon: powersave") = "0" ]]

						then

							skip

						else

							if [[ $(pgrep -f -c "GLPS-Daemon: powersave") != "0" ]]

								then

									kill $(pgrep -f "GLPS-Daemon: powersave")

								else

									skip

							fi

							if [[ $(pgrep -f -c "GLPS-Daemon: performance") != "0" ]]

								then

									skip

								else

									export DISPLAY=:0

									export DISPLAY=:0.0

									su $(who -q | grep -v =) -c 'DISPLAY=:0.0 gtrayicon --display=:0.0 --activate='' --deactivate='' --activate-icon='$gtrayicon_ac_icon' --deactivate-icon='$gtrayicon_ac_icon' --tooltip="GLPS-Daemon: performance" > /dev/null 2>&1 &'

									if [ $use_notify_send = "1" ] && [ $use_notify_send_with_gtrayicon = "1" ]

										then

											export DISPLAY=:0

											export DISPLAY=:0.0

											su $(who -q | grep -v =) -c 'DISPLAY=:0.0 notify-send -i daemon "GPLS-Daemon" "Set performance settings"'

										else

											skip

									fi

							fi

					fi

				else

					skip

			fi

		else

			if [ $use_gtrayicon = "1" ]

				then

					if [[ $(pgrep -f -c "GLPS-Daemon: powersave") != "0" ]] && [[ $(pgrep -f -c "GLPS-Daemon: performance") = "0" ]]

						then

							skip

						else

							if [[ $(pgrep -f -c "GLPS-Daemon: performance") != "0" ]]

								then

									kill $(pgrep -f "GLPS-Daemon: performance")

								else

									skip

							fi

							if [[ $(pgrep -f -c "GLPS-Daemon: powersave") != "0" ]]

								then

									skip

								else

									export DISPLAY=:0

									export DISPLAY=:0.0

									su $(who -q | grep -v =) -c 'DISPLAY=:0.0 gtrayicon --display=:0.0 --activate='' --deactivate='' --activate-icon='$gtrayicon_battery_icon' --deactivate-icon='$gtrayicon_battery_icon' --tooltip="GLPS-Daemon: powersave" > /dev/null 2>&1 &'

									if [ $use_notify_send = "1" ] && [ $use_notify_send_with_gtrayicon = "1" ]

										then

											export DISPLAY=:0

											export DISPLAY=:0.0

											su $(who -q | grep -v =) -c 'DISPLAY=:0.0 notify-send -i daemon "GPLS-Daemon" "Set powersave settings"'

										else

											skip

									fi

							fi

					fi

				else

					skip

			fi

	fi

}

# function of daemon using make tray indicator with grayicon (stop) #

# function of daemon using send standalone notification with notify-send (start) #

function daemon.standalone.use_notify_send()

{

	if on_ac_power;

		then

			if [ $use_notify_send = "1" ] && [ $use_notify_send_standalone = "1" ]

				then

					export DISPLAY=:0

					export DISPLAY=:0.0

					su $(who -q | grep -v =) -c 'DISPLAY=:0.0 notify-send -i daemon "GPLS-Daemon" "Set performance settings"'

				else

					skip

			fi

		else

			if [ $use_notify_send = "1" ] && [ $use_notify_send_standalone = "1" ]

				then

					export DISPLAY=:0

					export DISPLAY=:0.0

					su $(who -q | grep -v =) -c 'DISPLAY=:0.0 notify-send -i daemon "GPLS-Daemon" "Set powersave settings"'

				else

					skip

			fi

	fi

}

# function of daemon using send standalone notification with notify-send (end) #

# function of daemon changing laptop_mode setting as native (start) #

function daemon.change_laptop_mode()

{

	if on_ac_power;

		then

			if [ $use_laptop_mode_tools = "1" ]

				then

					if (( $(cat /proc/sys/vm/laptop_mode) != $ac_laptop_mode ))

						then

							echo $ac_laptop_mode > /proc/sys/vm/laptop_mode

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_laptop_mode_tools = "1" ]

				then

					if (( $(cat /proc/sys/vm/laptop_mode) != $battery_laptop_mode ))

						then

							echo $battery_laptop_mode > /proc/sys/vm/laptop_mode

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing laptop_mode setting as native (end) #

# function of daemon on battery using powertop (start) #

function daemon.battery.use_powertop()

{

	if [ $use_powertop = "1" ]

		then

			sudo powertop -q --auto-tune

		else

			skip

	fi

}

# function of daemon on battery using powertop (end) #

# function of daemon on battery using samsung-tools service with systemd (start) #

function daemon.battery.use_samsung_tools()

{

	if [ $use_samsung_tools = "1" ] && [ $daemon_samsung_tools = "1" ]

		then

			if [[ $(systemctl status samsung-tools.service | grep -c disabled) != "1" ]]

				then

					sudo systemctl disable samsung-tools.service

				else

					skip

			fi

			if [[ $(systemctl status samsung-tools.service | grep -c inactive) = "1" ]]

				then

					sudo systemctl start samsung-tools.service

				else

					skip

			fi

			if [[ $(systemctl status samsung-tools.service | grep -c inactive) != "1" ]]

				then

					sudo systemctl stop samsung-tools.service

				else

					skip

			fi

		else

			skip

	fi

}

# function of daemon on battery using samsung-tools service with systemd (end) #

# function of daemon changing kernel parameters as native (start) #

function daemon.kernel.change_parameters()

{

	if on_ac_power;

		then

			if [ $use_changing_kernel_params = "1" ]

				then

					if (( $(cat /proc/sys/vm/dirty_ratio) != 10 ))

						then

							echo 10 > /proc/sys/vm/dirty_ratio

						else

							skip

					fi

					if (( $(cat /proc/sys/vm/dirty_background_ratio) != 5 ))

						then

							echo 5 > /proc/sys/vm/dirty_background_ratio

						else

							skip

					fi

					if (( $(cat /proc/sys/vm/dirty_expire_centisecs) != 1000 ))

						then

							echo 1000 > /proc/sys/vm/dirty_expire_centisecs

						else

							skip

					fi

					if (( $(cat /proc/sys/vm/dirty_writeback_centisecs) != 1000 ))

						then

							echo 1000 > /proc/sys/vm/dirty_writeback_centisecs

						else

							skip

					fi

					if (( $(cat /sys/module/snd_hda_intel/parameters/power_save) != 0 ))

						then

							echo 0 > /sys/module/snd_hda_intel/parameters/power_save

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_changing_kernel_params = "1" ]

				then

					if (( $(cat /proc/sys/vm/dirty_ratio) != 90 ))

						then

							echo 90 > /proc/sys/vm/dirty_ratio

						else

							skip

					fi

					if (( $(cat /proc/sys/vm/dirty_background_ratio) != 1 ))

						then

							echo 1 > /proc/sys/vm/dirty_background_ratio

						else

							skip

					fi

					if (( $(cat /proc/sys/vm/dirty_expire_centisecs) != 60000 ))

						then

							echo 60000 > /proc/sys/vm/dirty_expire_centisecs

						else

							skip

					fi

					if (( $(cat /proc/sys/vm/dirty_writeback_centisecs) != 60000 ))

						then

							echo 60000 > /proc/sys/vm/dirty_writeback_centisecs

						else

							skip

					fi

					if (( $(cat /sys/module/snd_hda_intel/parameters/power_save) != 1 ))

						then

							echo 1 > /sys/module/snd_hda_intel/parameters/power_save

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing kernel parameters as native (end) #

# function of daemon changing brigntness as native (start) #

function daemon.change_brightness()

{

	if on_ac_power;

		then

			if [ $use_changing_brightness = "1" ] && [ $daemon_brightness = "1" ]

				then

					if (( $(cat $path_brightness) < $ac_brightness ))

						then

							echo $ac_brightness > $path_brightness

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_changing_brightness = "1" ] && [ $daemon_brightness = "1" ]

				then

					if (( $(cat $path_brightness) > $battery_brightness ))

						then

							echo $battery_brightness > $path_brightness

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing brigntness as native (end) #

# function of daemon changing fan speed as native (start) #

function daemon.change_fan_speed()

{

	if on_ac_power;

		then

			if [[ $use_changing_fan = "1" ]]

				then

					if [[ $(cat $fan_changing_path) != $fan_ac_speed ]]

						then

							echo $fan_ac_speed > $fan_changing_path

						else

							skip

					fi

				else

					skip

			fi

		else

			if [[ $use_changing_fan = "1" ]]

				then

					if [[ $(cat $fan_changing_path) != $fan_battery_speed ]]

						then

							echo $fan_battery_speed > $fan_changing_path

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing fan speed as native (end) #

# function of daemon changing camera statement with modprobe (start) #

function daemon.modprobe.change_camera()

{

	if on_ac_power;

		then

			if [ $use_modprobe = "1" ]

				then

					if [ $use_changing_camera = "1" ] && [ $(ls /dev/ | grep -c "video") = "0" ]

						then

							sudo modprobe uvcvideo

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_modprobe = "1" ]

				then

					if [ $use_changing_camera = "1" ] && [ $(ls /dev/ | grep -c "video") != 0 ]

						then

							sudo modprobe -r uvcvideo

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing camera statement with modprobe (end) #

# function of daemon changing mc power savings as native (start) #

function daemon.change_mc_power_savings()

{

	if on_ac_power;

		then

			if [ $use_mc_power_saving = "1" ]

				then

					if [[ $(cat /sys/devices/system/cpu/sched_mc_power_savings) != "0" ]]

						then

							echo 0 > /sys/devices/system/cpu/sched_mc_power_savings

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_mc_power_saving = "1" ]

				then

					if [[ $(cat /sys/devices/system/cpu/sched_mc_power_savings) != "1" ]]

						then

							echo 1 > /sys/devices/system/cpu/sched_mc_power_savings

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing mc power savings as native (end) #

# function of daemon changing sched smt power savings as native (start) #

function daemon.change_sched_smt_power_savings()

{

	if on_ac_power;

		then

			if [ $use_smt_power_saving = "1" ]

				then

					if [[ $(cat /sys/devices/system/cpu/sched_smt_power_savings) != "0" ]]

						then

							echo 0 > /sys/devices/system/cpu/sched_smt_power_savings

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_smt_power_saving = "1" ]

				then

					if [[ $(cat /sys/devices/system/cpu/sched_smt_power_savings) != "1" ]]

						then

							echo 1 > /sys/devices/system/cpu/sched_smt_power_savings

						else

							skip

					fi

				else

					skip

			fi


	fi

}

# function of daemon changing sched smt power savings as native (end) #

# function of daemon changing wifi parameters with iw (start) #

function daemon.iw.change_wifi_parameters()

{

	if on_ac_power;

		then

			if [ $use_wireless_powersaving = "1" ]

				then

					if [ $use_iw_pm = "1" ]

						then

							if (( $(iw dev $wireless_interface get power_save | grep -c "off") != 1 ))

								then

									sudo iw dev $wireless_interface set power_save off

								else

									skip

							fi

						else

							skip

					fi

					if [ $use_iw_txpower = "1" ] && (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power:off") != "1" ))

						then

							if (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power=$iw_ac_txpower") != "1" ))

								then

									sudo iw dev $wireless_interface set txpower $iw_set_ac_txpower

								else

									skip

							fi

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_wireless_powersaving = "1" ]

				then

					if [ $use_iw_pm = "1" ]

						then

							if (( $(iw dev $wireless_interface get power_save | grep -c "on") != 1 ))

								then

									sudo iw dev $wireless_interface set power_save on

								else

									skip

							fi

						else

							skip

					fi

					if [ $use_iw_txpower = "1" ] && (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power:off") != "1" ))

						then

							if (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power=$iw_battery_txpower") != "1" ))

								then

									sudo iw dev $wireless_interface set txpower $iw_set_battery_txpower

								else

									skip

							fi

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing wifi parameters with iw (end) #

# function of daemon changing wifi parameters with iwconfig (start) #

function daemon.iwconfig.change_wifi_parameters()

{

	if on_ac_power;

		then

			if [ $use_wireless_powersaving = "1" ]

				then

					if [ $use_iwconfig_pm = "1" ]

						then

							if (( $(iwconfig $wireless_interface | grep -c "Power Management:off") != 1 ))

								then

									sudo iwconfig $wireless_interface power off

								else

									skip

							fi

						else

							skip

					fi

					if [ $use_iwconfig_txpower = "1" ] && (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=off") != "1" ))

						then

							if (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=$iwconfig_ac_txpower") != "1" ))

								then

									sudo iwconfig $wireless_interface txpower $iwconfig_set_ac_txpower

								else

									skip

							fi

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_wireless_powersaving = "1" ]

				then

					if [ $use_iwconfig_pm = "1" ]

						then

							if (( $(iwconfig $wireless_interface | grep -c "Power Management:on") != 1 ))

								then

									sudo iwconfig $wireless_interface power on

								else

									skip

							fi

						else

							skip

					fi

					if [ $use_iwconfig_txpower = "1" ] && (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=off") != "1" ))

						then

							if (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=$iwconfig_battery_txpower") != "1" ))

								then

									sudo iwconfig $wireless_interface txpower $iwconfig_set_battery_txpower

								else

									skip

							fi

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing wifi parameters with iwconfig (end) #

# function of daemon changing ipv6 statement (start) #

function daemon.change_ipv6()

{

	if on_ac_power;

		then

			if [ $use_changing_ipv6 = "1" ]

				then

					if (( $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) != 0 ))

						then

							echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6

						else

							skip

					fi

					if [ $use_sysctl = "1" ]

						then

							if (( $(sysctl net.ipv6.conf.all.disable_ipv6 | grep -c "1") != 0 ))

								then

									sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0

								else

									skip

							fi

							if (( $(sysctl net.ipv6.conf.default.disable_ipv6 | grep -c "1") != 0 ))

								then

									sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0

								else

									skip

							fi

							if (( $(sysctl net.ipv6.conf.lo.disable_ipv6 | grep -c "1") != 0 ))

								then

									sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0

								else

									skip

							fi

							if (( $(sysctl net.ipv6.conf.$wireless_interface.disable_ipv6 | grep -c "1") != 0 ))

								then

									sudo sysctl -w net.ipv6.conf.$wireless_interface.disable_ipv6=0

								else

									skip

							fi

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_changing_ipv6 = "1" ]

				then

					if (( $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) != 1 ))

						then

							echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

						else

							skip

					fi

					if [ $use_sysctl = "1" ]

						then

							if (( $(sysctl net.ipv6.conf.all.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

								else

									skip

							fi

							if (( $(sysctl net.ipv6.conf.default.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

								else

									skip

							fi

							if (( $(sysctl net.ipv6.conf.lo.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1

								else

									skip

							fi

							if (( $(sysctl net.ipv6.conf.$wireless_interface.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.$wireless_interface.disable_ipv6=1

								else

									skip

							fi

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing ipv6 statement (end) #

# function of daemon changing scsi hosts as native (start) #

function daemon.change_scsi_hosts()

{

	if on_ac_power;

		then

			if [ $use_changing_scsi = "1" ]

				then

					for (( s = 0; s < $number_of_scsi_host; s++ ))

					do

						if [ $(cat /sys/class/scsi_host/host$s/link_power_management_policy) != $ac_scsi_host ]

							then

								echo $ac_scsi_host > /sys/class/scsi_host/host$s/link_power_management_policy

							else

								skip

						fi

					done

				else

					skip

			fi

		else

			if [ $use_changing_scsi = "1" ]

				then

					for (( s = 0; s < $number_of_scsi_host; s++ ))

					do

						if [ $(cat /sys/class/scsi_host/host$s/link_power_management_policy) != $battery_scsi_host ]

							then

								echo $battery_scsi_host > /sys/class/scsi_host/host$s/link_power_management_policy

							else

								skip

						fi

					done

				else

					skip

			fi

	fi

}

# function of daemon changing scsi hosts as native (end) #

# function of daemon changing number of online cpu cores as native (start) #

total_number_of_cores="auto" # function's variable - do not change #

current_total_number_of_cores="auto" # function's variable - do not change #

function daemon.change_number_online_cores()

{

	if on_ac_power;

		then

			if [ $use_changing_online_cores = "1" ]

				then

					if [ $total_number_of_cores = "auto" ]

						then

							if [ $current_total_number_of_cores != $(nproc --all) ]

								then

									current_total_number_of_cores=$(nproc --all)

								else

									skip

							fi

						else

							if [ $current_total_number_of_cores != $total_number_of_cores ]

								then

									current_total_number_of_cores=$total_number_of_cores

								else

									skip

							fi

					fi

					if [ $ac_number_of_online_cores = "auto" ]

						then

							if [ $ac_number_of_online_cores != $current_total_number_of_cores ]

								then

									ac_number_of_online_cores=$current_total_number_of_cores

								else

									skip

							fi

							for (( c = 1; c < $ac_number_of_online_cores; c++ ))

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

									then

										echo 1 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

							for (( c = $ac_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

									then

										echo 0 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

						else

							for (( c = 1; c < $ac_number_of_online_cores; c++ ))

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

									then

										echo 1 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

							for (( c = $ac_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

									then

										echo 0 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

					fi

				else

					skip

			fi

		else

			if [ $use_changing_online_cores = "1" ]

				then

					if [ $total_number_of_cores = "auto" ]

						then

							if [ $current_total_number_of_cores != $(nproc --all) ]

								then

									current_total_number_of_cores=$(nproc --all)

								else

									skip

							fi

						else

							if [ $current_total_number_of_cores != $total_number_of_cores ]

								then

									current_total_number_of_cores=$total_number_of_cores

								else

									skip

							fi

					fi

					if [ $battery_number_of_online_cores = "auto" ]

						then

							if [ $battery_number_of_online_cores != $current_total_number_of_cores ]

								then

									battery_number_of_online_cores=$current_total_number_of_cores

								else

									skip

							fi

							for (( c = 1; c < $battery_number_of_online_cores; c++ ))

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

									then

										echo 1 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

							for (( c = $battery_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

									then

										echo 0 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

						else

							for (( c = 1; c < $battery_number_of_online_cores; c++ ))

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

									then

										echo 1 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

							for (( c = $battery_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

									then

										echo 0 > /sys/devices/system/cpu/cpu$c/online

									else

										skip

								fi

							done

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing number of online cpu cores as native (end) #

# function of daemon changing cpu cores governor as native (start) #

current_number_of_cores="auto" # function's variable - do not change #

function daemon.change_cpu_cores_governor()

{

	if on_ac_power;

		then

			if [ $use_changing_governor = "1" ]

				then

					if [ $number_of_cores = "auto" ]

						then

							if [ $current_number_of_cores != $(cat /proc/cpuinfo | grep -c "processor") ]

								then

									current_number_of_cores=$(cat /proc/cpuinfo | grep -c "processor")

								else

									skip

							fi

						else

							if [ $current_number_of_cores != $number_of_cores ]

								then

									current_number_of_cores=$number_of_cores

								else

									skip

							fi

					fi

					for (( c = 0; c < $current_number_of_cores; c++ ))

					do

						if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $ac_governor ]

							then

								echo $ac_governor > /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor

							else

								skip

						fi

					done

				else

					skip

			fi

		else

			if [ $use_changing_governor = "1" ]

				then

					if [ $number_of_cores = "auto" ]

						then

							if [ $current_number_of_cores != $(cat /proc/cpuinfo | grep -c "processor") ]

								then

									current_number_of_cores=$(cat /proc/cpuinfo | grep -c "processor")

								else

									skip

							fi

						else

							if [ $current_number_of_cores != $number_of_cores ]

								then

									current_number_of_cores=$number_of_cores

								else

									skip

							fi

					fi

					for (( c = 0; c < $current_number_of_cores; c++ ))

					do

						if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $battery_governor ]

							then

								echo $battery_governor > /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor

							else

								skip

						fi

					done

				else

					skip

			fi

	fi

}

# function of daemon changing cpu cores governor as native (end) #

# function of daemon changing cpu cores governor with cpufreq (start) #

function daemon.cpufreq.change_cpu_cores_governor()

{

	if on_ac_power;

		then

			if [ $use_changing_governor = "1" ] && [ $use_cpufreq = "1" ]

				then

					for (( c = 0; c < $current_number_of_cores; c++ ))

					do

						if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $ac_governor ]

							then

								sudo cpufreq-set -c $c -g $ac_governor

							else

								skip

						fi

					done

				else

					skip

			fi

		else

			if [ $use_changing_governor = "1" ] && [ $use_cpufreq = "1" ]

				then

					for (( c = 0; c < $current_number_of_cores; c++ ))

					do

						if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $battery_governor ]

							then

								sudo cpufreq-set -c $c -g $battery_governor

							else

								skip

						fi

					done

				else

					skip

			fi

	fi

}

# function of daemon changing cpu cores governor with cpufreq (end) #

# function of daemon changing pcie aspm parameters as native (start) #

function daemon.change_pcie_aspm()

{

	if on_ac_power;

		then

			if [ $use_changing_pcie = "1" ]

				then

					if (( $(cat /sys/module/pcie_aspm/parameters/policy | grep -c "performance") != "1" ))

						then

							echo performance > /sys/module/pcie_aspm/parameters/policy

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_changing_pcie = "1" ]

				then

					if (( $(cat /sys/module/pcie_aspm/parameters/policy | grep -c "powersave") != "1" ))

						then

							echo powersave > /sys/module/pcie_aspm/parameters/policy

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing pcie aspm parameters as native (end) #

# function of daemon changing hal polling statement as experimental native (start) #

function daemon.change_hal_polling()

{

	if on_ac_power;

		then

			if [ $use_hal_polling = "1" ]

				then

					sudo hal-disable-polling --enable-polling --device $hal_polling_device

				else

					skip

			fi

		else

			if [ $use_hal_polling = "1" ]

				then

					sudo hal-disable-polling --device $hal_polling_device

				else

					skip

			fi

	fi

}

# function of daemon changing hal polling statement as experimental native (end) #

# function of daemon changing wifi with rfkill (start) #

function daemon.rfkill.change_wifi()

{

	if on_ac_power;

		then

			if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $daemon_wifi = "1" ]

				then

					if (( $(rfkill list wifi | grep -c "yes") > "0" ))

						then

							sudo rfkill unblock wifi

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $daemon_wifi = "1" ]

				then

					if (( $(rfkill list wifi | grep -c "no") > "0" ))

						then

							sudo rfkill block wifi

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing wifi with rfkill (end) #

# function of daemon changing bluetooth with rfkill (start) #

function daemon.rfkill.change_bluetooth()

{

	if on_ac_power;

		then

			if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $daemon_bluetooth = "1" ]

				then

					if (( $(rfkill list bluetooth | grep -c "yes") > "0" ))

						then

							sudo rfkill unblock bluetooth

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $daemon_bluetooth = "1" ]

				then

					if (( $(rfkill list bluetooth | grep -c "no") > "0" ))

						then

							sudo rfkill block bluetooth

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing bluetooth with rfkill (end) #

# function of daemon changing power saving statements of hard disk with hdparm (start) #

function daemon.hdparm.change_power_saving()

{

	if on_ac_power;

		then

			if [ $use_hdparm = "1" ]

				then

					if (( $(sudo hdparm -B $hard_disk | grep -c "= off") != "1" ))

						then

							sudo hdparm -B 255 $hard_disk

						else

							skip

					fi

					if (( $(sudo hdparm -M $hard_disk | grep -c "= 254") != "1" ))

						then

							sudo hdparm -M 254 $hard_disk

						else

							skip

					fi

					if (( $(sudo hdparm -W $hard_disk | grep -c "on") != "1" ))

						then

							sudo hdparm -W 1 $hard_disk

						else

							skip

					fi

					if (( $(sudo hdparm -C $hard_disk | grep -c "active/idle") != "1" )) || (( $(sudo hdparm -C $hard_disk | grep -c "standby") != "1" ))

						then

							sudo hdparm -S 0 $hard_disk

						else

							skip

					fi

				else

					skip

			fi

		else

			if [ $use_hdparm = "1" ]

				then

					if (( $(sudo hdparm -B $hard_disk | grep -c "= 1") != "1" ))

						then

							sudo hdparm -B 1 $hard_disk

						else

							skip

					fi

					if (( $(sudo hdparm -M $hard_disk | grep -c "= 128") != "1" ))

						then

							sudo hdparm -M 128 $hard_disk

						else

							skip

					fi

					if (( $(sudo hdparm -W $hard_disk | grep -c "off") != "1" ))

						then

							sudo hdparm -W 0 $hard_disk

						else

							skip

					fi

					if (( $(sudo hdparm -C $hard_disk | grep -c "standby") != "1" ))

						then

							sudo hdparm -S 1 $hard_disk

						else

							skip

					fi

				else

					skip

			fi

	fi

}

# function of daemon changing power saving statements of hard disk with hdparm (end) #

#############################################
#                                           #
# Here is end point functions block of code #
#                                           #
#############################################

#############################################
#                                           #
# Here is start point oneshot block of code #
#                                           #
#############################################

if on_ac_power;

	then

		##############################################
		#                                            #
		# Here is start point block of code if on AC #
		#                                            #
		##############################################

		oneshot.change_brightness # oneshot change ac brightness as native #

		oneshot.rfkill.change_wifi # oneshot change ac wifi interface with rfkill #

		oneshot.rfkill.change_bluetooth # oneshot change ac bluetooth interface with rfkill #

		############################################
		#                                          #
		# Here is end point block of code if on AC #
		#                                          #
		############################################

	else

		###################################################
		#                                                 #
		# Here is start point block of code if on Battery #
		#                                                 #
		###################################################

		oneshot.change_brightness # oneshot change battery brightness as native #

		oneshot.rfkill.change_wifi # oneshot change battery wifi interface with rfkill #

		oneshot.rfkill.change_bluetooth # oneshot change battery bluetooth interface with rfkill #

		oneshot.systemd.use_samsung_tools # oneshot battery use samsung tools service with systemd #

		#################################################
		#                                               #
		# Here is end point block of code if on Battery #
		#                                               #
		#################################################

fi

###########################################
#                                         #
# Here is end point oneshot block of code #
#                                         #
###########################################

#################################
#                               #
# Here is start point of daemon #
#                               #
#################################

while [ $loop = "1" ]

do

	#######################################################
	#                                                     #
	# Here is start point of pre-anywayshot block of code #
	#                                                     #
	#######################################################

	pre_anywayshot.systemd.use_cpufreqd # pre-anywayshot use cpufreqd service with systemd #

	pre_anywayshot.systemd.stop_rc_local # pre-anywayshot stop rc-local service with systemd #

	pre_anywayshot.systemd.stop_avahi_daemon # pre-anywayshot stop avahi-daemon service with systemd #

	pre_anywayshot.systemd.stop_keyboard_setup # pre-anywayshot stop keyboard-setup service with systemd #

	pre_anywayshot.systemd.use_laptop_mode_tools # pre-anywayshot use laptop-mode-tools service with systemd #

	#####################################################
	#                                                   #
	# Here is end point of pre-anywayshot block of code #
	#                                                   #
	#####################################################

	if on_ac_power;

		then

			##############################################
			#                                            #
			# Here is start point block of code if on AC #
			#                                            #
			##############################################

			daemon.start_gtrayicon # daemon ac start tray indicator with gtrayicon #

			daemon.standalone.use_notify_send # daemon ac use send standalone notification with notify-send #

			daemon.change_laptop_mode # daemon ac change laptop mode setting as native #

			daemon.kernel.change_parameters # daemon ac change kernel parameters as native #

			daemon.change_brightness # daemon ac change brightness as native #

			daemon.change_fan_speed # daemon ac change fan speed as native #

			daemon.modprobe.change_camera # daemon ac change camera statement with modprobe #

			daemon.change_mc_power_savings # daemon ac change mc power savings as native #

			daemon.change_sched_smt_power_savings # daemon ac change sched smt power savings as native #

			daemon.iw.change_wifi_parameters # daemon ac change wifi parameters with iw #

			daemon.iwconfig.change_wifi_parameters # daemon ac change wifi parameters with iwconfig #

			daemon.change_ipv6 # daemon ac change ipv6 statement as unknown #

			daemon.change_scsi_hosts # daemon ac change scsi hosts as native #

			daemon.change_number_online_cores # daemon ac change number of online cpu cores as native #

			daemon.change_cpu_cores_governor # daemon ac change cpu cores governor as native #

			daemon.cpufreq.change_cpu_cores_governor # daemon ac change cpu cores governor with cpufreq #

			daemon.change_pcie_aspm # daemon ac change pcie aspm parameters as native #

			daemon.change_hal_polling # daemon ac change hal polling statement as experimental native #

			daemon.rfkill.change_wifi # daemon ac change wifi interface with rfkill #

			daemon.rfkill.change_bluetooth # daemon ac change bluetooth interface with rfkill #

			daemon.hdparm.change_power_saving # daemon ac change hard disk power saving statements with hdparm #

			############################################
			#                                          #
			# Here is end point block of code if on AC #
			#                                          #
			############################################

		else

			###################################################
			#                                                 #
			# Here is start point block of code if on Battery #
			#                                                 #
			###################################################

			# autosuspend feature if battery percentage less than your minimum (start) #

			if [ $use_systemd = "1" ] && [ $use_autosuspend = "1" ] && (( $(cat $path_battery_percentage) < $min_battery_percentage ))

				then

					daemon.battery.suspend # daemon battery suspend function (changeable) #

				else

			# autosuspend feature if battery percentage less than your minimum (end) #

					daemon.start_gtrayicon # daemon battery start tray indicator with gtrayicon #

					daemon.standalone.use_notify_send # daemon battery use send standalone notification with notify-send #

					daemon.battery.use_samsung_tools # daemon battery use samsung-tools service with systemd #

					daemon.battery.use_powertop # daemon battery use powertop #

					daemon.change_laptop_mode # daemon battery change laptop mode setting as native #

					daemon.kernel.change_parameters # daemon battery change kernel parameters as native #

					daemon.change_brightness # daemon battery change brightness as native #

					daemon.change_fan_speed # daemon battery change fan speed as native #

					daemon.modprobe.change_camera # daemon battery change camera statement with modprobe #

					daemon.change_mc_power_savings # daemon battery change mc power savings as native #

					daemon.change_sched_smt_power_savings # daemon battery change sched smt power savings as native #

					daemon.iw.change_wifi_parameters # daemon battery change wifi parameters with iw #

					daemon.iwconfig.change_wifi_parameters # daemon battery change wifi parameters with iwconfig #

					daemon.change_ipv6 # daemon battery change ipv6 statement as unknown #

					daemon.change_scsi_hosts # daemon battery change scsi hosts as native #

					daemon.change_number_online_cores # daemon battery change number of online cpu cores as native #

					daemon.change_cpu_cores_governor # daemon battery change cpu cores governor as native #

					daemon.cpufreq.change_cpu_cores_governor # daemon battery change cpu cores governor with cpufreq #

					daemon.change_pcie_aspm # daemon battery change pcie aspm parameters as native #

					daemon.change_hal_polling # daemon battery change hal polling statement as experimental native #

					daemon.rfkill.change_wifi # daemon battery change wifi interface with rfkill #

					daemon.rfkill.change_bluetooth # daemon battery change bluetooth interface with rfkill #

					daemon.hdparm.change_power_saving # daemon battery change hard disk power saving statements with hdparm #

			fi

			#################################################
			#                                               #
			# Here is end point block of code if on Battery #
			#                                               #
			#################################################

	fi

	########################################################
	#                                                      #
	# Here is start point of post-anywayshot block of code #
	#                                                      #
	########################################################

	longwait # function of time polling #

	post_anywayshot.systemd.stop_setvtrgb # post-anywayshot stop setvtrgb service with systemd #

	post_anywayshot.systemd.stop_colord # post-anywayshot stop colord service with systemd #

	post_anywayshot.systemd.stop_preload # post-anywayshot stop preload service with systemd #

	post_anywayshot.systemd.stop_ntp # post-anywayshot stop ntp service with systemd #

	######################################################
	#                                                    #
	# Here is end point of post-anywayshot block of code #
	#                                                    #
	######################################################

done

###############################
#                             #
# Here is end point of daemon #
#                             #
###############################

