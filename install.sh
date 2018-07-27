echo "INSTALLING VUE SCRIPTS"

# SCRIPTS_DIR="source `pwd`/scripts/install_helper.sh"
BASH_PROFILE=~/.bash_profile
PWD=`pwd`
SCRIPTS_DIR=(`find ${PWD}/scripts -name '*.sh'`)

echo "######### VUE SCRIPTS #########" >> "$BASH_PROFILE"

for f in "${SCRIPTS_DIR[@]}"; do
   echo "source ${f}" >> "$BASH_PROFILE"
done
echo "###############################" >> "$BASH_PROFILE"
source ~/.bash_profile
