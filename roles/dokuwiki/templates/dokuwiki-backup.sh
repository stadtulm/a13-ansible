#!/bin/bash

BACKUPFILE=dokuwiki_`date +%d-%m-%Y"_"%H_%M_%S`.tgz
LOGFILE=/var/backups/dokuwiki/dokuwiki.log

{
tar -zcvf /var/backups/dokuwiki/$BACKUPFILE {{ nginx_root }} 
rsync -av --delete /var/backups/dokuwiki srf@lb.ulmlernt.org:/var/backups/dokuwiki 
} 2>&1 | tee -a $LOGFILE

