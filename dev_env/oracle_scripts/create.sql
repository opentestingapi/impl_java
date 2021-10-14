CREATE USER e2etest IDENTIFIED BY e2etest;
GRANT CONNECT TO e2etest;
GRANT CONNECT, RESOURCE TO e2etest;
GRANT UNLIMITED TABLESPACE TO e2etest;

CREATE TABLE e2etest.e2etesttable(
   test varchar2(1000) PRIMARY KEY
);

INSERT INTO e2etest.e2etesttable(test) values ('test1');

exit