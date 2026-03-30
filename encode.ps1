$ErrorActionPreference = "Stop"

$htmlPath = "C:\Users\PTCL\.gemini\antigravity\scratch\PowerBullWebsite\index.html"
$imagePath = "C:\Users\PTCL\.gemini\antigravity\scratch\PowerBullWebsite\assets\power_bull_pro.png"

$imageBytes = [System.IO.File]::ReadAllBytes($imagePath)
$base64String = [System.Convert]::ToBase64String($imageBytes)
$dataUri = "data:image/png;base64,$base64String"

$utf8 = New-Object System.Text.UTF8Encoding $False
$htmlContent = [System.IO.File]::ReadAllText($htmlPath)
$htmlContent = $htmlContent.Replace('./assets/power_bull_pro.png', $dataUri)
[System.IO.File]::WriteAllText($htmlPath, $htmlContent, $utf8)

Remove-Item -Recurse -Force "C:\Users\PTCL\.gemini\antigravity\scratch\PowerBullWebsite\assets" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "C:\Users\PTCL\Desktop\PowerBullWebsite" -ErrorAction SilentlyContinue
Copy-Item -Path $htmlPath -Destination "C:\Users\PTCL\Desktop\PowerBullWebsite.html" -Force

Write-Host "Success"
