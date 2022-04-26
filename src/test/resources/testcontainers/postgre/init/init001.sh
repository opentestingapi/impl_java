#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER e2etest WITH PASSWORD 'e2etest';
    CREATE SCHEMA e2etest;
    GRANT ALL ON SCHEMA e2etest TO e2etest;
    GRANT ALL ON DATABASE postgres to e2etest;
    CREATE TABLE e2etest.e2etesttable(
        test varchar(1000)
    );
    INSERT INTO e2etest.e2etesttable(test) values ('test1');
    GRANT ALL ON ALL TABLES IN SCHEMA e2etest TO e2etest;
EOSQL