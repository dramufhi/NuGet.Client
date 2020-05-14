Param(
    [Parameter(Mandatory = $True)]
    [string] $nugetClientFilePath,
    [Parameter(Mandatory = $True)]
    [string] $sourceRootFolderPath,
    [Parameter(Mandatory = $True)]
    [string] $resultsFolderPath,
    [Parameter(Mandatory = $True)]
    [string] $logsFolderPath,
    [string] $nugetFoldersPath,
    [int] $iterationCount
)

. "$PSScriptRoot\..\PerformanceTestUtilities.ps1"

$repoUrl = "https://github.com/NuGet/NuGetGallery.git"
$testCaseName = GenerateNameFromGitUrl $repoUrl
$resultsFilePath = [System.IO.Path]::Combine($resultsFolderPath, "$testCaseName.csv")

RunPerformanceTestsOnGitRepository `
    -nugetClientFilePath $nugetClientFilePath `
    -sourceRootFolderPath $sourceRootFolderPath `
    -testCaseName $testCaseName `
    -repoUrl $repoUrl `
    -commitHash "765917957b830837af97818e24a7a7be78f440ec" `
    -resultsFilePath $resultsFilePath `
    -logsFolderPath $logsFolderPath `
    -nugetFoldersPath $nugetFoldersPath `
    -iterationCount $iterationCount
