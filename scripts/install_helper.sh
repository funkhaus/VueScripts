#!/bin/sh

vuepress-install() {
	# This function requires you are in the theme directory of vuepress
	#Get arguments
	THEME_NAME="$1"
	
	#Verify user is in wordpress theme folder
	#Look for app/public/wp-content/themes in working_dir
	declare -a PATH_TEMPLATE=("app" "public" "wp-content" "themes") 
	IFS="/" read -ra PARTS <<< "$(pwd)"
	PARTS=("${PARTS[@]: -4:4}")
	for (( idx=${#PATH_TEMPLATE[@]}-1 ; idx>=0 ; idx-- )) ; do
		if [ "${PATH_TEMPLATE[idx]}" != "${PARTS[idx]}" ]
		then
			echo "WARNING: WORDPRESS INSTALLATION NOT FOUND"
			return
		fi
	done
	#Next check if npm is installed
	#If npm is installed clone, rename and install vuepress
    	if ! [ -x "$(command -v node)" ]; 
		then
			echo "FATAL: Node is not install. Please install node to continue..."
			return
        	else
			#Clone and rename vuepress
			git clone https://github.com/funkhaus/vuepress.git
			mv ./vuepress ./"$1"
			cd "$1"
			npm install
			cd ../
		fi
	#Move to plugins folder and install Rest-Easy plugin
	cd ../plugins/
	git clone https://github.com/funkhaus/Rest-Easy.git
	return 0
	}

