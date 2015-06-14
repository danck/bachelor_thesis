#/bin/bash

export SPARK_HOME=/opt/spark/

/opt/spark/bin/spark-submit --class "de.haw.bachelorthesis.dkirchner.RealtimeAnalyzer" --master spark://192.168.1.5:7077 --driver-memory 384m --executor-memory 128m --total-executor-cores 8 ~/autobuilds/realtime_analyzer/target/scala-2.10/realtime-analyzer-assembly-1.0.jar XcSkRymsjeUP6nBK85cVE8xiT nPS8aINT6R6i3if13TFq092XWmZ05phuo6Q97PPdAJnWKD3MQD 1620496464-1CeirJltsvURvpTHNH7R4SXAfoGAt7QT8mqKOCa u6jrFr62tVbzhkrqmXTjlFSvT7wN0JlmH8BekTW88rPkZ
