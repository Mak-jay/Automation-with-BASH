#!/bin/bash

#fetching quotes randomly
quote=$(curl -s https://zenquotes.io/api/random | jq -r '.[0].q + " - " + .[0].a')

to="makwanajay311@gmail.com"
subject="Daily Motivation"
body="Hello! Here's your daily motivational quote:\n\n$quote\n\nHave a great day!"
from="makwanajay311@gmail.com"

#sending mail using msmtp
echo -e "To: $to\nFrom: $from\nSubject: $subject\n\n$body" | msmtp --from=default -t
