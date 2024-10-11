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
