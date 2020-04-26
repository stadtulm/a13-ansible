#!/bin/bash

SQLDUMP=dump_greenlight_`date +%d-%m-%Y"_"%H_%M_%S`.sql
LOGFILE=/srv/greenlight/greenlight-backup.log

{
	docker exec ulmlernt-greenlight-postgres pg_dumpall -c -U postgres | ssh srf@lb.ulmlernt.org "cat > /var/backups/greenlight/$SQLDUMP"
} 2>&1 | tee -a $LOGFILE
