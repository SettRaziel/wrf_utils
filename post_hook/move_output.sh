#!/bin/bash

. ../libs/terminal_color.sh

# error handling for input parameter
if [ "$#" -ne 3 ]; then
  printf "%bWrong number of arguments. Must be one for <TIME_STAMP> <SOURCE> <DESTINATION>.%b\\n" "${RED}" "${NC}"
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
# remove timestamp from meteogram files (06_29_00_meteogram_Ber.png => meteogram_Ber.png)
for FILE_NAME in "${DESTINATION_PATH}latest/"*; do
  if [[ "${FILE_NAME}" =~ [0-1][0-9]_[0-3][0-9]_[0-2][0-9]_meteogram_  ]]; then
    REPLACE=$(echo "${FILE_NAME}" | sed -r -e "s#[0-1][0-9]_[0-3][0-9]_[0-2][0-9]_##g")
    mv "${FILE_NAME}" "${REPLACE}"
  fi
done

# move target directory to destination
mv "${SOURCE_PATH}/${TIME_STAMP}"* ${DESTINATION_PATH}
