#/bin/bash

TIME=`date +"%H-%M"`
WORKERS="pi00 pi01 pi02 pi03"

# Start Monitoring

for host in $WORKERS; do
  ssh $host "screen -d -m dstat -cdlsmn --output $1.log"
done
screen -d -m dstat -cdlsm --output $1.log

# Run App
/home/daniel/start_modelbuilder.sh $1-$TIME 2>&1 > ~/metrics/$1_$TIME.log 

# Stop Monitoring
for host in $WORKERS; do
  ssh $host 'screen -X quit'
done
screen -X quit

# Collect results
for host in $WORKERS; do
  scp $host:/home/daniel/$1.log ~/metrics/dstat/$1_$host_$TIME.csv
done
cp ~/$1.log ~/metrics/dstat/$1_dell01_$TIME.csv

# Clean up
for host in $WORKERS; do
  ssh $host "rm /home/daniel/$1.log"
done