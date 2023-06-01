| VERSION | API | CHANGELOG                                                                                                                                                    |
|---------|-----|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1.32    | 1.1 | upgrade SpringDoc (swagger-ui fix) |
| 1.31    | 1.1 | JDK 17 (new temurin base image), Spring Boot 3.1, library updates, image updates, Cassandra (v4) datacenter property |
| 1.30    | 1.1 | closing all kafka consumers with test case upload (changed group.id is allowed) |
| 1.29    | 1.1 | Bugfix: need to lock check for execution, if exec itself takes more time than cron interval |
| 1.28    | 1.1 | adding empty and random payload support for header extraction using dataextraction |
| 1.27    | 1.1 | new structure dataextraction with header support, result2random deprecated |
| 1.26    | 1.1 | API 1.1: regex and jsonschema logic for checks |
| 1.25    | 1.0 | bugfix 1.24 Kafka connectivity String cast (testversion) |
| 1.24    | 1.0 | bugfix tracing for delayed REST sender, fix JSON serialization/deserialization |
| 1.23    | 1.0 | using Jackson JavaPropsMapper to grant access to more result2random values |
| 1.22    | 1.0 | multi architecture docker build |
| 1.21    | 1.0 | added testid for Kafka consumer error output and various Readme changes, additional test case for Kafka properties |
| 1.20    | 1.0 | define Kafka consumer and producer properties with custom parameters, print testid with exception for Kafka DelayedSender |
| 1.19    | 1.0 | support parallel execution with bulk trigger |
| 1.18    | 1.0 | feature flag to disable kafka expacted vs actual log, add testid and checkid to this log |
| 1.17    | 1.0 | improved upload output, new GUI to analyze test cases, AWS SDK update |
| 1.16    | 1.0 | Adding support to change Kafka reconnect backoff (kafka.reconnect.backoff.max.ms=60000, kafka.reconnect.backoff.ms=1000) |
| 1.15    | 1.0 | YML support (testcase), adding 'senddelay' to REST/SOAP adapter, set Kafka 'senddelay' default to 0, use unblocking technical implementation                 |
| 1.14    | 1.0 | adding alias 'soap' to rest adapter                                                                                                                          |
| 1.13    | 1.0 | Replacement from subsequent injects stored in random data pool                                                                                               |
| 1.12    | 1.0 | Bugfix DELETE endpoind content-type                                                                                                                          |
| 1.11    | 1.0 | Kafka consumers not shared between test cases, they have to use different group.id (recreated with every upload)                                             |
| 1.10    | 1.0 | endpoint to export all test cases                                                                                                                            |
| 1.9     | 1.0 | dependency upgrades, CVE fix: https://github.com/aws/aws-sdk-java/security/advisories/GHSA-c28r-hw5m-5gv3                                                    |
| 1.8     | 1.0 | data generator endpoint to create mass data from testcases                                                                                                   |
| 1.7     | 1.0 | using relative path for Swagger-UI (simplifies proxy usage, for example https)                                                                               |
| 1.6     | 1.0 | S3-Adapter, Swagger-UI bugfixes (content-type upload)                                                                                                        |
| 1.5     | 1.0 | result content-type and logic fixed for pause endpoint, more understandable log for checks, new field description for injects and checks                     |
| 1.4     | 1.0 | decreased some log levels, removed logs for "zero" values, unique names testcontainer, increased readability system test output                              |
| 1.3     | 1.0 | introduced senddelay for Kafka producer, fixed timer bug for reloadtestcases, dependency upgrades, Sonar fixes, new DevEnv, systemtests, springdoc migration |
| 1.2     | 1.0 | inheritfrom supports data added with result2random (source inject) - you can "fake" a time delay with this using 2 different cron                            |
| 1.1     | 1.0 | support additional http types like PUT, DELETE, ...; allow http return code checks for REST                                                                  |
| 1.0     | 1.0 | initial version with API 1.0                                                                                                                                 |