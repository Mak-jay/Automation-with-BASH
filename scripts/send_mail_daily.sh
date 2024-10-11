#!/bin/bash

#fetching quotes randomly from zenquotes's API
quote=$(curl -s https://zenquotes.io/api/random | jq -r '.[0].q + " - " + .[0].a')

#Add your mail_Id and subject and body will be reflected on your mailbox
to="Your_Email_ID@gmail.com"
subject="Daily Motivation"
body="Hello! Here's your daily motivational quote:\n\n$quote\n\nHave a great day!"
from="Your_Email_id@gmail.com"

#sending mail using msmtp
echo -e "To: $to\nFrom: $from\nSubject: $subject\n\n$body" | msmtp --from=default -t


#then after this you have to set cronjob to your terminal/command prompt as
#crontab -e 
#you may ask for choose editor if it's for first time (vim, nano etc..)
#add "0 8 * * * /path/to/send_quote.sh" this path in crontab
#and path of your file. then Save and exit.
#Check if the Cron Job is Set Up
# " crontab -l "
