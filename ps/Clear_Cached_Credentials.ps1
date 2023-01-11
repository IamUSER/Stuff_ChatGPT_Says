function Clear-CachedCredentials {
    param (
        [string]$Target,
        [switch]$All
    )

    if ($All) {
        $Target = "*"
    }
    else {
        $Target = Read-Host "Enter the Target name"
    }
    $confirmation = Read-Host "Are you sure you want to clear cached credentials for $Target? [Y/N]"

    if ($confirmation -eq "Y") {
        cmdkey /delete:$Target
        Write-Host "Cached Credentials for $Target cleared"
    } else {
        Write-Host "Cancelled"
    }

    $confirmation = Read-Host "Are you sure you want to clear all Cached Credentials from Credential Manager? [Y/N]"

    if ($confirmation -eq "Y") {
        # Get all credentials in the Credential Manager
        $credentials = Get-StoredCredential -Target "*"

        foreach($credential in $credentials) {
            Remove-StoredCredential -Target $credential.Target
        }
        Write-Host "All Cached Credentials from Credential Manager cleared"
    } else {
        Write-Host "Cancelled"
    }
}

Clear-CachedCredentials -All