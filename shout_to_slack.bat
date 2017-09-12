REM Integrate Control-M Shout Destination with Slack
REM Robert Stinnett (robert@robertstinnett.com)
REM Shout Msg comes through in %2 param from Control-M
REM Format:  channel,message
REM * Requires curl


set str=%2
set hookurl=YOUR SLACK HOOK URL HERE
set loglocation=C:\scripts\slack.log

for /f "useback tokens=1,2 delims=," %%a in ('%str%') do ( 
set channel=%%a
set message=%%b
 )
set channel=%channel:"=%
set message=%message:"=%

echo incoming string - %2 >> %loglocation%
echo channel=%channel%,message=%message% >> %loglocation%

"C:\Program Files (x86)\cURL\bin\curl" -H "Content-type: application/json" -X POST -d "{\"channel\":\"%channel%\",\"text\":\"%message%\"}" %hookurl%