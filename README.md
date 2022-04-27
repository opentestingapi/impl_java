# open testing implementation spring boot

Reference implementation to upload test cases, create random data and perform tests cron triggered

<b>Version: 1.2</b>

Container:   https://github.com/opentestingapi/impl_java/pkgs/container/opentesting

| VERSION | API | CHANGELOG                                                                                                                               |
|---------|-----|-----------------------------------------------------------------------------------------------------------------------------------------|
| 1.0     | 1.0 | initial version with API 1.0                                                                                                            |
| 1.1     | 1.0 | support additional http types like PUT, DELETE, ...; allow http return code checks for REST                                             |
| 1.2     | 1.0 | inheritfrom supports data added with result2random (source inject) - you can "fake" a time delay with this using 2 different cron       |
| 1.3     | 1.0 | introduced senddelay for Kafka producer, fixed timer bug for reloadtestcases, dependency upgrades, Sonar fixes, new DevEnv, systemtests |

## Architecture

![arch diagram](architecture/e2e-tests.png?raw=true "Architecture")


## Java and Spring Boot?

We would like to make it as easy as possible to extend and to fork the project, so we used commonly used technologies.


## Functions

* INJECT - insert data (default timetolive = 1 day)
* CHECK - check data
* CHECK could have subsequent INJECTS/CHECKS (API extension)
* please use labels to enable label search
* random data generation
* available time definitions: s=second, m=minute, h=hour, d=day
* Container usage preferred


## Adapters

the following adapters could be used:

| type          | readme  |
| ------------- | ------- | 
| cassandra     | [ReadMe](src/main/java/org/opentesting/services/adapter/cassandra/README.md) |
| kafka         | [ReadMe](src/main/java/org/opentesting/services/adapter/kafka/README.md) |
| jdbc          | [ReadMe](src/main/java/org/opentesting/services/adapter/jdbc/README.md) |
| rest/soap     | [ReadMe](src/main/java/org/opentesting/services/adapter/rest/README.md) |


## Random Data / Replacements

* we fully support API replacements: https://opentestingapi.github.io/specification/version-1.0/#replacement-object
* result (only JSON!) from checks/injects could be added to random data using attribute: result2random (API extension - be careful with result2random usage before kafka checks, often messages are created earlier than the check has access to result to random value)
* subsequent checks/injects will be executed if non-mandatory checks failed, for mandatory failed ones whey will not be executed
  
Using the last feature it is possible to extend the available (random) data with additional data,
as this is transferred into subsequent injects and checks.
(will be stored as #\<checkid\>.\<attribute\># or #\<injectid\>.\<attribute\>#)

* result2random example including subsequent checks and injects
```
{
        "checkid" : "check-rest-1",  
        "active" : true,
        "service" : {...},
        "validations": [...],          
        "maxwaittime" : "10m",
        "mandatory" : false,
        "injects" : [ "inject-rest-2" ],
        "checks" : [ "check-rest-2" ],
        "result2random" : [ "test1", "test2" ]
}
```


## Naming Rules / Storage

IDs must be unique, please create a guideline for you test case creators.

* Tests for 1 application should be stored next to it
* Tests for 1 department should be stored in a department repository
* Tests for 1 project should be stored in a project repository
* ...

Please think about using a kind of folder structure to differ between functional cases.


## API Usage

1. upload required files first (please use application/json for all file types): 
```
curl -X POST "http://<servername>:50000/upload/file/<testcaseid>/<filename>" -H "accept: */*" -H "Content-Type: application/json" -d @<filename> && echo
```
Swagger: http://servername:50000/swagger-ui/#/upload-controller/fileuploadUsingPOST

2. upload test case as JSON:
```
curl -X POST "http://<servername>:50000/upload/test" -H "accept: */*" -H "Content-Type: application/json" -d @<filename> && echo
```
Swagger: http://servername:50000/swagger-ui/#/upload-controller/testuploadUsingPOST


* remove test case
```
curl --request DELETE --url http://<servername>:50000/upload/test/<testcaseid>
```
Swagger: http://servername:50000/swagger-ui/#/upload-controller/testremovalUsingDELETE

* read test case
```
curl --request GET --url 'http://<servername>:50000/reporting/test/<testcaseid>?lastchecks=100'
```
Swagger: http://servername:50000/swagger-ui/#/reporting-controller/getUsingGET_1

* read file
```
curl --request GET --url http://<servername>:50000/reporting/file/<testcaseid>/<filename>
```
Swagger: http://servername:50000/swagger-ui/#/reporting-controller/getFileUsingGET

* search test case (read all with /reporting/search?labels=%25)
```
curl --request GET --url 'http://<servername>:50000/reporting/search?labels=<yourlabel>&lastchecks=100'
```
Swagger: http://servername:50000/swagger-ui/#/reporting-controller/searchUsingGET

* list injects to trigger manually (must be activated)
```
curl --request GET --url 'http://<servername>:50000/trigger/'
```
Swagger: http://servername:50000/swagger-ui/#/trigger-controller/getUsingGET_2

* trigger inject (must be activated)
```
curl --request GET --url 'http://<servername>:50000/trigger/inject/<testcaseid>/<injectid>'
```
Swagger: http://servername:50000/swagger-ui/#/trigger-controller/injectUsingGET

* read filtered log files
```
curl --request GET --url 'http://<servername>:50000/reporting/log?filter=<yourfilter>&maxage=7'
```
Swagger: http://servername:50000/swagger-ui/#/reporting-controller/logUsingGET

* pause injects and checks
```
curl --request GET --url 'http://<servername>:50000/trigger/pause/<true/false>'
```
Swagger: http://servername:50000/swagger-ui/#/trigger-controller/pauseUsingGET


## Pipeline Integration / Bulk Execution

You can use this endpoints to realize a pipeline integration.

* bulk execute injects
```
curl -X POST "http://<servername>:50000/trigger/bulk/" -H "accept: application/json" -H "Content-Type: application/json" -d "[\"<testcaseid>.<injectid>\",\"<testcaseid>.*\"]"
```
Swagger: http://servername:50000/swagger-ui/#/trigger-controller/bulkUsingPOST

* bulk read check results
```
curl -X GET "http://<servername>:50000/reporting/bulk?bulkid=<bulkid>" -H "accept: application/json"
```
Swagger: http://servername:50000/swagger-ui/#/reporting-controller/bulkUsingGET


## Password Encryption

Simply use this endpoint to encrypt your passwords and use in your testcase:

(need to be decrypted within the tool for later usage, hash usage does not fit our use case - salt in properties is used to increase security)

```
curl --request POST -H "Content-Type: text/plain; charset=utf-8" --url http://<servername>:50000/password/encrypt --data 'HalloWelt!123'
```
Swagger: http://servername:50000/swagger-ui/#/password-controller/encryptUsingPOST

```
curl --request POST -H "Content-Type: text/plain; charset=utf-8" --url http://<servername>:50000/password/decrypt --data 'ENC(e8K7wp7CusOAwpzCrMOBw5ltwpl6woQ=)'
```
Swagger: http://servername:50000/swagger-ui/#/password-controller/decryptUsingPOST


## Development Environment

Local development environment could be started with docker-compose, please check content in folder dev_env.


### Build (JDK 11 preinstalled in Visual-Studio-Server)

Local build:

```
./build.sh
```

Local build and Run (please start local environment PostGre or configure H2):

```
./run.sh
```

Local build and Container creation (you might want to use your own tags and repositories):

```
./build.sh
```


## Container Usage / Environment Variables

You should run this tool as a container:

local
```
docker run -d -p 50000:50000 --name=opentesting --restart=always robertdiers/opentesting:latest
```

server with 2 GB RAM and 2 cores
```
docker run -d -p 50000:50000 --name=opentesting --restart=always -m 2g --cpus="2" -e "JAVA_TOOL_OPTIONS=-XX:MaxRAMPercentage=75.0" robertdiers/opentesting:latest
```

use external PostGre instead of internal H2 database
```
sudo docker run -d -p 50000:50000 --name=opentesting --restart=always -m 2g --cpus="2" \
    -e "JAVA_TOOL_OPTIONS=-XX:MaxRAMPercentage=75.0" \
    -e "SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.postgresql.Driver" \
    -e "SPRING_DATASOURCE_USERNAME=<user>" \
    -e "SPRING_DATASOURCE_PASSWORD=<password>" \
    -e "SPRING_DATASOURCE_URL=jdbc:postgresql://<servername>:<port>/<databasename>" \
    robertdiers/opentesting:latest
```

integrate with Sleuth / Zipkin Tracing (default sampling rate 0.0)
```
sudo docker run -d -p 50000:50000 --name=opentesting --restart=always -m 2g --cpus="2" \
    -e "JAVA_TOOL_OPTIONS=-XX:MaxRAMPercentage=75.0" \
    -e "SPRING_SLEUTH_SAMPLER_PERCENTAGE=1.0" \
    -e "SPRING_ZIPKIN_BASEURL=<zipkinserver>" \
    robertdiers/opentesting:latest
```

### Parameters (can be used similar to SPRING_DATASOURCE_USERNAME)

|Parameter   |Default   |Description   |
|---|---|---|
|OPENTESTING_APPNAME   |opentesting  |application name   |
|OPENTESTING_AUTODELETE   |7   |delete checks older than 7 days (targetts)   |
|OPENTESTING_CHECKCRON   |[ "0 * * * * ?", "10 * * * * ?", "20 * * * * ?", "30 * * * * ?", "40 * * * * ?", "50 * * * * ?"]   |cron for check execution   |
|OPENTESTING_DOWNLOADMAXCHECKS   |1000   |maximum allowed download size for checks   |
|OPENTESTING_LONGRUNNINGWARN   |5   |warning if process takes more than 5 sec   |
|OPENTESTING_POOLSIZE   |50   |internal thread pool size   |
|OPENTESTING_RELOADTESTCASES   |true   |reload database testcases after container restart   |
|OPENTESTING_RESTTIMEOUT   |30   |timeout for HTTP(S) request, for example JWT receiver   |
|OPENTESTING_SALT   |   |instance specific salt for password encryption   |
|OPENTESTING_USELOCK   |true   |use a cache to avoid user locks because of wrong credentials   |


## Examples

Test Case Template:

[Template](src/main/resources/templates/templatetest.json)

<http://servername:50000/template/testcase>

Example Test Cases:

[Hello World Example](src/test/resources/opentesting/sonstige/local_test_helloworld.json)

[Complex Example](src/test/resources/opentesting/sonstige/local_test_00001/test.json)

[Systemtests](src/test/resources/opentesting/systemtests/) - used for automatic adapter testing


## Utilities

Grafana Dashboard:

[Dashboard](src/main/resources/templates/OpenTesting-Dashboard.json)

<http://servername:50000/template/dashboard>

Swagger:

<http://servername:50000/swagger-ui/>

Info / Metrics / Log / everything else:

<http://servername:50000/>


## Templating

[Example](scripts/json_template/)
