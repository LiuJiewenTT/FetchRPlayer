@REM 支持情况：支持第一参数指定host[y/n]?[]

@REM 程序正文
@setlocal

    @REM 设置代码页为UTF-8
    @for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i )
    @call :func_ensureACP


    REM Local 指 开服方，Host指 其他玩家。
    set LocalLocal=[::1]
    set LocalPort=10022
    set HostLocal=[::1]
    set HostPort=22

    set username=usr1

    @ if "%1" == "-sethost" (
        set host=%2
    ) else (
        REM 同一设备在每次发生了网络变化时，仅需修改此变量(host)即可。排在最后的生效，或在前面添加“REM”以注释所在行。
        REM 此处设置“远程玩家”的IPv6地址。
        set host=[fe80::398c:e18c:11ab:b1db]
    )
    set host

    @REM 这是一个ssh测试连通的命令
    @REM ssh -6 -NL %LocalLocal%:%LocalPort%:%HostLocal%:%HostPort% %username%@%host%   

    ssh -6 -NR %HostLocal%:%HostPort%:%LocalLocal%:%LocalPort% %username%@%host% -o ServerAliveInterval=60 -o TCPKeepAlive=no

@EXIT /B 0
@REM 程序正文截止处


@REM 函数区

:func_ensureACP
    @if /I %codepage% NEQ 65001 ( 
        echo "[LOG]: Active code page is not 65001(UTF-8). [%codepage%]"
        chcp 65001
    )
@EXIT /B 0
