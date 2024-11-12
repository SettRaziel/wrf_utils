#!/bin/bash

. ../libs/terminal_color.sh

# error handling for input parameter
if [ "$#" -ne 1 ]; then
  printf "%bWrong number of arguments. Must be one for <DESTINATION>.%b\\n" "${RED}" "${NC}"
  exit 1
fi

DESTINATION_PATH="${1}"

# save script path
SCRIPT_PATH=$(pwd)

# check if directory exists and change to it
if ! [ -d "${DESTINATION_PATH}" ]; then
  cd "${DESTINATION_PATH}"
fi

# upgrade bundler dependencies
bundle update

# install for specific_install gem
gem install specific_install

# check wrf dependencies
gem specific_install -l https://github.com/SettRaziel/ruby_utils.git
gem specific_install -l https://github.com/SettRaziel/wrf_library.git
gem specific_install -l https://github.com/SettRaziel/wrf_forecast.git

# update gems
gem update

# return to script path
cd ${SCRIPT_PATH}
