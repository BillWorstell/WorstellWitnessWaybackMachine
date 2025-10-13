param(
  [string]$Root = ".\docs",
  [switch]$DryRun
)

Write-Host "Scanning $Root for Markdown files..." -ForegroundColor Cyan

# Patterns that indicate mojibake is present
$mojibakePattern = 'â€“|â€”|â€|Â|Ã—|â€¢|ï»¿'

# UTF-8 (no BOM) encoder for clean writes
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$changed = 0
$files = Get-ChildItem -Path $Root -Filter *.md -Recurse -File

foreach ($f in $files) {
  $text = Get-Content -LiteralPath $f.FullName -Raw -Encoding UTF8

  if ($text -notmatch $mojibakePattern) { continue }

  # Core fix: encode garbled Unicode as CP-1252 bytes, then decode as UTF-8
  $bytes1252 = [Text.Encoding]::GetEncoding(1252).GetBytes($text)
  $fixed     = [Text.Encoding]::UTF8.GetString($bytes1252)

  # Clean common leftovers
  $fixed = $fixed `
    -replace 'ï»¿','' `       # stray visible BOM
    -replace 'Â','' `         # stray "Â" from NBSP/currency
    -replace ' ',' '          # NBSP -> space (if any)

  if ($fixed -ne $text) {
    $changed++
    if ($DryRun) {
      Write-Host "[DRY] Would fix: $($f.FullName)" -ForegroundColor Yellow
    } else {
      Copy-Item -LiteralPath $f.FullName -Destination "$($f.FullName).bak" -Force
      [IO.File]::WriteAllText($f.FullName, $fixed, $utf8NoBom)
      Write-Host "Fixed: $($f.FullName)" -ForegroundColor Green
    }
  }
}

if ($DryRun) {
  Write-Host "Dry run complete. Files that would change: $changed" -ForegroundColor Yellow
} else {
  Write-Host "Done. Files changed: $changed" -ForegroundColor Green
  Write-Host "Tip: review diffs, then `git add -A; git commit -m 'Fix mojibake in Markdown'; git push`"
}
