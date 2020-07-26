# @Author: Benjamin Held
# @Date:   2020-07-26 10:28:08
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-07-26 10:40:25

# simple script to download the required libraries for compiling a runnable wrf model

# setting -e to abort on error
set -e

# setting library versions for usage (last checked: 2020-07-26)
export WRF_VERSION="4.2"              # latest: 4.2
export WPS_VERSION="4.2"              # latest: 4.2
export HDF_VERSION="1.12"             # latest: 1.12.0
export NETCDF_VERSION="4.7.4"         # latest: 4.7.4
export NETCDF_FORTRAN_VERSION="4.5.3" # latest: 4.5.3
export MPI_VERSION="3.3"            # latest: 3.4a3
export LIBPNG_VERSION="1.6.37"        # latest: 1.6.37
export ZLIB_VERSION="1.2.11"          # latest: 1.2.11
export JASPER_VERSION="1.900.2"       # latest: 1.900.29 / 2.0.14
export LIBRARY_PATH="./"

# loads the majority of the required library, no jasper since version 2 has other buildsystem
load_libraries() {
# wget specified wrf version
wget -O "${LIBRARY_PATH}WRFV${WRF_VERSION}.tar.gz" "https://github.com/wrf-model/WRF/archive/v${WRF_VERSION}.tar.gz"
# wget specified wps version
wget -O "${LIBRARY_PATH}WPSV${WPS_VERSION}.tar.gz" "https://github.com/wrf-model/WPS/archive/v${WPS_VERSION}.tar.gz"
# wget specific hdf 5 version
wget -O "${LIBRARY_PATH}hdf5-${HDF_VERSION}.0.tar.gz" "https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF_VERSION}/hdf5-${HDF_VERSION}.0/src/hdf5-${HDF_VERSION}.0.tar.gz"
# wget specified netcdf version
wget -O "${LIBRARY_PATH}netcdf-${NETCDF_VERSION}.tar.gz" "https://github.com/Unidata/netcdf-c/archive/v${NETCDF_VERSION}.tar.gz"
# wget specified netcdf fortran bindings
wget -O "${LIBRARY_PATH}netcdf-fortran-${NETCDF_FORTRAN_VERSION}.tar.gz" "https://github.com/Unidata/netcdf-fortran/archive/v${NETCDF_FORTRAN_VERSION}.tar.gz"
# wget specified mpich version
wget -O "${LIBRARY_PATH}mpich-${MPI_VERSION}.tar.gz" "http://www.mpich.org/static/downloads/${MPI_VERSION}/mpich-${MPI_VERSION}.tar.gz"
# wget specified libpng version; can only retrieve latest
wget -O "${LIBRARY_PATH}libpng-${LIBPNG_VERSION}.tar.gz" "https://download.sourceforge.net/libpng/libpng-${LIBPNG_VERSION}.tar.gz"
# wget specified zlib version; can only retrieve latest
wget -O "${LIBRARY_PATH}zlib-${ZLIB_VERSION}.tar.gz" "www.zlib.net/zlib-${ZLIB_VERSION}.tar.gz"
# wget specified jasper version
wget -O "${LIBRARY_PATH}jasper-${JASPER_VERSION}.tar.gz" "http://www.ece.uvic.ca/~frodo/jasper/software/jasper-${JASPER_VERSION}.tar.gz"
}

echo "Preloading libraries:\\n"
load_libraries
