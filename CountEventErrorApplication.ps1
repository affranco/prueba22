Param(

    [Parameter(Mandatory = $True, HelpMessage = 'Enter a WebService name.')]    
    [string]$MachineName
    )
$Style = "
<style>
    BODY{background-color:#b0c4de;}
    TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}
    TH{border-width: 1px;padding: 3px;border-style: solid;border-color: black;background-color:#778899}
    TD{border-width: 1px;padding: 3px;border-style: solid;border-color: black;}
    tr:nth-child(odd) { background-color:#d3d3d3;} 
    tr:nth-child(even) { background-color:white;}    
</style>
"

$MachineName = "$MachineName"

#Count Event
$eventLog = Get-EventLog -Log Application -EntryType Error | Group-Object -Property EventID,Source -NoElement | Sort-Object -Property Count -Desc |select	Count, name | ConvertTo-HTML -AS Table -Fragment -PreContent '<h2>Count</h2>'|Out-String

#Save the HTML Web Page
ConvertTo-HTML -head $Style -PostContent $eventLog -PreContent '<h1>Los eventos mas relevantes en el siguiente servidor '$MachineName'</h1>'|Out-File \\EPM-DS12\EventCount\$MachineName.html #Open TableHTML.html Invoke-Item c:\temp\TableHTML.html
#Open TableHTML.html
#Invoke-Item C:\Users\afranco\Documents\IIS\CursoPowerShell\TableHTM12L.html