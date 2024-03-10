# WRF utils - migration
This subfolder holds scripts that should help migrating existing WRF setup,
e.g. when releasing new compiled versions of the model or when changing
software or libraries.

## Migration scripts (latest review: 2024-03-10)

### Up to version 4.2.0
* [visualization_migration.sh](./to_420/visualization_migration.sh): 
  migration from NCL to wrf_visualization, can be executed without parameters;
  uses default parameters and directories of the deployment.
* [wrf_migration.sh](./to_420/wrf_migration_420.sh):
  migration from one WRF version to another. Since the naming convention for the folders
  are different for each supported version and its folders are need to be set manually 
  at the moment.
* [combi_migration.sh](./to_420/combi_migration.sh) (testing):
  migration from one WRF version to another in addition to the replacement of the NLC script
  files with the wrf_visualization scripts

### From 4.2.0 to version 4.4.0
* [wrf_migration.sh](./to_440/wrf_migration.sh): migration from WRF 4.2.0 version to 4.4.0 and 
   changing the library dependencies for some libraries to arch linux packages

### From 4.4.0 to version 4.5.0
* [wrf_migration.sh](./to_440/wrf_migration.sh): migration from WRF 4.4.0 version to 4.5.0 and 
   changing the library dependencies for some libraries to arch linux packages
