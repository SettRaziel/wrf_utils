#!/bin/bash

# Migration-Script (currently in testing) from one WRF version to another
# The versions and folders need to be set manually at the moment

# enable termination on error
set -e

# define terminal colors
. ../libs/terminal_color.sh

SCRIPT_PATH=$(pwd)

# dependency required with WRF 4.2.0
yay -S --noconfirm --needed libpciaccess libunwind

# old folder names and new one
# wrf_420; WRF_FOLDER='WRF-4.2'; WPS_FOLDER='WPS-4.2';;
# wrf_410; WRF_FOLDER='WRF-4.1.5'; WPS_FOLDER='WPS-4.1';;
# wrf_400; WRF_FOLDER='WRF'; WPS_FOLDER='WPS';;
# wrf_391; WRF_FOLDER='WRFV3'; WPS_FOLDER='WPS';;
FILE_NAME_OLD='wrf_410'; WRF_FOLDER_OLD='WRF-4.1.5'; WPS_FOLDER_OLD='WPS-4.1'
FILE_NAME='wrf_420'; WRF_FOLDER='WRF-4.2'; WPS_FOLDER='WPS-4.2'

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
