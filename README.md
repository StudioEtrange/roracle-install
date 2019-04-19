# Install ROracle package

* Install & Fix Oracle Install Client binaries
* Build & Install ROracle package on a GNU/Linux system or on MacOs

_For RODBC see rodbc-install https://github.com/StudioEtrange/rodbc-install_

## Prerequites

* R should be present on system
* Standard build tools
* HTTP should work to download R packages - so set http_proxy env var if needed

## Install

### Download Oracle Instant Client archive

Download Basic and SDK Oracle Instant Client from www.oracle.com, and put zip into roracle-install/cache folder.

This can not be automated.

### Help

	./install.sh -h|--help

### Build & install ROracle package

	./install.sh [<path>] [<32|64>]

NOTE : Default install path is R Packages default path. Default arch is 64 bits

### OPTIONAL : Install build tools

	./buildtools.sh

_NOTE : This script will test if build tools are installed on your system and will try to install them. You should bypass this step and install build tools by yourself if needed_


## Usage of ROracle

You can use it within your R script

	localRepo <- Sys.getenv("LOCAL_R_REPO")
	.libPaths( c( .libPaths(), localRepo) )
	library(DBI)
	library(ROracle)

And then call this R script from a shell (for example)

	export LOCAL_R_REPO=/path/to/rpackage/install/folder
	# Optional
	export TNS_ADMIN="/path/folder/"
	Rscript my_script.R

Your /etc/host **MUST** be correctly defined. Oracle Instant Client must resolve your hostname

	127.0.0.1 localhost my_host_name

If you use tnsnames.ora file, put it in a folder and set TNS_ADMIN env var (only folder path, without tnsnames.ora)

	export TNS_ADMIN="/path/folder/"

You may also set some other environment variables

	# For encoding
	export NLS_LANG="FRENCH_FRANCE.UTF8"
	# For Timezone
	export TZ="Europe/Paris"
	export ORA_SDTZ="Europe/Paris"


## Note on Stella

* This script is built on stella framework (https://github.com/StudioEtrange/stella)

## Usefull Links

* http://carlo-hamalainen.net/blog/2012/5/11/r-makeflags-rpath-and-building-packages
* http://stackoverflow.com/questions/26210317/installation-of-rodbc-roracle-packages-on-os-x-mavericks/26219189#26219189
* https://github.com/kubo/fix_oralib_osx
