#!/bin/sh
ORACLE_BASE=/opt/oracle; export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/11.2.0/dbhome_1;
export ORACLE_HOME
ORACLE_SID=dmp; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
PATH=$ORACLE_HOME/bin:/usr/sbin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib;
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK
export LD_LIBRARY_PATH
export USER=dmp
export PWD=a12345678
export DATA_DIR=/home/oracle/oraBackUp/data
export LOGS_DIR=/home/oracle/oraBackUp/logs
export BAKUPTIME=$(date "+%Y%m%d%H%M%S")

mkdir -p $DATA_DIR
mkdir -p $LOGS_DIR

echo "Starting back..."
exp $USER/$PWD@$ORACLE_SID file=$DATA_DIR/$BAKUPTIME.dmp log=$LOGS_DIR/$BAKUPTIME.log
echo "completed."
