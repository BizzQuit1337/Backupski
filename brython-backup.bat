@ECHO OFF

COLOR 02
TITLE Backupski

SET "D=%date%"
SET "T=%time%"
SET "HOUR=%T:~0,2%"
SET "MINUTE=%T:~3,2%"
SET "DAY=%D:~0,2%"
SET "MONTH=%D:~3,2%"
SET "YEAR=%D:~6,6%"

GOTO waiting

:waiting 
TIMEOUT 5400
GOTO prompt

:prompt
CALL check.vbs
SCP -r root@192.168.1.7:/srv/httpd/html/html C:/Users/abrown/Desktop/Brython_Backups
GOTO rename

:rename
RENAME "C:/Users/abrown/Desktop/Brython_Backups/html" "HTML - %DAY%_%MONTH%_%YEAR%-%HOUR%_%MINUTE%"
GOTO waiting