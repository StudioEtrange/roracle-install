#!/bin/bash
_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
_CURRENT_RUNNING_DIR="$( cd "$( dirname "." )" && pwd )"
source $_CURRENT_FILE_DIR/stella-link.sh include

usage() {
	echo "** Build & Install ROracle package"
	echo "$0 [<path>] [<32|64>] [-h|--help]"
	echo " <path>    : path where to install ROracle package and its dependencies."
	echo "             Default is $(Rscript --vanilla -e 'cat(.libPaths()[1])')"
	echo " <32|64>   : 32 or 64 bits. (Default is 64 bits)"
	echo
	echo " -h|--help : show help"
}

[ "$1" = "-h" ] && usage && exit
[ "$1" = "--help" ] && usage && exit

# Check R Install
type Rscript &> /dev/null || _result=1
if [ "$_result" == "1" ]; then
	echo "ERROR : Rscript not found. Please install R/Rscript on your system"
	exit $_result
fi

# Install path
INSTALL_ROOT="$1"
if [ -z "$INSTALL_ROOT" ]; then
	# determine default package directory
	INSTALL_ROOT="$(Rscript --vanilla -e 'cat(.libPaths()[1])')"
fi
INSTALL_ROOT="$($STELLA_API rel_to_abs_path "$INSTALL_ROOT" $_CURRENT_RUNNING_DIR)"
mkdir -p "$INSTALL_ROOT"
mkdir -p "$STELLA_APP_CACHE_DIR"

# Arch
ARCH="$2"
[ -z "$ARCH" ] && ARCH="64"


# Define R local repo
export LOCAL_R_REPO="$INSTALL_ROOT"


echo "======> Installing ROracle package into $LOCAL_R_REPO <======"


# R Dependencies
echo "-*--*-** Install R dependencies of ROracle **-*--*-"
Rscript $STELLA_APP_ROOT/roracle-dep.R

# Oracle Instant Client
echo "-*--*-** Install Oracle Instant Client **-*--*-"
rm -Rf "$INSTALL_ROOT/oci"


case $STELLA_CURRENT_PLATFORM in
	linux )
		_dl_version=12_1
		# SDK
		[ "$ARCH" == "32" ] && FEAT_BINARY_URL_FILENAME_SDK="instantclient-sdk-linux-12.1.0.2.0.zip" || \
		FEAT_BINARY_URL_FILENAME_SDK="instantclient-sdk-linux.x64-12.1.0.2.0.zip"
		# BASIC
		[ "$ARCH" == "32" ] && FEAT_BINARY_URL_FILENAME_BASIC="instantclient-basic-linux-12.1.0.2.0.zip" || \
		FEAT_BINARY_URL_FILENAME_BASIC="instantclient-basic-linux.x64-12.1.0.2.0.zip"
		;;

	darwin )
		_dl_version=11_2
		# SDK
		[ "$ARCH" == "32" ] && FEAT_BINARY_URL_FILENAME_SDK="instantclient-sdk-macos.x32-11.2.0.4.0.zip" || \
		FEAT_BINARY_URL_FILENAME_SDK="instantclient-sdk-macos.x64-11.2.0.4.0.zip"
		# BASIC
		[ "$ARCH" == "32" ] && FEAT_BINARY_URL_FILENAME_BASIC="instantclient-basic-macos.x32-11.2.0.4.0.zip" || \
		FEAT_BINARY_URL_FILENAME_BASIC="instantclient-basic-macos.x64-11.2.0.4.0.zip"
		;;
esac

# NOTE : It is impossible to automate download (unlike oracle jdk), because for oracle instant client, you must be logged into oracle website
[ ! -f "$STELLA_APP_CACHE_DIR/$FEAT_BINARY_URL_FILENAME_SDK" ] && _result=1
[ ! -f "$STELLA_APP_CACHE_DIR/$FEAT_BINARY_URL_FILENAME_BASIC" ] && _result=1
[ "$_result" == "1" ] && echo " ** Please download Oracle Instant Client (Basic and SDK) $_dl_version and put zip files into $STELLA_APP_CACHE_DIR" && exit 1

$STELLA_API uncompress "$STELLA_APP_CACHE_DIR/$FEAT_BINARY_URL_FILENAME_BASIC" "$INSTALL_ROOT/oci" "DEST_ERASE"
$STELLA_API uncompress "$STELLA_APP_CACHE_DIR/$FEAT_BINARY_URL_FILENAME_SDK" "$INSTALL_ROOT/oci"

if [ "$STELLA_CURRENT_PLATFORM" == "linux" ]; then
	ln -s "$INSTALL_ROOT/oci/instantclient_$_dl_version/libclntsh.so.12.1" "$INSTALL_ROOT/oci/instantclient_$_dl_version/libclntsh.so"
fi
if [ "$STELLA_CURRENT_PLATFORM" == "darwin" ]; then
	ln -s "$INSTALL_ROOT/oci/instantclient_$_dl_version/libclntsh.dylib.11.1" "$INSTALL_ROOT/oci/instantclient_$_dl_version/libclntsh.dylib"
	ln -s "$INSTALL_ROOT/oci/instantclient_$_dl_version/libocci.dylib.11.1" "$INSTALL_ROOT/oci/instantclient_$_dl_version/libocci.dylib"
fi

# Oracle Instant Client -- tweak binaries
# internal rpath and linked libs are fucked up in oci
$STELLA_API tweak_binary_file "$INSTALL_ROOT/oci/instantclient_$_dl_version" "FIX_LINKED_LIB $INSTALL_ROOT/oci/instantclient_$_dl_version"
$STELLA_API check_binary_file "$INSTALL_ROOT/oci/instantclient_$_dl_version" "RELOCATE"


# Install Package ROracle
echo "-*--*-** Install ROracle **-*--*-"

# download ROracle source
$STELLA_API get_resource "ROracle" "https://cran.r-project.org/src/contrib/00Archive/ROracle/ROracle_1.2-2.tar.gz" "HTTP" "$STELLA_APP_CACHE_DIR"

# build ROracle
# MAKEFLAGS are use with R CMD and we want to ignore LDFLAGS setted in internal R Makeconf
# main goal is to exclude cairo, freetype, x11, pixman dependencies
# see R CMD config
#MAKEFLAGS="LDFLAGS=-Wl,-rpath,$INSTALL_ROOT/oci/instantclient_$_dl_version" R CMD INSTALL -l $LOCAL_R_REPO --configure-args="--without-freetype --with-oci-lib=$INSTALL_ROOT/oci/instantclient_$_dl_version" $STELLA_APP_CACHE_DIR/ROracle_1.2-1.tar.gz
MAKEFLAGS="LDFLAGS=-Wl,-rpath,$INSTALL_ROOT/oci/instantclient_$_dl_version" R CMD INSTALL -l $LOCAL_R_REPO --configure-args="--with-oci-lib=$INSTALL_ROOT/oci/instantclient_$_dl_version" $STELLA_APP_CACHE_DIR/ROracle_1.2-2.tar.gz

# Check built package
$STELLA_API check_binary_file "$INSTALL_ROOT/ROracle"


# Test Package ROracle
echo "-*--*-** Testing ROracle **-*--*-"
Rscript "$STELLA_APP_ROOT/test.R"


echo "======> END <======"
