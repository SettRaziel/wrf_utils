#!/bin/sh
# @Author: Benjamin Held
# @Date:   2020-10-30 19:05:49
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-10-30 19:07:59

# migrate from ncl to wrf_visualization
sh ./visualization_migration.sh

# migrate WRF version
sh ./wrf_migration.sh
