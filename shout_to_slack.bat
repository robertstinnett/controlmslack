REM Integrate Control-M Shout Destination with Slack
REM Robert Stinnett (robert@robertstinnett.com)
REM Shout Msg comes through in %2 param from Control-M
REM Format:  channel,message,link_names
REM * Requires curl

set str=%2
set hookurl=YOUR SLACK HOOK URL HERE
set loglocation=C:\scripts\slack.log
set /A "link_names=1"

for /f "useback tokens=1,2* delims=," %%a in ('%str%') do ( 
set channel=%%a
set message=%%b
if defined %%c set link_names=%%c
)

set channel=%channel:"=%
set message=%message:"=%
set link_names=%link_names:"=%

echo incoming string - %2 >> %loglocation%
echo channel=%channel%,message=%message%,link_names=%link_names% >> %loglocation%

"C:\Program Files (x86)\cURL\bin\curl" -H "Content-type: application/json" -X POST -d "{\"channel\":\"%channel%\",\"text\":\"%message%\",\"link_names\":\"%link_names%\"}" %hookurl%
