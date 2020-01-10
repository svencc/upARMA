@echo off
rem ### ### ### ### ### ### ### ### ### ###
rem UpARMA: ARMA3 Repository SyncTool   ###
rem INSTALLER                           ###
rem ### ### ### ### ### ### ### ### ### ###

rem Create a TAB character
((for /L %%P in (1,1,70) do pause>nul)&set /p "TAB=")<"%COMSPEC%"
set "TAB=%TAB:~0,1%"

set /A ssh_port=22

set file_sshKnownHosts=known_hosts
set file_sshConfig=config

set filePath_ssh=%userprofile%\.ssh
set filePath_sshKnownHosts="%filePath_ssh%\%file_sshKnownHosts%"
set filePath_sshConfig="%filePath_ssh%\%file_sshConfig%"

if NOT EXIST %filePath_ssh% (
    rem File >>known_hosts<< does not exists.
    mkdir "%filePath_ssh%"
    echo Create known_hosts
)

(
    echo 10.72.1.72 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFR5xth1cFgqq9lxhAzBgnLyu63Jao9fs7APn+u6CDki5ZM8Rz5cpMooqZb8v5pEHiO43frpFnktBVfdQqUeMsQ=
) >> %filePath_sshKnownHosts%

if NOT EXIST %filePath_sshConfig% (
    rem File >>config<< does not exists.
    echo Create config
)

(
    echo Host sync
    echo %TAB%HostName 10.72.1.72
    echo %TAB%Port %ssh_port%
    echo %TAB%User svencarrillocastillo
    echo %TAB%IdentityFile %filePath_ssh%\uparma
) >> %filePath_sshConfig%