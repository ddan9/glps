# glps

> ! Not ready for use. Yet

Installation instructions coming soon

You can test it on your own

If you want, you should to download script, move it to directory like /usr/bin /usr/sbin, chmod +x script, add script to systemd as service

I wrote comments in the code. I hope it will help you

It can works with:

- brightness
- gtrayicon
- notify-send
- kernel ( /proc /sys)
- smt power savings
- mc power savings
- battery life extender
- fan speed
- powertop
- modprobe
- iw
- iwconfig
- rfkill (wifi bluetooth)
- ipv6
- scsi
- cpu online cores (enable/disable)
- cpu cores governor
- cpufrequtils (cpufreq-set)
- pcie
- hdparm
- hal polling cdrom
- systemd
- laptop-mode-tools
- cpufreqd
- samsung-tools
- autosuspend
- setvtrgb
- rc.local
- colord
- keyboard-setup
- preload
- avahi-daemon
- ntp

A detailed description will come later

#### TODO

- scsi auto detect
- оптимизация ОЗУ
- vm.swapiness ит.д.
- больше настроек в пункт
- добавить настройки параметров ядра
- модули для других подсистем (навроде tlp)
- решить проблему с треем?
- оптимизировать скрипт (удалить ненужные ветви)
- добавить выключатели сервисов
- попробовать перебрать поледовательность функций (не все нужны постоянно)
- привести код к валидному виду (скобки и точки запятые)
- usb_charge function
- socket?
- настроек для функций
- driconf через sed?
- systemctl cups cups-browsed
- глобальные параметры в скрипт через консоль
- отладить
- режим презентации экрана on_ac
- схема на несколько запусков?
- выровнять комментарии с в целом сделать красиво
- сменить запускаемый скрипт через systemctl
- на некоторые функции сделать параметры if on_battery и on_ac
- прелоад через инициализацию некоторых вещей (переменных)
- profiles with variables by bash source
- реагирование на plug-in-ac (мб через systemd)
- отдельная проверка и переменная на питание
- раздробить скрипт на отдельные библиотеки/модули для удобства
