#/bin/bash

export SPARK_HOME=/opt/spark/

# deploy to cluster
/opt/spark/bin/spark-submit --class "de.haw.bachelorthesis.dkirchner.ModelBuilder" --master spark://192.168.1.5:7077 --driver-memory 384m --executor-memory 384m ~/autobuilds/model_builder/target/scala-2.10/model-builder_2.10-1.0.jar hdfs://192.168.1.5:54310/user/daniel/user_mails_multi.txt danomonitoring@googlemail.com monitoring4Me! 2>&1 > $1.log
