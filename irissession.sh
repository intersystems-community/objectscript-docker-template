#!/bin/bash

iris start $ISC_PACKAGE_INSTANCENAME quietly
 
cat << EOF | iris session $ISC_PACKAGE_INSTANCENAME -U %SYS
do ##class(%SYSTEM.Process).CurrentDirectory("$PWD")
Do ##class(Security.Users).UnExpireUserPasswords(\"*\")
$@
if '\$Get(sc) do ##class(%SYSTEM.Process).Process.Terminate(, 1)
do ##class(SYS.Container).QuiesceForBundling()
do ##class(SYS.Container).SetMonitorStateOK("irisowner")
halt
EOF

exit=$?

iris stop $ISC_PACKAGE_INSTANCENAME quietly

exit $exit