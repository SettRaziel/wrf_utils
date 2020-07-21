# WRF utils - migration
This subfolder holds scripts that should help migrating existing WRF setup,
e.g. when releasing new compiled versions of the model or when changing
software or libraries.

## Migration scripts (latest review: 2020-07-13)
* [visualization_migration.sh](./visualization_migration.sh) (testing): 
  migration from NCL to wrf_visualization, can be executed without parameters;
  uses default parameters and directories of the deployment
