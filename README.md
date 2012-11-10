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
