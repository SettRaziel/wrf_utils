#!/bin/bash

# setting -e to abort on error
set -e

. "${HOME}/wrf_utils/libs/terminal_color.sh"

# parameter check
if [ "$#" -ne 1 ]; then
  printf "%bWrong number of arguments. Must be one for <HOUR>.%b\\n" "${RED}" "${NC}"
  exit 1
fi

YEAR=$(date -u +%Y -d "yesterday")
MONTH=$(date -u +%m -d "yesterday")
DAY=$(date -u +%d -d "yesterday")
HOUR=${1}

sh "${HOME}/wrf_archlinux/wrf_run/run_model.sh" "-b" "wrf_450" "-y" "${YEAR}" "-m" "${MONTH}" "-d" "${DAY}" "-h" "${HOUR}" "-p" "96" "-r" "0p50"
