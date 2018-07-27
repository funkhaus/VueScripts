#!/bin/sh

init_vuepress() {
	#Get arguments
	THEME_NAME="$1"
	
	#Verify user is in wordpress theme folder
	#Look for app/public/wp-content/themes in working_dir
	declare -a PATH_TEMPLATE=("app" "public" "wp-content" "themes") 
	IFS="/" read -ra PARTS <<< "$(pwd)"
	for (( idx=${#PATH_TEMPLATE[@]}-1 ; idx>=0 ; idx-- )) ; do
		if [ "${PATH_TEMPLATE[idx]}" != "${IFS[idx]}" ]
		then
			echo "WARNING: WORDPRESS INSTALLATION NOT FOUND"
			break
		fi
	done
	#Next check if npm is installed
    	if ! [ -x "$(command -v node)" ]; 
		then
			echo "FATAL: Node is not install. Please install node to continue..."
        	else
			#Clone and rename vuepress
			git clone https://github.com/funkhaus/vuepress.git
			mv ./vuepress ./"$1"
			cd "$1"
			npm install
		fi
	return 0
	}

