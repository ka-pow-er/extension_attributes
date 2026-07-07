#!/bin/sh
#
# Extension Attribute to read a specific key from YOUR-ORG's host-file plist,
#      and if available, report the result
#
### ENTER THE DESIRED KEY INSIDE THE QUOTATION MARKS "" ###
KEY="KEY_HERE"
#
### DO NOT EDIT BELOW THIS LINE ###
PLIST=/var/db/.com.YOUR-ORG.host-info.plist
KEY_CHECK="defaults read $PLIST $KEY"

if ($KEY_CHECK) > /dev/null 2>&1; then
	RESULT=$($KEY_CHECK)
else
	RESULT="N/A"
fi
echo "<result>$RESULT</result>"
