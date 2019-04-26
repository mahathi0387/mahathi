
param($counter)

$counter1= "release"
$counter2= "snapshot"

[xml]$xmldata = Get-Content "C:\Users\HAI\training\mahathi\pom.xml"

$Version = $xmldata.project.version
$VersionSplitHyphen = $Version -split '-'
write-host "version is" $VersionSplitHyphen[0]

$vers=[system.version]$VersionSplitHyphen[0]
#Write-Host ("Current Major: " + $vers.Major)
#Write-Host ("Current Minor: " + $vers.Minor)
#Write-Host ("Current Build: " + $vers.Build)




If ($counter -eq $counter1) 

{
 $newminor= [int]$vers.minor + 1
 
 }



If ($counter -eq $counter2) 

{

$newbuild= [int]$vers.build + 1

}


$newVersion = (New-Object -TypeName 'system.Version' -ArgumentList @($vers.Major, $newminor, $newbuild)).ToString()
Write-host("New version:" + $newVersion)

$xmldata.project.version = $newVersion
$xmldata.Save("C:\Users\HAI\training\mahathi\pom.xml")
git add .
git commit -m $mes
git push




