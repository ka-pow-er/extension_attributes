#!/bin/sh
# read SplatEnabled preference key to determine if Background Security Improvements are enabled
bsiStatus=$(/usr/bin/defaults read /Library/Preferences/com.apple.SoftwareUpdate.plist SplatEnabled 2>/dev/null)
# If SplatEnabled is set to true, the result is 1 (true)
	if [ "$bsiStatus" == "1" ]; then
echo "<result>ENABLED</result>"
else
	echo "<result>DISABLED</result>"
	fi
exit 0
