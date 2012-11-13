keys = Hash[File.read("/etc/awscredential.properties").split.map{|e| e.split("=") }]
sdb = Fog::AWS::SimpleDB.new(:aws_access_key_id => keys["AWSACCESSID"], :aws_secret_access_key => keys["AWSKEY"])

sdb.create_domain("InstanceIdentity")
sdb.create_domain("PriamProperties")

sdb.put_attributes("PriamProperties", "cassandra/priam.s3.bucket", {"appId" => "cassandra", "property" => "priam.s3.bucket", "value" => "herokudev-mhale-cassandra-archive"})
sdb.put_attributes("PriamProperties", "cassandra/priam.cass.home", {"appId" => "cassandra", "property" => "priam.cass.home", "value" => "/home/cassandra/apache-cassandra-1.1.6"})
sdb.put_attributes("PriamProperties", "cassandra/priam.cass.startscript", {"appId" => "cassandra", "property" => "priam.cass.startscript", "value" => "/usr/sbin/service service cassandra-cassandra-instance status INSTANCE=1 || /usr/sbin/service cassandra-cassandra start"})
sdb.put_attributes("PriamProperties", "cassandra/priam.cass.stopscript", {"appId" => "cassandra", "property" => "priam.cass.stopscript", "value" => "/usr/sbin/service cassandra-cassandra stop"})                           
sdb.put_attributes("PriamProperties", "cassandra/priam.cache.location", {"appId" => "cassandra", "property" => "priam.cache.location", "value" => "/home/cassandra/apache-cassandra-1.1.6/saved_caches"})                    
sdb.put_attributes("PriamProperties", "cassandra/priam.commitlog.location", {"appId" => "cassandra", "property" => "priam.commitlog.location", "value" => "/home/cassandra/apache-cassandra-1.1.6/commitlog"})               
sdb.put_attributes("PriamProperties", "cassandra/priam.data.location", {"appId" => "cassandra", "property" => "priam.data.location", "value" => "/home/cassandra/apache-cassandra-1.1.6/data"})                              

sdb.select("select * from PriamProperties where appId='cassandra'")

