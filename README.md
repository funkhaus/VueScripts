# VueScripts

This repo is a collection of simple healper scripts to be used with Vuepress

## Installation

To make this collection of bash functions available globally simply run the command `source ./install.sh` in the project root. This will modify your .bash_profile file to load the scripts in the `scripts` folder when you start a new terminal session.

## Functions

### Vuepress-install

Running the command `vuepress-install "ThemeName"` requires you to be in the themes folder of a wordpress installation. The command will perform the following action in order:

* Clone the vuepress repo into your themes folder 
* Rename the vuepress directory to whatever name you supply for `"ThemeName"`
* Run `npm install` on vuepress
* Install the Rest-Easy plugin in the plugins folder of Wordpress.
