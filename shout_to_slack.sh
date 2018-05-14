#/bin/bash
# Integrate Control-M Shouts with Slack
# Robert Stinnett
# Shout Msg comes through in %2 param
# Format:  channel,message

# Sample msg:  Parm 2 = test1,This is a test


incoming_msg=$2
hookurl=https://hooks.slack.com/services/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



channel=`echo $incoming_msg | cut -d ',' -f 1`
message=`echo $incoming_msg | cut -d ',' -f 2`

echo channel=$channel - message=$message >> C:\scripts\slack.log

curl -H "Content-type: application/json" -X POST -d "{\"channel\":\"$channel\",\"text\":\"$message\"}" $hookurl

