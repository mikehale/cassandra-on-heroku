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
anvil_slug_url= "$(anvil build -p -b https://github.com/kr/heroku-buildpack-inline.git)"
release_key=$(curl -F url="$anvil_slug_url" https://arsenal.herokai.com/stores/cassandra | ruby -r json -e 'puts JSON.parse(STDIN.read)["key"]')
ion-client releases:create -a cassandra $release_key
ion-client config:set -a cassandra DARWIN_CONFIG_NAME=generic CASSANDRA_SCALE=1 PRIAM_SCALE=1 DEFAULT_INSTANCE_SIZE=m1.xlarge PACKAGES=openjdk-6-jre-headless INSTANCE_COUNT=1
```

TODO:
* add cassandra to sudo group?
