@REM @echo off

@REM 程序正文
@setlocal

    @REM 设置代码页为UTF-8
    @for /F "tokens=2 delims=:" %%i in ('chcp') do @( set /A codepage=%%i ) 
    @call :func_ensureACP


    REM 这是手动启动的地方，可以手动设置变量，不过需要脚本支持(见脚本起始处的介绍)。 
    REM 样例1(分别输入以下两行): 
    REM set host=[fe80:329:69b:3201::3]
    REM to_ljw.bat -sethost !host!
    REM 样例2: set host=[fe80:329:69b:3201::3] & to_ljw.bat -sethost !host!
    @call cmd /V:ON /k

@EXIT /B 0
@REM 程序正文截止处 


@REM 函数区 

:func_ensureACP
    @if /I %codepage% NEQ 65001 ( 
        echo "[LOG]: Active code page is not 65001(UTF-8). [%codepage%]"
        chcp 65001
    )
@EXIT /B 0
