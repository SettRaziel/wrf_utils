#!/bin/bash

. ../libs/terminal_color.sh

# error handling for input parameter
if [ "$#" -ne 3 ]; then
  printf "%bWrong number of arguments. Must be one for <YEAR> <MONTH> <DAY> <HOUR> <PERIOD>.%b\\n" "${RED}" "${NC}"
  exit 1
fi

TIME_STAMP=${1}
SOURCE_PATH="${2}"
DESTINATION_PATH="${3}"

# check if directory exists
if ! [ -d "${DESTINATION_PATH}/latest" ]; then
  mkdir -p "${DESTINATION_PATH}/latest"
fi

# remove previous content
rm -rf "${DESTINATION_PATH}/latest/"*

# copy files to latest foldet
cp -r "${SOURCE_PATH}/${TIME_STAMP}"*"/"* "${DESTINATION_PATH}/latest"

# move target directory to destination
mv "${SOURCE_PATH}/${TIME_STAMP}"* ${DESTINATION_PATH}
