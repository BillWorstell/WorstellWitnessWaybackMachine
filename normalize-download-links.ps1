param(
  [switch]$DryRun
)

# Run from repo root: D:\WorstellWitnessWaybackMachine
$repoRoot   = (Get-Location).Path
$decadesDir = Join-Path $repoRoot "docs\decades"
$projPrefix = "/WorstellWitnessWaybackMachine"
$changed    = @()

# Get decade folders like 1600-1610, 1610-1620, 1640-1650, etc.
Get-ChildItem $decadesDir -Directory |
  Where-Object { $_.Name -match '^\d{4}-\d{4}$' } |
  ForEach-Object {
    $dec = $_.Name
    $esc = [regex]::Escape($dec)
    $files = Get-ChildItem $_.FullName -Filter *.md -File
    foreach ($f in $files) {
      $text = Get-Content $f.FullName -Raw
      $orig = $text

      # 1) ../../downloads/decades/<dec>/file
      $patRel  = "\]\((?:\.\.\/)+downloads\/decades\/$esc\/([^)#]+)\)"
      $text = [regex]::Replace($text, $patRel, {
        param($m) "]($projPrefix/downloads/decades/$dec/" + ($m.Groups[1].Value -replace ' ', '%20') + ")"
      })

      # 2) /downloads/decades/<dec>/file   (root-anchored, not project-anchored)
      $patRoot = "\]\(\/downloads\/decades\/$esc\/([^)#]+)\)"
      $text = [regex]::Replace($text, $patRoot, {
        param($m) "]($projPrefix/downloads/decades/$dec/" + ($m.Groups[1].Value -replace ' ', '%20') + ")"
      })

      # 3) downloads/decades/<dec>/file    (no leading slash)
      $patBare = "\]\((?<!\/)downloads\/decades\/$esc\/([^)#]+)\)"
      $text = [regex]::Replace($text, $patBare, {
        param($m) "]($projPrefix/downloads/decades/$dec/" + ($m.Groups[1].Value -replace ' ', '%20') + ")"
      })

      if ($text -ne $orig) {
        if (-not $DryRun) { Set-Content -Path $f.FullName -Value $text -Encoding UTF8 }
        $changed += $f.FullName
      }
    }
  }

if ($DryRun) {
  if ($changed.Count) { $changed | Sort-Object -Unique | ForEach-Object { Write-Host "Would update $_" -ForegroundColor Yellow } }
  else { Write-Host "No changes needed." -ForegroundColor Green }
}
else {
  if ($changed.Count) {
    $branch = (git rev-parse --abbrev-ref HEAD).Trim()
    git add $changed
    git commit -m "chore(links): normalize decade download links to project-absolute"
    git push origin $branch
    Write-Host "Updated $($changed.Count) files and pushed to $branch." -ForegroundColor Green
  } else {
    Write-Host "No changes needed (already normalized)." -ForegroundColor Green
  }
}
