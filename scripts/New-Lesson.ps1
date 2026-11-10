param(
    [ValidateSet("club", "bookclub")]
    [string]$Type
)

$ErrorActionPreference = "Stop"

$root = (Get-Location).Path
$templatePath = Join-Path $root "templates/lesson.md"
$slidesDir = Join-Path $root "slides"
$presentationPath = Join-Path $root "js/presentation.js"

foreach ($path in @($templatePath, $slidesDir, $presentationPath)) {
    if (-not (Test-Path $path)) {
        throw "Missing required file: $path"
    }
}

if (-not $Type) {
    Write-Host "1. Club lesson"
    Write-Host "2. Book club"
    $choice = Read-Host "Select 1 or 2"

    switch ($choice) {
        "1" { $Type = "club" }
        "2" { $Type = "bookclub" }
        default { throw "Invalid selection." }
    }
}

$number = Read-Host "Session number, for example 3"
if ($number -notmatch '^[1-9]\d*$') {
    throw "Session number must be a positive integer."
}

if ($Type -eq "club") {
    $sessionTitle = "第 $number 次社課"
    $seriesName = "資研社｜程式設計入門"
}
else {
    $sessionTitle = "第 $number 次讀書會"
    $seriesName = "資研讀書會｜演算法研習"
}

$id = Read-Host "Lesson ID, Only [a-z,0-9,_], e.g. graph_basics"
if ($id -notmatch '^[a-z0-9]+(?:_[a-z0-9]+)*$') {
    throw "Use lowercase letters, numbers and underscores only."
}

$title = Read-Host "Course title"
if ([string]::IsNullOrWhiteSpace($title)) {
    throw "Course title cannot be empty."
}

$description = Read-Host "Homepage description"
if ([string]::IsNullOrWhiteSpace($description)) {
    $description = "$title：課程教材與練習"
}

$slidePath = Join-Path $slidesDir "$id.md"

if (Test-Path $slidePath) {
    throw "Lesson already exists: $slidePath"
}

$utf8 = New-Object System.Text.UTF8Encoding($false)

$js = [System.IO.File]::ReadAllText(
    $presentationPath,
    [System.Text.Encoding]::UTF8
)

$idPattern = [regex]::Escape($id)
if ($js -match ('\bid\s*:\s*"' + $idPattern + '"')) {
    throw "This lesson ID is already registered."
}

$template = [System.IO.File]::ReadAllText(
    $templatePath,
    [System.Text.Encoding]::UTF8
)

$template = $template.Replace("{{SESSION_TITLE}}", $sessionTitle)
$template = $template.Replace("{{COURSE_TITLE}}", $title)
$template = $template.Replace("{{SERIES_NAME}}", $seriesName)

$idJs = ConvertTo-Json -InputObject $id -Compress
$titleJs = ConvertTo-Json -InputObject $title -Compress
$descriptionJs = ConvertTo-Json -InputObject $description -Compress

$entry = @"
  {
    id: $idJs,
    title: $titleJs,
    description: $descriptionJs
  }
"@

$pattern = '(?s)(const\s+lessons\s*=\s*\[.*?)(\r?\n\];)'
$regex = [regex]::new($pattern)

if (-not $regex.IsMatch($js)) {
    throw "Could not find the lessons array. No files were changed."
}

$updatedJs = $regex.Replace(
    $js,
    [System.Text.RegularExpressions.MatchEvaluator]{
        param($match)

        $before = $match.Groups[1].Value.TrimEnd()
        $separator = if ($before.EndsWith(",")) { "" } else { "," }

        return $before + $separator + "`r`n" +
            $entry + $match.Groups[2].Value
    },
    1
)

# Write the lesson first, then update the homepage configuration.
[System.IO.File]::WriteAllText($slidePath, $template, $utf8)

try {
    [System.IO.File]::WriteAllText(
        $presentationPath,
        $updatedJs,
        $utf8
    )
}
catch {
    Remove-Item $slidePath -ErrorAction SilentlyContinue
    throw
}

Write-Host ""
Write-Host "Lesson created:" -ForegroundColor Green
Write-Host "Markdown: slides/$id.md"
Write-Host "Homepage: js/presentation.js"
Write-Host "Review the files before committing to Git."