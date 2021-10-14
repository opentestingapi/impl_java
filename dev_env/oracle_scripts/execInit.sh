#! /bin/bash

# run init SQLs
echo 'create.sql'
ORACLE_BASE=/opt/oracle
export ORACLE_BASE
ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE
export ORACLE_HOME
chmod 755 $ORACLE_HOME/sqlplus/mesg
chmod 644 $ORACLE_HOME/sqlplus/mesg/*
$ORACLE_HOME/bin/sqlplus sys/oracle as sysdba @$ORACLE_HOME/initializerscripts/create.sql