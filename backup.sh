#!/bin/bash

### Constants
backupdir="/var/backups/pterodactyl/"
mcdir="/data/pterodactyl"
#discord_webhook="https://discordapp.com/api/webhooks/"

### Code 
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage : $0 [ServerName] [ServerUUID]"
  exit 1
fi

servername="$1"
UUID="$2"
date=$(date +%F_%H-%M)
destfolder="${backupdir}/${servername}"
destfile="${servername}-${date}.tar.gz"
srcfolder="${mcdir}/${UUID}"

cd $srcfolder
mkdir -pv $destfolder
tar --exclude='./logs' -cvpzf "${destfolder}/${destfile}" --one-file-system .
echo '=========================================='
echo 'Server backuped'
chmod 640 ${destfolder}/${destfile}
date >> ${destfolder}/backups.log
if [ -z "$discord_webhook"]; then
  curl --location --request POST $discord_webhook \
  --header 'Content-Type: application/json' \
  --data-raw "{\"embeds\": [{\"title\": \"Server backup: **${servername}**\",\"description\": \"*Date*: ${date}\n*File*: ${destfile}\"}]}"
fi
