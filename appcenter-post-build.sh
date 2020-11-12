#Android post build script
#Make sure the directly to the NUnit csproj is correct
ProjectPath="$APPCENTER_SOURCE_DIRECTORY\NUnitTest\NUnitTest.csproj"
echo "$ProjectPath"
#To generate the xml file it requires nuget NunitXml.TestLogger
dotnet test "$APPCENTER_SOURCE_DIRECTORY" --logger:"nunit;LogFilePath=TestResults.xml"
echo "NUnit tests result:"
pathOfTestResults=$(find $APPCENTER_SOURCE_DIRECTORY -name 'TestResults.xml')
cat $pathOfTestResults
echo

#Looks for a failing test and causes the build to fail if found
grep -q 'result="Failed"' $pathOfTestResults

if [[ $? -eq 0 ]]
then 
echo "A test Failed" 
exit 1
else 
echo "All tests passed" 
fi
