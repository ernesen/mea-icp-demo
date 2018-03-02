@Echo Off

rem https://stackoverflow.com/questions/2541767/what-is-the-proper-way-to-test-if-variable-is-empty-in-a-batch-file

REM helm package myemp/

set tmp="%1"
if "%tmp:"=.%"==".." (
    git commit -a -m "Adding the latest update of uae-icp-demo"
) else (
    git commit -a -m "%1"
)

git pull origin master
git push origin master
