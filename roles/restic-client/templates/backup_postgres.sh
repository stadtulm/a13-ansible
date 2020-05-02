#!/bin/bash

export RESTIC_REPOSITORY="rest:https://{{ backup_name }}:{{ backup_conn_pw }}@{{ backup_server }}:8000/{{ backup_name }}"
export RESTIC_PASSWORD="{{ backup_pw }}"

LOGFILE="/srv/restic/{{ backup_name }}/restic.log"

{
cd /tmp/ # "errorhandling" for sudo postgres
sudo -u postgres pg_dump -F p {{ backup_pg_db }} | restic backup --stdin #
} 2>&1 | tee -a $LOGFILE

