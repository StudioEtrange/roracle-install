if [ ! "$_ELASTICSEARCH_INCLUDED_" = "1" ]; then
_ELASTICSEARCH_INCLUDED_=1



feature_elasticsearch() {
	FEAT_NAME=elasticsearch
	FEAT_LIST_SCHEMA="5_6_2:binary 5_2_0:binary 2_3_5:binary 1_4_4:binary 1_5_0:binary 1_5_2:binary 1_6_0:binary 1_6_2:binary 1_7_3:binary 2_0_0:binary 2_0_2:binary 2_1_1:binary"
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="binary"
}


feature_elasticsearch_env() {
	ES_HOME=$FEAT_INSTALL_ROOT
	export ES_HOME=$FEAT_INSTALL_ROOT
}



feature_elasticsearch_5_6_2() {
	FEAT_VERSION=5_6_2

	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.2.zip
	FEAT_BINARY_URL_FILENAME=elasticsearch-5.6.2.zip
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}





feature_elasticsearch_5_2_0() {
	FEAT_VERSION=5_2_0

	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.2.0.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-5.2.0.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_elasticsearch_2_3_5() {
	FEAT_VERSION=2_3_5
	# TODO NEED JDK
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.5/elasticsearch-2.3.5.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-2.3.5.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}

feature_elasticsearch_2_1_1() {
	FEAT_VERSION=2_1_1
	# TODO NEED JDK
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.1/elasticsearch-2.1.1.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-2.1.1.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}

feature_elasticsearch_2_0_2() {
	FEAT_VERSION=2_0_2
	# TODO NEED JDK
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.0.2/elasticsearch-2.0.2.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-2.0.2.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_elasticsearch_2_0_0() {
	FEAT_VERSION=2_0_0
	# TODO NEED JDK
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.0.0/elasticsearch-2.0.0.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-2.0.0.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_elasticsearch_1_7_3() {
	FEAT_VERSION=1_7_3
	# TODO NEED JDK
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-1.7.3.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}

feature_elasticsearch_1_6_2() {
	FEAT_VERSION=1_6_2
	# TODO NEED JDK
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.6.2.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-1.6.2.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}

feature_elasticsearch_1_4_4() {
	FEAT_VERSION=1_4_4
	# TODO NEED JDK 7 >= 7.60
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-1.4.4.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_elasticsearch_1_5_0() {
	FEAT_VERSION=1_5_0
	# TODO NEED JDK 7 >= 7.60
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.0.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-1.5.0.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_elasticsearch_1_5_2() {
	FEAT_VERSION=1_5_2
	# TODO NEED JDK 7 >= 7.60
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-1.5.2.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}



feature_elasticsearch_1_6_0() {
	FEAT_VERSION=1_6_0
	# NEED JDK 7 >= 7.60
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	FEAT_BINARY_URL=https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.6.0.tar.gz
	FEAT_BINARY_URL_FILENAME=elasticsearch-1.6.0.tar.gz
	FEAT_BINARY_URL_PROTOCOL=HTTP_ZIP

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=feature_elasticsearch_env

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/elasticsearch
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}

feature_elasticsearch_install_binary() {
	__get_resource "$FEAT_NAME" "$FEAT_BINARY_URL" "$FEAT_BINARY_URL_PROTOCOL" "$FEAT_INSTALL_ROOT" "STRIP"


}


fi
