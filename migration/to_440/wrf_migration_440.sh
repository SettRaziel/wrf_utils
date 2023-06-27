#!/bin/bash

# Migration-Script from WRF version 4.2.0 to 4.4.0

# enable termination on error
set -e

# define terminal colors
. ../../libs/terminal_color.sh

SCRIPT_PATH=$(pwd)

# dependency required with WRF 4.2.0
yay -S --noconfirm --needed libpciaccess libunwind

# packages required with WRF 4.4.0
yay -S --noconfirm --needed zlib libpng jasper

# old folder names and new one
FILE_NAME_OLD='wrf_420'; WRF_FOLDER_OLD='WRF-4.2'; WPS_FOLDER_OLD='WPS-4.2'
FILE_NAME='wrf_440'; WRF_FOLDER='WRF-4.4'; WPS_FOLDER='WPS-4.4'

# deploy new archive
cd ${HOME} || exit 1
URL_PATH="https://bheld.eu/data/wrf_deploy/${FILE_NAME}.tar.gz"
ARCHIVE="${FILE_NAME}.tar.gz"
printf "%b\\nLoading wrf archive: %b\\n" "${YELLOW}" "${NC}"
wget "${URL_PATH}"
printf "%bUnpacking archive... %b\\n" "${YELLOW}" "${NC}"
tar -xzf "${ARCHIVE}"
rm "${ARCHIVE}"

# copy old configuration files
printf "%bDeploying repository config files... %b\\n" "${YELLOW}" "${NC}"
cp "${HOME}/${FILE_NAME_OLD}/${WPS_FOLDER_OLD}/namelist.wps" "${HOME}/${FILE_NAME}/${WPS_FOLDER}"
cp "${HOME}/${FILE_NAME_OLD}/${WRF_FOLDER_OLD}/test/em_real/namelist.input" "${HOME}/${FILE_NAME}/${WRF_FOLDER}/test/em_real/"
cp "${HOME}/${FILE_NAME_OLD}/${WRF_FOLDER_OLD}/test/em_real/tslist" "${HOME}/${FILE_NAME}/${WRF_FOLDER}/test/em_real/"
