@echo off

@REM 程序正文
setlocal

    @REM 设置代码页为UTF-8
    @for /F "tokens=2 delims=:" %%i in ('chcp') do ( set /A codepage=%%i )
    @call :func_ensureACP

    REM for /R %i in (*.bat) do ( if "%~nxi" NEQ "run.bat" ( echo %i ) else ( echo run.bat ) )

    for /F %%i in ('dir /b /A:-D to_*.bat') do ( 
        if "%%i" NEQ "%~nx0" ( 
            echo Run [%%i]...
        ) else ( 
            echo Jump [%~nx0].
        ) 
    )

EXIT /B 0
@REM 程序正文截止处


@REM 函数区

:func_ensureACP
    @if /I %codepage% NEQ 65001 ( 
        echo "[LOG]: Active code page is not 65001(UTF-8). [%codepage%]"
        chcp 65001
    )
@EXIT /B 0
