# WRF utils - migration
This subfolder holds scripts that should help migrating existing WRF setup,
e.g. when releasing new compiled versions of the model or when changing
software or libraries.

## Migration scripts (latest review: 2022-12-31)

### Up to version 4.2.0
* [visualization_migration.sh](./to_420/visualization_migration.sh): 
  migration from NCL to wrf_visualization, can be executed without parameters;
  uses default parameters and directories of the deployment.
* [wrf_migration.sh](./to_420/wrf_migration.sh):
  migration from one WRF version to another. Since the naming convention for the folders
  are different for each supported version and its folders are need to be set manually 
  at the moment.
* [combi_migration.sh](./to_420/combi_migration.sh) (testing):
  migration from one WRF version to another in addition to the replacement of the NLC script
  files with the wrf_visualization scripts
