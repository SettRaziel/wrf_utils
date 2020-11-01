# WRF utils - migration
This subfolder holds scripts that should help migrating existing WRF setup,
e.g. when releasing new compiled versions of the model or when changing
software or libraries.

## Migration scripts (latest review: 2020-09-26)
* [visualization_migration.sh](./visualization_migration.sh): 
  migration from NCL to wrf_visualization, can be executed without parameters;
  uses default parameters and directories of the deployment.
* [wrf_migration.sh](./wrf_migration.sh):
  migration from one WRF version to another. Since the naming convention for the folders
  are different for each supported version and its folders are need to be set manually 
  at the moment.
* [combi_migration.sh](./combi_migration.sh) (testing):
  migration from one WRF version to another in addition to the replacement of the NLC script
  files with the wrf_visualization scripts
