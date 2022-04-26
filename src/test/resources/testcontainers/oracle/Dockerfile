FROM docker.io/quillbuilduser/oracle-18-xe-micro-sq

COPY init /opt/oracle/product/18c/dbhomeXE/init

USER root
RUN chmod 777 /opt/oracle/product/18c/dbhomeXE/init/*
RUN chmod +x /opt/oracle/product/18c/dbhomeXE/init/*

USER oracle

CMD /bin/sh -c echo -e "sga_target=${SGA_TARGET}" >> ${ORACLE_HOME}/dbs/initXE.ora; ${ORACLE_HOME}/bin/lsnrctl start ; echo create spfile from pfile\; | ${ORACLE_HOME}/bin/sqlplus / as sysdba ;echo startup | ${ORACLE_HOME}/bin/sqlplus / as sysdba ; ${ORACLE_HOME}/bin/lsnrctl status ; ${ORACLE_HOME}/bin/sqlplus sys/oracle as sysdba @${ORACLE_HOME}/init/create.sql ; tail -f $ORACLE_BASE/diag/rdbms/*/*/trace/alert*.log