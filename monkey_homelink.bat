@echo
adb
adb kill-server
adb start-server
adb devices
adb shell monkey -p com.homelink.android --pct-touch 30 --pct-motion 30 --pct-anyevent 40 --throttle 2000 --ignore-crashes 1000
exit