set SAVESTAMP=%DATE:/=-%@%TIME::=-%
set SAVESTAMP=%SAVESTAMP: =%
echo %SAVESTAMP%

copy workspaces\workspace\.metadata\.plugins\org.eclipse.e4.workbench\workbench.xmi "workspaces\workbench-%SAVESTAMP%.xmi"

REM if eclipse does not start do: eclipse -clearPersistedState and copy the last (working) workbench backup to restore the state

start eclipse.exe %*

