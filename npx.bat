@echo off
set "PATH=C:\Users\dhaan\AppData\Local\Programs\node;C:\windows\system32;C:\windows;C:\windows\System32\Wbem;C:\windows\System32\WindowsPowerShell\v1.0"
cd /d "%~dp0"
call npx.cmd %*
