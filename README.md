Platform app:

```bash
$ git clone https://github.com/dpiddy/cassandra-on-heroku
$ cd cassandra-on-heroku
$ heroku create -b https://github.com/kr/heroku-buildpack-inline.git
$ git push heroku master
$ heroku scale cassandra=1
$ heroku logs -t

$ heroku routes:create
$ heroku routes:attach <route> cassandra.1

$ cd where-you-have-cassandra-locally
$ bin/cassandra-cli -h <route host> -p <route port>
```

Kernel app:

```bash
$ git clone https://github.com/dpiddy/cassandra-on-heroku
$ cd cassandra-on-heroku
$ ion-client build -a cassandra
$ ion-client releases:create -a cassandra <arsenal id from previous step>
$ ion-client config:set -a cassandra DARWIN_CONFIG_NAME=generic CASSANDRA_SCALE=1 PRIAM_SCALE=1 DEFAULT_INSTANCE_SIZE=m1.xlarge PACKAGES=openjdk-6-jre-headless INSTANCE_COUNT=1
```

Boot a cassandra instance in ion



TODO:
* /etc/awscredential.properties (update code to use ENV)
* remove ref to /var/log/tomcat7/priam.log
* don't require sudo
* provision simpledb domains and settings if they do not exist
* provision IAM creds and add them to the app ENV

