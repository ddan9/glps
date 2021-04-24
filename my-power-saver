#!/bin/bash

##############################################
#                                            #
# Here is preload and settings block of code #
#                                            #
##############################################

# daemon settings

loop="1"

skip="sleep 0"

longwait="sleep 600"

# daemon settings

use_changing_brightness="1"

	oneshot_brightness="1"

	daemon_brightness="0"

	path_brightness="/sys/class/backlight/intel_backlight/brightness"

	ac_brightness="12421"

	battery_brightness="0"

use_gtrayicon="1"

	gtrayicon_ac_icon="/usr/share/icons/gnome/scalable/emotes/face-devilish-symbolic.svg"

	gtrayicon_battery_icon="/usr/share/icons/gnome/scalable/emotes/face-angel-symbolic.svg"

use_notify_send="1"

	use_notify_send_standalone="0"

	use_notify_send_with_gtrayicon="1"

use_changing_kernel_params="1"

use_changing_fan="1"

	fan_changing_path="/sys/devices/platform/samsung/performance_level"

	fan_ac_speed="overclock"

	fan_battery_speed="silent"

use_powertop="1"

use_modprobe="1"

	use_changing_camera="1"

use_wireless_powersaving="1"

	wireless_interface="wlp5s0"

	use_iw_pm="0"

	use_iw_txpower="1"

		iw_ac_txpower="16"

			iw_set_ac_txpower="auto"

		iw_battery_txpower="1"

			iw_set_battery_txpower="limit 100"

	use_iwconfig_pm="0"

	use_iwconfig_txpower="1"

		iwconfig_ac_txpower="16"

			iwconfig_set_ac_txpower="auto"

		iwconfig_battery_txpower="1"

			iwconfig_set_battery_txpower="1"

use_smt_power_saving="0"

use_mc_power_saving="0"

use_rfkill="1"

	use_changing_wifi="1"

		oneshot_wifi="1"

		daemon_wifi="0"

	use_changing_bluetooth="1"

		oneshot_bluetooth="1"

		daemon_bluetooth="1"

use_changing_ipv6="1"

	use_sysctl="1"

use_changing_scsi="1"

	number_of_scsi_host="4"

	ac_scsi_host="max_performance"

	battery_scsi_host="min_power"

use_changing_online_cores="1"

	battery_number_of_online_cores="2"

	ac_number_of_online_cores="auto"

	total_number_of_cores="auto" # function's variable - do not change

	current_total_number_of_cores="auto" # function's variable - do not change

use_changing_governor="1"

	use_cpufreq="1"

	number_of_cores="auto"

	battery_governor="ondemand"

	ac_governor="performance"

	current_number_of_cores="auto" # function's variable - do not change

use_changing_pcie="1"

use_hdparm="1"

	hard_disk="/dev/sda"

use_hal_polling="0"

	hal_polling_device="/dev/cdrom"

use_systemd="1"

	use_laptop_mode_tools="1"

		ac_laptop_mode="0"

		battery_laptop_mode="5"

	use_cpufreqd="1"

	use_samsung_tools="1"

		oneshot_samsung_tools="1"

		daemon_samsung_tools="0"

	use_autosuspend="1"

		path_battery_percentage="/sys/class/power_supply/BAT1/capacity"

		min_battery_percentage="5"

	stop_setvtrgb="1"

	stop_rclocal="1"

	stop_colord="1"

	stop_keyboardsetup="1"

	stop_preload="1"

	stop_avahidaemon="1"

	stop_ntp="1"

########################################################
#                                                      #
# Here is end point preload and settings block of code #
#                                                      #
########################################################

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

	# start changing ac brightness #

	if [ $use_changing_brightness = "1" ] && [ $oneshot_brightness = "1" ]

		then

			if (( $(cat $path_brightness) < $ac_brightness ))

				then

					echo $ac_brightness > $path_brightness

				else

					$skip

			fi

		else

			$skip

	fi

	# stop changing ac brightness #

	# start unblock wifi using rfkill #

	if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $oneshot_wifi = "1" ]

		then

			if (( $(rfkill list wifi | grep -c "yes") > "0" ))

				then

					sudo rfkill unblock wifi

				else

					$skip

			fi

		else

			$skip

	fi

	# stop unblock wifi using rfkill #

	# start unblock bluetooth using rfkill #

	if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $oneshot_bluetooth = "1" ]

		then

			if (( $(rfkill list bluetooth | grep -c "yes") > "0" ))

				then

					sudo rfkill unblock bluetooth

				else

					$skip

			fi

		else

			$skip

	fi

	# stop unblock bluetooth using rfkill #

	# start you can put something here #

	if [ $use_systemd = "1" ]

		then

			$skip

		else

			$skip

	fi

	# end you can put something here #

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

	# start changing battery brightness #

	if [ $use_changing_brightness = "1" ] && [ $oneshot_brightness = "1" ]

		then

			if (( $(cat $path_brightness) > $battery_brightness ))

				then

					echo $battery_brightness > $path_brightness

				else

					$skip

			fi

		else

			$skip

	fi

	# stop changing battery brightness #

	# start block wifi using rfkill #

	if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $oneshot_wifi = "1" ]

		then

			if (( $(rfkill list wifi | grep -c "no") > "0" ))

				then

					sudo rfkill block wifi

				else

					$skip

			fi

		else

			$skip

	fi

	# stop block wifi using rfkill #

	# start block bluetooth using rfkill #

	if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $oneshot_bluetooth = "1" ]

		then

			if (( $(rfkill list bluetooth | grep -c "no") > "0" ))

				then

					sudo rfkill block bluetooth

				else

					$skip

			fi

		else

			$skip

	fi

	# stop block bluetooth using rfkill #

	if [ $use_systemd = "1" ]

		then

			# start samsung-tools service #

			if [ $use_samsung_tools = "1" ] && [ $oneshot_samsung_tools = "1" ]

				then

					if [[ $(systemctl status samsung-tools.service | grep -c disabled) != "1" ]]

						then

							sudo systemctl disable samsung-tools.service

						else

							$skip

					fi

					if [[ $(systemctl status samsung-tools.service | grep -c inactive) = "1" ]]

						then

							sudo systemctl start samsung-tools.service

						else

							$skip

					fi

				else

					$skip

			fi

			# end of start samsung-tools service #

		else

			$skip

	fi

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

	if [ $use_systemd = "1" ]

		then

			# start use cpufreqd #

			if [ $use_cpufreqd = "1" ]

				then

					if [[ $(systemctl status cpufreqd.service | grep -c disabled) != "1" ]]

						then

							sudo systemctl disable cpufreqd.service

						else

							$skip

					fi

					if [[ $(systemctl status cpufreqd.service | grep -c inactive) = "1" ]]

						then

							sudo systemctl start cpufreqd.service

						else

							$skip

					fi

					if [[ $(systemctl status cpufreqd.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl stop cpufreqd.service

						else

							$skip

					fi

				else

					$skip

			fi

			# stop use cpufreqd #

			# stop rc-local service #

			if [ $stop_rclocal = "1" ] && [ $(systemctl status rc-local.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop rc-local.service

				else

					$skip

			fi

			# end of stop rc-local service #

			# stop avahi-daemon service #

			if [ $stop_avahidaemon = "1" ] && [ $(systemctl status avahi-daemon.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop avahi-daemon.service

				else

					$skip

			fi

			# end of stop avahi-daemon service #

			# stop avahi-daemon socket #

			if [ $stop_avahidaemon = "1" ] && [ $(systemctl status avahi-daemon.socket | grep -c inactive) != "1" ]

				then

					sudo systemctl stop avahi-daemon.socket

				else

					$skip

			fi

			# end of stop avahi-daemon socket #

			# stop keyboard-setup service #

			if [ $stop_keyboardsetup = "1" ] && [ $(systemctl status keyboard-setup.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop keyboard-setup.service

				else

					$skip

			fi

			# end of stop keyboard-setup service #

			# start use laptop-mode tools

			if [ $use_laptop_mode_tools = "1" ]

				then

					if [[ $(systemctl status laptop-mode.timer | grep -c disabled) != "1" ]]

						then

							sudo systemctl disable laptop-mode.timer

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.service | grep -c "disabled;") != "1" ]]

						then

							sudo systemctl disable laptop-mode.service

						else

							$skip

					fi

					if [[ $(systemctl status lmt-poll.service | grep -c disabled) != "1" ]]

						then

							sudo systemctl disable lmt-poll.service

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.timer | grep -c inactive) = "1" ]]

						then

							sudo systemctl start laptop-mode.timer

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.service | grep -c inactive) = "1" ]]

						then

							sudo systemctl start laptop-mode.service

						else

							$skip

					fi

					if [[ $(systemctl status lmt-poll.service | grep -c inactive) = "1" ]]

						then

							sudo systemctl start lmt-poll.service

						else

							$skip

					fi

					if on_ac_power;

						then

							if (( $(cat /proc/sys/vm/laptop_mode) != $ac_laptop_mode ))

								then

									echo $ac_laptop_mode > /proc/sys/vm/laptop_mode

								else

									$skip

							fi

						else

							if (( $(cat /proc/sys/vm/laptop_mode) != $battery_laptop_mode ))

								then

									echo $battery_laptop_mode > /proc/sys/vm/laptop_mode

								else

									$skip

							fi

					fi

					if [[ $(systemctl status laptop-mode.timer | grep -c inactive) != "1" ]]

						then

							sudo systemctl restart laptop-mode.timer

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl restart laptop-mode.service

						else

							$skip

					fi

					if [[ $(systemctl status lmt-poll.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl restart lmt-poll.service

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl reload laptop-mode.service

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.timer | grep -c inactive) != "1" ]]

						then

							sudo systemctl stop laptop-mode.timer

						else

							$skip

					fi

					if [[ $(systemctl status lmt-poll.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl stop lmt-poll.service

						else

							$skip

					fi

					if [[ $(systemctl status laptop-mode.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl stop laptop-mode.service

						else

							$skip

					fi

				else

					$skip

			fi

			# stop use laptop-mode-tools

		else

			$skip

	fi

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

		# start of use performance tray indicator

		if [ $use_gtrayicon = "1" ]

			then

				if [[ $(pgrep -f -c "GLPS-Daemon: performance") != "0" ]] && [[ $(pgrep -f -c "GLPS-Daemon: powersave") = "0" ]]

					then

						$skip 

					else

						if [[ $(pgrep -f -c "GLPS-Daemon: powersave") != "0" ]]

							then

								kill $(pgrep -f "GLPS-Daemon: powersave")
					
							else

								$skip

						fi

						if [[ $(pgrep -f -c "GLPS-Daemon: performance") != "0" ]]

							then

								$skip

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

										$skip

								fi

						fi

				fi

			else

				$skip

		fi

		# end of use performance tray indicator

		# start of performance notification send

		if [ $use_notify_send = "1" ] && [ $use_notify_send_standalone = "1" ]

			then

				export DISPLAY=:0

				export DISPLAY=:0.0

				su $(who -q | grep -v =) -c 'DISPLAY=:0.0 notify-send -i daemon "GPLS-Daemon" "Set performance settings"'

			else

				$skip

		fi

		# end of performance notification send

		# start changing laptop-mode setting #

		if [ $use_laptop_mode_tools = "1" ]

			then

				if (( $(cat /proc/sys/vm/laptop_mode) != $ac_laptop_mode ))

					then

						echo $ac_laptop_mode > /proc/sys/vm/laptop_mode

					else

						$skip

				fi

			else

				$skip

		fi

		# stop changing laptop-mode setting #

		# start changing kernel params for ac #

		if [ $use_changing_kernel_params = "1" ]

			then

				if (( $(cat /proc/sys/vm/dirty_ratio) != 10 ))

					then

						echo 10 > /proc/sys/vm/dirty_ratio

					else

						$skip

				fi

				if (( $(cat /proc/sys/vm/dirty_background_ratio) != 5 ))

					then

						echo 5 > /proc/sys/vm/dirty_background_ratio

					else

						$skip

				fi

				if (( $(cat /proc/sys/vm/dirty_expire_centisecs) != 1000 ))

					then

						echo 1000 > /proc/sys/vm/dirty_expire_centisecs

					else

						$skip

				fi

				if (( $(cat /proc/sys/vm/dirty_writeback_centisecs) != 1000 ))

					then

						echo 1000 > /proc/sys/vm/dirty_writeback_centisecs

					else

						$skip

				fi

				if (( $(cat /sys/module/snd_hda_intel/parameters/power_save) != 0 ))

					then

						echo 0 > /sys/module/snd_hda_intel/parameters/power_save

					else

						$skip

				fi

			else

				$skip

		fi

		# stop changing kernel params for ac #

		# start changing ac brightness #

		if [ $use_changing_brightness = "1" ] && [ $daemon_brightness = "1" ]

			then

				if (( $(cat $path_brightness) < $ac_brightness ))

					then

						echo $ac_brightness > $path_brightness

					else

						$skip

				fi

			else

				$skip

		fi

		# stop changing ac brightness #

		# start changings manual fan speed for performance

		if [[ $use_changing_fan = "1" ]]

			then

				if [[ $(cat $fan_changing_path) != $fan_ac_speed ]]

					then

						echo $fan_ac_speed > $fan_changing_path

					else

						$skip

				fi

			else

				$skip

		fi

		# stop changing manual fan speed for performance

		# start enable camera with modprobe #

		if [ $use_modprobe = "1" ]

			then

				if [ $use_changing_camera = "1" ] && [ $(ls /dev/ | grep -c "video") = "0" ]

					then

						sudo modprobe uvcvideo

					else

						$skip

				fi

			else

				$skip

		fi

		# stop enable camera with modprobe #

		# disable mc power saving #

		if [ $use_mc_power_saving = "1" ]

			then

				if [[ $(cat /sys/devices/system/cpu/sched_mc_power_savings) != "0" ]]

					then

						echo 0 > /sys/devices/system/cpu/sched_mc_power_savings

					else

						$skip

				fi

			else

				$skip

		fi

		# end of disable mc power saving #

		# disable smt power saving #

		if [ $use_smt_power_saving = "1" ]

			then

				if [[ $(cat /sys/devices/system/cpu/sched_smt_power_savings) != "0" ]]

					then

						echo 0 > /sys/devices/system/cpu/sched_smt_power_savings

					else

						$skip

				fi

			else

				$skip

		fi

		# end of disable smt power saving #

		if [ $use_wireless_powersaving = "1" ]

			then

				# disable power management in iw dev #

				if [ $use_iw_pm = "1" ]

					then

						if (( $(iw dev $wireless_interface get power_save | grep -c "off") != 1 ))

							then

								sudo iw dev $wireless_interface set power_save off

							else

								$skip

						fi

					else

						$skip

				fi

				if [ $use_iw_txpower = "1" ] && (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power:off") != "1" ))

					then

						if (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power=$iw_ac_txpower") != "1" ))

							then

								sudo iw dev $wireless_interface set txpower $iw_set_ac_txpower

							else

								$skip

						fi

					else

						$skip

				fi

				# end of disable power management in iw dev #

				# disable power management in iwconfig #

				if [ $use_iwconfig_pm = "1" ]

					then

						if (( $(iwconfig $wireless_interface | grep -c "Power Management:off") != 1 ))

							then

								sudo iwconfig $wireless_interface power off

							else

								$skip

						fi

					else

						$skip

				fi

				if [ $use_iwconfig_txpower = "1" ] && (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=off") != "1" ))

					then

						if (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=$iwconfig_ac_txpower") != "1" ))

							then

								sudo iwconfig $wireless_interface txpower $iwconfig_set_ac_txpower

							else

								$skip

						fi

					else

						$skip

				fi

				# end of disable power management in iwconfig #

			else

				$skip

		fi

		# start enabling ipv6 #

		if [ $use_changing_ipv6 = "1" ]

			then

				if (( $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) != 0 ))

					then

						echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6

					else

						$skip

				fi

				if [ $use_sysctl = "1" ]

					then

						if (( $(sysctl net.ipv6.conf.all.disable_ipv6 | grep -c "1") != 0 ))

							then

								sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0

							else

								$skip

						fi

						if (( $(sysctl net.ipv6.conf.default.disable_ipv6 | grep -c "1") != 0 ))

							then

								sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0

							else

								$skip

						fi

						if (( $(sysctl net.ipv6.conf.lo.disable_ipv6 | grep -c "1") != 0 ))

							then

								sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0

							else

								$skip

						fi

						if (( $(sysctl net.ipv6.conf.$wireless_interface.disable_ipv6 | grep -c "1") != 0 ))

							then

								sudo sysctl -w net.ipv6.conf.$wireless_interface.disable_ipv6=0

							else

								$skip

						fi

					else

						$skip

				fi

			else

				$skip

		fi

		# stop enabling ipv6 #

		# start changing scsi ac power #

		if [ $use_changing_scsi = "1" ]

			then

				for (( s = 0; s < $number_of_scsi_host; s++ ))

				do

					if [ $(cat /sys/class/scsi_host/host$s/link_power_management_policy) != $ac_scsi_host ]

						then

							echo $ac_scsi_host > /sys/class/scsi_host/host$s/link_power_management_policy

						else

							$skip

					fi

				done

			else

				$skip

		fi

		# stop changing scsi ac power #

		# start changing ac online cpu cores

		if [ $use_changing_online_cores = "1" ] 

			then

				if [ $total_number_of_cores = "auto" ]

					then

						if [ $current_total_number_of_cores != $(nproc --all) ]

							then

								current_total_number_of_cores=$(nproc --all)

							else

								$skip

						fi

					else

						if [ $current_total_number_of_cores != $total_number_of_cores ]

							then

								current_total_number_of_cores=$total_number_of_cores

							else

								$skip

						fi

				fi

				if [ $ac_number_of_online_cores = "auto" ]

					then

						if [ $ac_number_of_online_cores != $current_total_number_of_cores ]

							then

								ac_number_of_online_cores=$current_total_number_of_cores

							else

								$skip

						fi

						for (( c = 1; c < $ac_number_of_online_cores; c++ ))

						do

							if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

								then

									echo 1 > /sys/devices/system/cpu/cpu$c/online

								else

									$skip

							fi

						done

						for (( c = $ac_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

						do

							if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

								then

									echo 0 > /sys/devices/system/cpu/cpu$c/online

								else

									$skip

							fi

						done

					else

						for (( c = 1; c < $ac_number_of_online_cores; c++ ))

						do

							if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

								then

									echo 1 > /sys/devices/system/cpu/cpu$c/online

								else

									$skip

							fi

						done

						for (( c = $ac_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

						do

							if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

								then

									echo 0 > /sys/devices/system/cpu/cpu$c/online 

								else

									$skip

							fi

						done

				fi

			else

				$skip

		fi

		# stop changing ac online cpu cores

		# start changing ac governor #

		if [ $use_changing_governor = "1" ]

			then

				if [ $number_of_cores = "auto" ]

					then

						if [ $current_number_of_cores != $(cat /proc/cpuinfo | grep -c "processor") ]

							then

								current_number_of_cores=$(cat /proc/cpuinfo | grep -c "processor")

							else

								$skip

						fi

					else

						if [ $current_number_of_cores != $number_of_cores ]

							then

								current_number_of_cores=$number_of_cores

							else

								$skip

						fi

				fi

				for (( c = 0; c < $current_number_of_cores; c++ ))

				do

					if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $ac_governor ]

						then

							echo $ac_governor > /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor

						else

							$skip

					fi

				done

			else

				$skip

		fi

		# stop changing ac governor #

		# start changing ac governor in cpufreq-set #

		if [ $use_changing_governor = "1" ] && [ $use_cpufreq = "1" ]

			then

				for (( c = 0; c < $current_number_of_cores; c++ ))

				do

					if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $ac_governor ]

						then

							sudo cpufreq-set -c $c -g $ac_governor

						else

							$skip

					fi

				done

			else

				$skip

		fi

		# stop changing ac governor in cpufreq-set #

		# start changing pcie aspm policy on ac #

		if [ $use_changing_pcie = "1" ]

			then

				if (( $(cat /sys/module/pcie_aspm/parameters/policy | grep -c "performance") != "1" ))

					then

						echo performance > /sys/module/pcie_aspm/parameters/policy

					else

						$skip

				fi

			else

				$skip

		fi

		# stop changing pcie aspm policy on ac #

		# start enable hal polling on device (experimental function) #

		if [ $use_hal_polling = "1" ]

			then

				sudo hal-disable-polling --enable-polling --device $hal_polling_device

			else

				$skip

		fi

		# stop enable hal polling on device (experimental function) #

		# start unblock wifi using rfkill #

		if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $daemon_wifi = "1" ]

			then

				if (( $(rfkill list wifi | grep -c "yes") > "0" ))

					then

						sudo rfkill unblock wifi

					else

						$skip

				fi

			else

				$skip

		fi

		# stop unblock wifi using rfkill #

		# start unblock bluetooth using rfkill #

		if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $daemon_bluetooth = "1" ]

			then

				if (( $(rfkill list bluetooth | grep -c "yes") > "0" ))

					then

						sudo rfkill unblock bluetooth

					else

						$skip

				fi

			else

				$skip

		fi

		# stop unblock bluetooth using rfkill #

		# start disable power saving with hdparm #

		if [ $use_hdparm = "1" ]

			then

				if (( $(sudo hdparm -B $hard_disk | grep -c "= off") != "1" ))

					then

						sudo hdparm -B 255 $hard_disk

					else

						$skip

				fi

				if (( $(sudo hdparm -M $hard_disk | grep -c "= 254") != "1" ))

					then

						sudo hdparm -M 254 $hard_disk

					else

						$skip

				fi

				if (( $(sudo hdparm -W $hard_disk | grep -c "on") != "1" ))

					then

						sudo hdparm -W 1 $hard_disk

					else

						$skip

				fi

				if (( $(sudo hdparm -C $hard_disk | grep -c "active/idle") != "1" )) || (( $(sudo hdparm -C $hard_disk | grep -c "standby") != "1" ))

					then

						sudo hdparm -S 0 $hard_disk

					else

						$skip

				fi

			else

				$skip

		fi

		# stop disable power saving with hdparm #

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

		# start of autosuspend feature if battery percentage less than your minimum #

		if [ $use_systemd = "1" ] && [ $use_autosuspend = "1" ] && (( $(cat $path_battery_percentage) < $min_battery_percentage ))

		then

			sudo systemctl suspend

		else

		# end of autosuspend feature if battery percentage less than your minimum #

			# start use powersave gtrayicon

			if [ $use_gtrayicon = "1" ]

				then

					if [[ $(pgrep -f -c "GLPS-Daemon: powersave") != "0" ]] && [[ $(pgrep -f -c "GLPS-Daemon: performance") = "0" ]]

						then

							$skip 

						else

							if [[ $(pgrep -f -c "GLPS-Daemon: performance") != "0" ]]

								then

									kill $(pgrep -f "GLPS-Daemon: performance")
							
								else

									$skip

							fi

							if [[ $(pgrep -f -c "GLPS-Daemon: powersave") != "0" ]]

								then

									$skip

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

											$skip

									fi

							fi

					fi

				else

					$skip

			fi

			# end use powersave gtrayicon

			# start of powersave notification send

			if [ $use_notify_send = "1" ] && [ $use_notify_send_standalone = "1" ]

				then

					export DISPLAY=:0

					export DISPLAY=:0.0

					su $(who -q | grep -v =) -c 'DISPLAY=:0.0 notify-send -i daemon "GPLS-Daemon" "Set powersave settings"'

				else

					$skip

			fi

			# end of powersave notification send

			# start samsung-tools service #

			if [ $use_samsung_tools = "1" ] && [ $daemon_samsung_tools = "1" ]

				then

					if [[ $(systemctl status samsung-tools.service | grep -c disabled) != "1" ]]

						then

							sudo systemctl disable samsung-tools.service

						else

							$skip

					fi

					if [[ $(systemctl status samsung-tools.service | grep -c inactive) = "1" ]]

						then

							sudo systemctl start samsung-tools.service

						else

							$skip

					fi

					if [[ $(systemctl status samsung-tools.service | grep -c inactive) != "1" ]]

						then

							sudo systemctl stop samsung-tools.service

						else

							$skip

					fi

				else

					$skip

			fi

			# end of start samsung-tools service #

			# start use powertop #

			if [ $use_powertop = "1" ]

				then

					sudo powertop -q --auto-tune

				else

					$skip

			fi

			# stop use powertop #

			# start changing laptop-mode setting #

			if [ $use_laptop_mode_tools = "1" ]

				then

					if (( $(cat /proc/sys/vm/laptop_mode) != $battery_laptop_mode ))

						then

							echo $battery_laptop_mode > /proc/sys/vm/laptop_mode

						else

							$skip

					fi

				else

					$skip

			fi

			# stop changing laptop-mode setting #

			# start changing kernel params for ac #

			if [ $use_changing_kernel_params = "1" ]

				then

					if (( $(cat /proc/sys/vm/dirty_ratio) != 90 ))

						then

							echo 90 > /proc/sys/vm/dirty_ratio

						else

							$skip

					fi

					if (( $(cat /proc/sys/vm/dirty_background_ratio) != 1 ))

						then

							echo 1 > /proc/sys/vm/dirty_background_ratio

						else

							$skip

					fi

					if (( $(cat /proc/sys/vm/dirty_expire_centisecs) != 60000 ))

						then

							echo 60000 > /proc/sys/vm/dirty_expire_centisecs

						else

							$skip

					fi

					if (( $(cat /proc/sys/vm/dirty_writeback_centisecs) != 60000 ))

						then

							echo 60000 > /proc/sys/vm/dirty_writeback_centisecs

						else

							$skip

					fi

					if (( $(cat /sys/module/snd_hda_intel/parameters/power_save) != 1 ))

						then

							echo 1 > /sys/module/snd_hda_intel/parameters/power_save

						else

							$skip

					fi

				else

					$skip

			fi

			# stop changing kernel params for ac #

			# start changing battery brightness #

			if [ $use_changing_brightness = "1" ] && [ $daemon_brightness = "1" ]

				then

					if (( $(cat $path_brightness) > $battery_brightness ))

						then

							echo $battery_brightness > $path_brightness

						else

							$skip

					fi

				else

					$skip

			fi

			# stop changing battery brightness #

			# start changings manual fan speed for powersave

			if [[ $use_changing_fan = "1" ]]

				then

					if [[ $(cat $fan_changing_path) != $fan_battery_speed ]]

						then

							echo $fan_battery_speed > $fan_changing_path

						else

							$skip

					fi

				else

					$skip
			
			fi

			# stop changing manual fan speed for powersave

			# start disable camera with modprobe #

			if [ $use_modprobe = "1" ]

				then

					if [ $use_changing_camera = "1" ] && [ $(ls /dev/ | grep -c "video") != 0 ]

						then

							sudo modprobe -r uvcvideo

						else

							$skip

					fi

				else

					$skip

			fi

			# stop disable camera with modprobe #

			# enable mc power saving #

			if [ $use_mc_power_saving = "1" ]

				then

					if [[ $(cat /sys/devices/system/cpu/sched_mc_power_savings) != "1" ]]

						then

							echo 1 > /sys/devices/system/cpu/sched_mc_power_savings

						else

							$skip

					fi

				else

					$skip

			fi

			# end of enable mc power saving #

			# enable smt power saving #

			if [ $use_smt_power_saving = "1" ]

				then

					if [[ $(cat /sys/devices/system/cpu/sched_smt_power_savings) != "1" ]]

						then

							echo 1 > /sys/devices/system/cpu/sched_smt_power_savings

						else

							$skip

					fi

				else

					$skip

			fi

			# end of enable smt power saving #

			if [ $use_wireless_powersaving = "1" ]

				then

					# enable power management in iw dev #

					if [ $use_iw_pm = "1" ]

						then

							if (( $(iw dev $wireless_interface get power_save | grep -c "on") != 1 ))

								then

									sudo iw dev $wireless_interface set power_save on

								else

									$skip

							fi

						else

							$skip

					fi

					if [ $use_iw_txpower = "1" ] && (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power:off") != "1" ))

						then

							if (( $(sudo iwlist $wireless_interface txpower | grep -c "Tx-Power=$iw_battery_txpower") != "1" ))

								then

									sudo iw dev $wireless_interface set txpower $iw_set_battery_txpower

								else

									$skip

							fi

						else

							$skip

					fi

					# end of enable power management in iw dev #

					# enable power management in iwconfig #

					if [ $use_iwconfig_pm = "1" ]

						then

							if (( $(iwconfig $wireless_interface | grep -c "Power Management:on") != 1 ))

								then

									sudo iwconfig $wireless_interface power on

								else

									$skip

							fi

						else

							$skip

					fi

					if [ $use_iwconfig_txpower = "1" ] && (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=off") != "1" ))

						then

							if (( $(sudo iwconfig $wireless_interface | grep -c "Tx-Power=$iwconfig_battery_txpower") != "1" ))

								then

									sudo iwconfig $wireless_interface txpower $iwconfig_set_battery_txpower

								else

									$skip

							fi

						else

							$skip

					fi

					# end of enable power management in iwconfig #

				else

					$skip

			fi

			# start disabling ipv6 #

			if [ $use_changing_ipv6 = "1" ]

				then

					if (( $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) != 1 ))

						then

							echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

						else

							$skip

					fi

					if [ $use_sysctl = "1" ]

						then

							if (( $(sysctl net.ipv6.conf.all.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

								else

									$skip

							fi

							if (( $(sysctl net.ipv6.conf.default.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

								else

									$skip

							fi

							if (( $(sysctl net.ipv6.conf.lo.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1

								else

									$skip

							fi

							if (( $(sysctl net.ipv6.conf.$wireless_interface.disable_ipv6 | grep -c "1") != 1 ))

								then

									sudo sysctl -w net.ipv6.conf.$wireless_interface.disable_ipv6=1

								else

									$skip

							fi

						else

							$skip

					fi

				else

					$skip

			fi

			# stop disabling ipv6 #

			# start changing scsi battery power #

			if [ $use_changing_scsi = "1" ]

				then

					for (( s = 0; s < $number_of_scsi_host; s++ ))

					do

						if [ $(cat /sys/class/scsi_host/host$s/link_power_management_policy) != $battery_scsi_host ]

							then

								echo $battery_scsi_host > /sys/class/scsi_host/host$s/link_power_management_policy

							else

								$skip

						fi

					done

				else

					$skip

			fi

			# stop changing scsi battery power #

			# start changing battery online cpu cores

			if [ $use_changing_online_cores = "1" ] 

				then

					if [ $total_number_of_cores = "auto" ]

						then

							if [ $current_total_number_of_cores != $(nproc --all) ]

								then

									current_total_number_of_cores=$(nproc --all)

								else

									$skip

							fi

						else

							if [ $current_total_number_of_cores != $total_number_of_cores ]

								then

									current_total_number_of_cores=$total_number_of_cores

								else

									$skip

							fi

					fi

					if [ $battery_number_of_online_cores = "auto" ]

						then

							if [ $battery_number_of_online_cores != $current_total_number_of_cores ]

								then

									battery_number_of_online_cores=$current_total_number_of_cores

								else

									$skip

							fi

							for (( c = 1; c < $battery_number_of_online_cores; c++ ))

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

									then

										echo 1 > /sys/devices/system/cpu/cpu$c/online

									else

										$skip

								fi

							done

							for (( c = $battery_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

									then

										echo 0 > /sys/devices/system/cpu/cpu$c/online

									else

										$skip

								fi

							done

						else

							for (( c = 1; c < $battery_number_of_online_cores; c++ ))

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "1" ]

									then

										echo 1 > /sys/devices/system/cpu/cpu$c/online 

									else

										$skip

								fi

							done

							for (( c = $battery_number_of_online_cores; c < $current_total_number_of_cores; c++ ))						

							do

								if [ $(cat /sys/devices/system/cpu/cpu$c/online) != "0" ]

									then

										echo 0 > /sys/devices/system/cpu/cpu$c/online 

									else

										$skip

								fi

							done

					fi

				else

					$skip

			fi

			# stop changing battery online cpu cores

			# start changing battery governor #

			if [ $use_changing_governor = "1" ]

				then

					if [ $number_of_cores = "auto" ]

						then

							if [ $current_number_of_cores != $(cat /proc/cpuinfo | grep -c "processor") ]

								then

									current_number_of_cores=$(cat /proc/cpuinfo | grep -c "processor")

								else

									$skip

							fi

						else

							if [ $current_number_of_cores != $number_of_cores ]

								then

									current_number_of_cores=$number_of_cores

								else

									$skip

							fi

					fi

					for (( c = 0; c < $current_number_of_cores; c++ ))

					do

						if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $battery_governor ]

							then

								echo $battery_governor > /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor

							else

								$skip

						fi

					done

				else

					$skip

			fi

			# stop changing battery governor #

			# start changing battery governor in cpufreq-set #

			if [ $use_changing_governor = "1" ] && [ $use_cpufreq = "1" ]

				then

					for (( c = 0; c < $current_number_of_cores; c++ ))

					do

						if [ $(cat /sys/devices/system/cpu/cpu$c/cpufreq/scaling_governor) != $battery_governor ]

							then

								sudo cpufreq-set -c $c -g $battery_governor

							else

								$skip

						fi

					done

				else

					$skip

			fi

			# stop changing battery governor in cpufreq-set #

			# start changing pcie aspm policy on battery #

			if [ $use_changing_pcie = "1" ]

				then

					if (( $(cat /sys/module/pcie_aspm/parameters/policy | grep -c "powersave") != "1" ))

						then

							echo powersave > /sys/module/pcie_aspm/parameters/policy

						else

							$skip

					fi

				else

					$skip

			fi

			# stop changing pcie aspm policy on battery #

			# start disable hal polling on device (experimental function) #

			if [ $use_hal_polling = "1" ]

				then

					sudo hal-disable-polling --device $hal_polling_device

				else

					$skip

			fi

			# stop disable hal polling on device (experimental function) #

			# start block wifi using rfkill #

			if [ $use_rfkill = "1" ] && [ $use_changing_wifi = "1" ] && [ $daemon_wifi = "1" ]

				then

					if (( $(rfkill list wifi | grep -c "no") > "0" ))

						then

							sudo rfkill block wifi

						else

							$skip

					fi

				else

					$skip

			fi

			# stop block wifi using rfkill #

			# start block bluetooth using rfkill #

			if [ $use_rfkill = "1" ] && [ $use_changing_bluetooth = "1" ] && [ $daemon_bluetooth = "1" ]

				then

					if (( $(rfkill list bluetooth | grep -c "no") > "0" ))

						then

							sudo rfkill block bluetooth

						else

							$skip

					fi

				else

					$skip

			fi

			# stop block bluetooth using rfkill #

			# start setting power saving with hdparm #

			if [ $use_hdparm = "1" ]

				then

					if (( $(sudo hdparm -B $hard_disk | grep -c "= 1") != "1" ))

						then

							sudo hdparm -B 1 $hard_disk

						else

							$skip

					fi

					if (( $(sudo hdparm -M $hard_disk | grep -c "= 128") != "1" ))

						then

							sudo hdparm -M 128 $hard_disk

						else

							$skip

					fi

					if (( $(sudo hdparm -W $hard_disk | grep -c "off") != "1" ))

						then

							sudo hdparm -W 0 $hard_disk

						else

							$skip

					fi

					if (( $(sudo hdparm -C $hard_disk | grep -c "standby") != "1" ))

						then

							sudo hdparm -S 1 $hard_disk

						else

							$skip

					fi

				else

					$skip

			fi

			# stop setting power saving with hdparm #

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

	$longwait

	if [ $use_systemd = "1" ]

		then

			# stop setvtrgb service #

			if [ $stop_setvtrgb = "1" ] && [ $(systemctl status setvtrgb.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop setvtrgb.service

				else

					$skip

			fi

			# end of stop setvtrgb service #

			# stop colord service #

			if [ $stop_colord = "1" ] && [ $(systemctl status colord.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop colord.service

				else

					$skip

			fi

			# end of stop colord service #

			# stop preload service #

			if [ $stop_preload = "1" ] && [ $(systemctl status preload.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop preload.service

				else

					$skip

			fi

			# end of stop preload service #

			# stop ntp service #

			if [ $stop_ntp = "1" ] && [ $(systemctl status ntp.service | grep -c inactive) != "1" ]

				then

					sudo systemctl stop ntp.service

				else

					$skip

			fi

			# end of stop ntp service #

		else

			$skip

	fi

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

