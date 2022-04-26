CREATE ROLE IF NOT EXISTS e2etest
WITH SUPERUSER = false
 AND LOGIN = true
 AND PASSWORD =  'e2etest';

CREATE KEYSPACE IF NOT EXISTS e2etest
WITH REPLICATION = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 1
}
AND DURABLE_WRITES = true;

CREATE TABLE if not exists e2etest.e2etesttable(
   test text,   
   PRIMARY KEY (test)
);

INSERT INTO e2etest.e2etesttable(test) values ('test1');
