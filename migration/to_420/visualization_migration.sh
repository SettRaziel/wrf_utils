#!/bin/bash

# Migration-Script (currently in testing) from ncl output to the python based
# wrf_visualization projekt; The script will consider the default paths and
# directories from the deployment

# enable termination on error
set -e

# define terminal colors
. ../../libs/terminal_color.sh

SCRIPT_PATH=$(pwd)

# switch to home folder
cd "${HOME}" || exit 1

# remove old NCL dependency to ggc6
yay -Rcs --noconfirm gcc6-fortran gcc6-libs gcc6

# suppose default output folder; remove the old output folder
if [ -d "${HOME}/wrf_output" ]; then
  printf "%b\\nRemoving old wrf_output at ${HOME}/wrf_output: %b\\n" "${YELLOW}" "${NC}"
  rm -rf "${HOME}/wrf_output"
fi

# clone wrf_visualization project
printf "%b\\nCloning wrf_visualization: %b\\n" "${YELLOW}" "${NC}"
git clone "https://github.com/SettRaziel/wrf_visualization.git"
# checkout master, since it holds the latest version tag
cd wrf_visualization || exit 1
git checkout master  

# init python dependencies
printf "%b\\nRunning initialization scripts: %b\\n" "${YELLOW}" "${NC}"
cd init || exit 1
sh ./init_environment.sh

printf "%b\\nFinished setup for wrf_visualization.%b\\n" "${YELLOW}" "${NC}"
cd "${SCRIPT_PATH}" || exit 1
