#!/bin/bash

##############################################
#                                            #
# Here is preload and settings block of code #
#                                            #
##############################################

skip="sleep 0"

use_changing_brightness="1"

	path_brightness="/sys/class/backlight/intel_backlight/brightness"

	max_brightness="12421"

	min_brightness="0"

use_samsung_tools="1"

loop="1"

use_autosuspend="1"

	path_battery_percentage="/sys/class/power_supply/BAT1/capacity"

	min_battery_percentage="5"

wireless_interface="wlp5s0"

	use_iw_pm="1"

	use_iwconfig_pm="1"

use_smt_power_saving="0"

use_mc_power_saving="0"

use_rfkill="1"

	use_changing_wifi="1"

	use_changing_bluetooth="1"

use_changing_ipv6="1"

use_changing_scsi="1"

	number_of_scsi_host="4"

	ac_scsi_host="max_performance"

	battery_scsi_host="min_power"

use_changing_governor="1"

	use_cpufreq="1"

	number_of_cores="4"

	battery_governor="ondemand"

	ac_governor="performance"

use_changing_pcie="1"

use_hal_polling="0"

	hal_polling_device="/dev/cdrom"

longwait="sleep 600"

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

	if [ $use_changing_brightness = "1" ]

		then

			if (( $(cat $path_brightness) < $max_brightness ))

				then

					echo $max_brightness > $path_brightness

				else

					$skip

			fi

		else

			$skip

	fi

	# stop changing ac brightness #

	# start unblock wifi #

	if [ $use_changing_wifi = "1" ] && [ $use_rfkill = "1" ]

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

	# stop unblock wifi #

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

	if [ $use_changing_brightness = "1" ]

		then

			if (( $(cat $path_brightness) > $min_brightness ))

				then

					echo $min_brightness > $path_brightness

				else

					$skip

			fi

		else

			$skip

	fi

	# stop changing battery brightness #

	# start block wifi #

	if [ $use_changing_wifi = "1" ] && [ $use_rfkill = "1" ]

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

	# stop block wifi #

	# start samsung-tools service #

	if [ $use_samsung_tools = "1" ]

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

	if on_ac_power;

	then

		##############################################
		#                                            #
		# Here is start point block of code if on AC #
		#                                            #
		##############################################

		sudo systemctl start laptop-mode.timer
		sudo systemctl start laptop-mode.service
		sudo systemctl start lmt-poll.service
		echo 0 > /proc/sys/vm/laptop_mode
		sudo systemctl restart laptop-mode.timer
		sudo systemctl restart laptop-mode.service
		sudo systemctl restart lmt-poll.service
		sudo systemctl reload laptop-mode.service
		sudo systemctl stop laptop-mode.timer
		sudo systemctl stop lmt-poll.service
		sudo systemctl stop laptop-mode.service
		sudo systemctl stop laptop-mode.timer

		echo 0 > /proc/sys/vm/laptop_mode
		echo 10 > /proc/sys/vm/dirty_ratio
		echo 5 > /proc/sys/vm/dirty_background_ratio
		echo 1000 > /proc/sys/vm/dirty_expire_centisecs
		echo 1000 > /proc/sys/vm/dirty_writeback_centisecs
		echo 0 > /sys/module/snd_hda_intel/parameters/power_save

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

		# end of disable power management in iwconfig #

		# start enabling ipv6 #

		if [ $use_changing_ipv6 = "1" ]

			then

				if (( $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) != 0 ))

					then

						echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6

					else

						$skip

				fi

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

		# start changing ac governor #

		if [ $use_changing_governor = "1" ]

			then

				for (( c = 0; c < $number_of_cores; c++ ))

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

				for (( c = 0; c < $number_of_cores; c++ ))

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

		# start changing pcie aspm policy on ac

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

		# stop changing pcie aspm policy on ac

		sudo modprobe -r uvcvideo

		# start enable hal polling on device (experimental function)

		if [ $use_hal_polling = "1" ]

			then

				sudo hal-disable-polling --enable-polling --device $hal_polling_device

			else

				$skip

		fi

		# stop enable hal polling on device (experimental function)

		sudo hdparm -B 255 -M 254 -S 244 -W 1 /dev/sda

		# start unblock bluetooth using rfkill

		if [ $use_changing_bluetooth = "1" ] && [ $use_rfkill = "1" ]

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

		# stop unblock bluetooth using rfkill

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

		if [ $use_autosuspend = "1" ] && (( $(cat $path_battery_percentage) < $min_battery_percentage ))

		then

			sudo systemctl suspend

		else

			sudo systemctl start laptop-mode.timer
			sudo systemctl start laptop-mode.service
			sudo systemctl start lmt-poll.service
			echo 5 > /proc/sys/vm/laptop_mode
			sudo systemctl restart laptop-mode.timer
			sudo systemctl restart laptop-mode.service
			sudo systemctl restart lmt-poll.service
			sudo systemctl reload laptop-mode.service
			sudo systemctl stop laptop-mode.timer
			sudo systemctl stop lmt-poll.service
			sudo systemctl stop laptop-mode.service
			sudo systemctl stop laptop-mode.timer

			sudo powertop --auto-tune

			echo 5 > /proc/sys/vm/laptop_mode
			echo 90 > /proc/sys/vm/dirty_ratio
			echo 1 > /proc/sys/vm/dirty_background_ratio
			echo 60000 > /proc/sys/vm/dirty_expire_centisecs
			echo 60000 > /proc/sys/vm/dirty_writeback_centisecs
			echo 1 > /sys/module/snd_hda_intel/parameters/power_save

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

			# end of enable power management in iwconfig #

			# start disabling ipv6 #

			if [ $use_changing_ipv6 = "1" ]

				then

					if (( $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) != 1 ))

						then

							echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

						else

							$skip

					fi

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

			# start changing battery governor #

			if [ $use_changing_governor = "1" ]

				then

					for (( c = 0; c < $number_of_cores; c++ ))

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

					for (( c = 0; c < $number_of_cores; c++ ))

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

			# start changing pcie aspm policy on battery

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

			# stop changing pcie aspm policy on battery

			sudo modprobe -r uvcvideo

			# start disable hal polling on device (experimental function)

			if [ $use_hal_polling = "1" ]

				then

					sudo hal-disable-polling --device $hal_polling_device

				else

					$skip

			fi

			# stop disable hal polling on device (experimental function)

			sudo hdparm -B 1 -M 128 -S 1 -W 0 /dev/sda

			# start block bluetooth using rfkill

			if [ $use_changing_bluetooth = "1" ] && [ $use_rfkill = "1" ]

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

			# stop block bluetooth using rfkill

		fi

		#################################################
		#                                               #
		# Here is end point block of code if on Battery #
		#                                               #
		#################################################

	fi

	###################################################
	#                                                 #
	# Here is start point of anywayshot block of code #
	#                                                 #
	###################################################

	$longwait

	# stop setvtrgb service #

	if [[ $(systemctl status setvtrgb.service | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop setvtrgb.service

	fi

	# end of stop setvtrgb service #

	# stop rc-local service #

	if [[ $(systemctl status rc-local.service | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop rc-local.service

	fi

	# end of stop rc-local service #

	# stop colord service #

	if [[ $(systemctl status colord.service | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop colord.service

	fi

	# end of stop colord service #

	# stop keyboard-setup service #

	if [[ $(systemctl status keyboard-setup.service | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop keyboard-setup.service

	fi

	# end of stop keyboard-setup service #

	# stop preload service #

	if [[ $(systemctl status preload.service | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop preload.service

	fi

	# end of stop preload service #

	# stop avahi-daemon service #

	if [[ $(systemctl status avahi-daemon.service | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop avahi-daemon.service

	fi

	# end of stop avahi-daemon service #

	# stop avahi-daemon socket #

	if [[ $(systemctl status avahi-daemon.socket | grep -c inactive) = "1" ]]

		then

			$skip

		else

			sudo systemctl stop avahi-daemon.socket

	fi

	# end of stop avahi-daemon socket #

	#################################################
	#                                               #
	# Here is end point of anywayshot block of code #
	#                                               #
	#################################################

done

###############################
#                             #
# Here is end point of daemon #
#                             #
###############################

