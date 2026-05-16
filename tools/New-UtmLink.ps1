param(
    [Parameter(Mandatory=$true)]
    [string]$Url,

    [Parameter(Mandatory=$true)]
    [ValidateSet("profile","social","dm","comment")]
    [string]$Medium,

    [Parameter(Mandatory=$true)]
    [string]$Campaign,

    [Parameter(Mandatory=$true)]
    [string]$Content,

    [string]$OutputCsv = ".\artifacts\utm_links\linkedin_utm_links.csv"
)

function Encode-Value([string]$value) {
    return [System.Uri]::EscapeDataString($value)
}

# Keep URL fragments like #work at the end
$basePart = $Url
$fragment = ""

if ($Url.Contains("#")) {
    $parts = $Url.Split("#", 2)
    $basePart = $parts[0]
    $fragment = "#" + $parts[1]
}

$separator = "?"
if ($basePart.Contains("?")) {
    $separator = "&"
}

$query = "utm_source=linkedin&utm_medium=$(Encode-Value $Medium)&utm_campaign=$(Encode-Value $Campaign)&utm_content=$(Encode-Value $Content)"
$finalUrl = "$basePart$separator$query$fragment"

$row = [PSCustomObject]@{
    CreatedAt    = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    BaseUrl      = $Url
    Source       = "linkedin"
    Medium       = $Medium
    Campaign     = $Campaign
    Content      = $Content
    FinalUrl     = $finalUrl
}

if (!(Test-Path $OutputCsv)) {
    $row | Export-Csv -NoTypeInformation -Encoding UTF8 $OutputCsv
} else {
    $row | Export-Csv -NoTypeInformation -Encoding UTF8 -Append $OutputCsv
}

Write-Host ""
Write-Host "UTM link generated:" -ForegroundColor Green
Write-Host $finalUrl
Write-Host ""
Write-Host "Saved to: $OutputCsv"
