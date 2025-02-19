

function Add-EBSitesSelectedPermissionToSite {
    param (
        [Alias("ClientId")]
        [Parameter(Position = 0, mandatory = $true)]
        [string]$ApplicationId,

        [Parameter(Position = 1, mandatory = $true)]    
        [string]$SiteUrl,

        [Parameter(Position = 2, mandatory = $true)]
        [ValidateSet("write", "read")]
        [string]$Permission
    )

    $SiteId = Get-EBSharePointSiteIdByUrl -SiteUrl $SiteUrl
    New-MgSitePermission -SiteId $SiteId -Roles @($roles) -GrantedTo @{Application = @{Id = $ObjectId; DisplayName = $ObjectId } } | Out-Null

    Write-Host "✅ - Permission $Permission granted to $ObjectId on $SiteUrl" -ForegroundColor Green
}