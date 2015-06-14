#/bin/bash


# Start Monitoring
ssh pi00 "screen -d -m dstat --output $1.log"
ssh pi01 "screen -d -m dstat --output $1.log"
ssh pi02 "screen -d -m dstat --output $1.log"
ssh pi03 "screen -d -m dstat --output $1.log"
screen -d -m dstat --output $1.log

# Run App
/home/daniel/start_realtime.sh 2>&1 > ~/metrics/$1_`date +"%H-%M"`.csv 

# Stop Monitoring
ssh pi00 'screen -X quit'
ssh pi01 'screen -X quit'
ssh pi02 'screen -X quit'
ssh pi03 'screen -X quit'
screen -X quit

# Collect results
scp pi00:/home/daniel/$1.log ~/metrics/dstat/$1_pi00_`date +"%H-%M"`.csv
scp pi01:/home/daniel/$1.log ~/metrics/dstat/$1_pi01_`date +"%H-%M"`.csv
scp pi02:/home/daniel/$1.log ~/metrics/dstat/$1_pi02_`date +"%H-%M"`.csv
scp pi03:/home/daniel/$1.log ~/metrics/dstat/$1_pi03_`date +"%H-%M"`.csv
cp ~/$1.log ~/metrics/dstat/$1_dell01_`date +"%H-%M"`.csv
