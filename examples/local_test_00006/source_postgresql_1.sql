create schema IF NOT EXISTS e2etest;
create table IF NOT EXISTS e2etest.e2etesttable(test varchar(500));
INSERT INTO e2etest.e2etesttable(test) values ('#replaceme1#');