#!/bin/bash

# migrate from ncl to wrf_visualization
sh ./visualization_migration.sh

# migrate WRF version
sh ./wrf_migration.sh
