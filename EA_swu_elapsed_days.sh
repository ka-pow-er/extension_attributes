#!/bin/sh
# determine elapsed days since a software update is made available
# reads host-info.plist swu_avail date stamp (in %Y-%m-%d format)
# measures both dates against the epoch in seconds, subtracts, then convert seconds to days
# source: https://stackoverflow.com/questions/4946785/how-to-find-the-difference-in-days-between-two-dates (nickl-)
# first, test for swu_avail KEY in host-info plist
PLIST=/var/db/.com.YOUR-ORG.host-info.plist
KEY="swu_avail"
KEY_CHECK="defaults read $PLIST $KEY"
if ($KEY_CHECK) > /dev/null 2>&1; then
todays_date="$(date +%Y-%m-%d)"
swu_avail_date=$( defaults read $PLIST swu_avail )
echo "<result>$(((`date -jf %Y-%m-%d "$todays_date" +%s` - `date -jf %Y-%m-%d "$swu_avail_date" +%s`)/86400))</result>"
fi
