#/bin/bash

TIME=`date +"%H-%M"`

# Start Monitoring
ssh pi00 "screen -d -m dstat -cdlsm --output $1.log"
ssh pi01 "screen -d -m dstat -cdlsm --output $1.log"
ssh pi02 "screen -d -m dstat -cdlsm --output $1.log"
ssh pi03 "screen -d -m dstat -cdlsm --output $1.log"
screen -d -m dstat -cdlsm --output $1.log

# Run App
/home/daniel/start_modelbuilder.sh $1-$TIME 2>&1 > ~/metrics/$1_$TIME.log 

# Stop Monitoring
ssh pi00 'screen -X quit'
ssh pi01 'screen -X quit'
ssh pi02 'screen -X quit'
ssh pi03 'screen -X quit'
screen -X quit

# Collect results
scp pi00:/home/daniel/$1.log ~/metrics/dstat/$1_pi00_$TIME.csv
scp pi01:/home/daniel/$1.log ~/metrics/dstat/$1_pi01_$TIME.csv
scp pi02:/home/daniel/$1.log ~/metrics/dstat/$1_pi02_$TIME.csv
scp pi03:/home/daniel/$1.log ~/metrics/dstat/$1_pi03_$TIME.csv
cp ~/$1.log ~/metrics/dstat/$1_dell01_$TIME.csv

# Clean up
ssh pi00 "rm /home/daniel/$1.log"
ssh pi01 "rm /home/daniel/$1.log"
ssh pi02 "rm /home/daniel/$1.log"
ssh pi03 "rm /home/daniel/$1.log"
