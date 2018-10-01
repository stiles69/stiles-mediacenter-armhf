#!/bin/bash
#====================================================
#
#          FILE: Start-Docker-Sabnzbd.sh
# 
#         USAGE: ./Start-Docker-Sabnzbd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/30/2018 22:11
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker create --name=sabnzdb \
		-v /home/brettsalemink/development/Docker/docker-sabnzbd-armhf/config:/config \
		-v /torrents:/downloads \
		-v /torrents/incomplete:/incomplete-downloads \
		-e PGID=1001 -e PUID=1001 \
		-e TZ=America/Chicago \
		-p 8080:8080 -p 9090:9090 \
		stiles/docker-sabnzdb-armhf:latest

}	# end Main

Main

#===EXIT===
exit 0

