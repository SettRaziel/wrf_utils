#!/bin/sh
# @Author: Benjamin Held
# @Date:   2017-04-04 19:57:11
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2021-01-16 18:49:13

# setting -e to abort on error
set -e

. ../libs/terminal_color.sh

# install cron package
yay -S cronie

# enable cron service on start
sudo systemctl enable cronie.service

# start cron service
sudo systemctl start cronie.service

printf "%bDefine crontabs, e.g. daily modelrun for 18 UTC data 36h forecast at 0.5 degree at midnight\\n%b" "${YELLOW}" "${NC}"
printf "%bcrontab -u http -e 00 00 * * * /abs_path/to/run_model.sh -h 18 -p 36 -r 0p50\\n%b" "${YELLOW}" "${NC}"

crontab -l
