Set-StrictMode -Version 3

$currentDir = split-path $SCRIPT:MyInvocation.MyCommand.Path -parent

. (Join-Path $currentDir "template-mechanism.ps1")
. (Join-Path $currentDir "cygwin-passwd.ps1")
. (Join-Path $currentDir "file-ownership.ps1")
. (Join-Path $currentDir "library-importer.ps1")

function Get-NotEmpty($a, $b) 
{ 
    if ([string]::IsNullOrWhiteSpace($a)) 
    { 
        $b 
    } else 
    { 
        $a 
    }
}

# Templating mechanism
Export-ModuleMember Write-Template

# Null Coallescing 
Export-ModuleMember Get-NotEmpty

# Passwd file management
Export-ModuleMember Get-NoneGroupSID
Export-ModuleMember Get-SSHDUser
Export-ModuleMember Get-SSHDUsers

# File ownership helper
Export-ModuleMember Set-Owner

# Library inclusion
Export-ModuleMember Import-CommandletsLib 
Export-ModuleMember Import-CommonLib 
Export-ModuleMember Import-NodeLib 
