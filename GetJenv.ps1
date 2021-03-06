$jenvZipUrl = 'http://get.jenv.io/jenv-ps.zip'

$modulePaths = @($Env:PSModulePath -split ';')
# set module path to jenv default
$targetModulePath = Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath WindowsPowerShell\Modules
$powerShellProfilePath = Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# if its not use select the first defined
if ( $modulePaths -inotcontains $targetModulePath  ) {
	$targetModulePath = $modulePaths | Select-Object -Index 0
}
$jenvPath = "$targetModulePath\jenv"

try {
    # create temp dir
    $tempDir = [guid]::NewGuid().ToString()
    $tempDir = "$env:TEMP\$tempDir"
    New-Item -ItemType Directory $tempDir | Out-Null

    # download current version
    $jenvZip = "$tempDir\jenv.zip"
    Write-Host "Downloading jenv"
    $client = (New-Object Net.WebClient)
    $client.DownloadFile($jenvZipUrl, $jenvZip)

    # unzip archive
    $shell = New-Object -com shell.application
    $shell.namespace($tempDir).copyhere($shell.namespace($jenvZip).items(), 0x14)

    # check if unzip successfully
    if ( Test-Path "$tempDir\jenv" ) {
        # remove old jenv
        if ( !(Test-Path $jenvPath) ) {
           New-Item -ItemType Directory $jenvPath | Out-Null
        }
        Copy-Item "$tempDir\jenv\*" $jenvPath -Force -Recurse
        Write-Host "jenv installed!" -Foreground Green		
		Import-Module -Name $jenvPath
		
		### add init logic to 
		if( Test-Path $powerShellProfilePath ) {
		    $content = Get-Content $powerShellProfilePath
			if(! ($content.Contains("jenv"))) {
			  "jenv init" | Out-File $powerShellProfilePath -Append -Force
			}
		} else {
		    "jenv init" | Out-File $powerShellProfilePath -Force
		}
		### jenv dir init
		$jenvDir = $Env:JENV_DIR
		if( $jenvDir -eq $null) {
		  $jenvDir="c:\jenv"
		}
		if ( !(Test-Path $jenvDir) ) {
           New-Item -ItemType Directory $jenvDir | Out-Null
        }
		### create directories
		if(! (Test-Path "$jenvDir\repo")) {
		  New-Item -ItemType Directory "$jenvDir\temp" | Out-Null
		  New-Item -ItemType Directory "$jenvDir\repo" | Out-Null
		}
		### download repo
		$downloadUrl="http://get.jenv.io/central-repo.zip"
        $client.DownloadFile($downloadUrl, "$jenvDir\temp\central-repo.zip")
        $shell = New-Object -com shell.application
		New-Item -ItemType Directory "$jenvDir\temp\central" | Out-Null
        $shell.namespace("$jenvDir\temp\central").copyhere($shell.namespace("$jenvDir\temp\central-repo.zip").items(), 0x14)
        Move-Item ("$jenvDir\temp\central") ("$jenvDir\repo") -Force
		Remove-Item -Recurse -Force "$jenvDir\temp\central-repo.zip"
        Write-Host "Please see http://jenv.io for details to get start."
    } else {
        Write-Warning 'Could not unzip archive containing jenv. Most likely the archive is currupt. Please try to install again.'
    }
} finally {
    # clear temp dir
    Remove-Item -Recurse -Force $tempDir
}