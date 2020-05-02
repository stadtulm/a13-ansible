#!/bin/bash

export RESTIC_REPOSITORY="rest:https://{{ backup_name }}:{{ backup_conn_pw }}@{{ backup_server }}:8000/{{ backup_name }}"
export RESTIC_PASSWORD="{{ backup_pw }}"

LOGFILE="/srv/restic/{{ backup_name }}/restic.log"

{
restic snapshots > /dev/null || restic init # initialize repository if not already exits
} 2>&1 | tee -a $LOGFILE

