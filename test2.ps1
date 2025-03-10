# Prompt the user to enter a directory path
$directoryPath = Read-Host "Enter the directory path to create"

# Create the directory if it doesn't exist
if (-Not (Test-Path -Path $directoryPath)) {
    New-Item -Path $directoryPath -ItemType Directory
    Write-Host "Directory created at: $directoryPath"
} else {
    Write-Host "Directory already exists at: $directoryPath"
}

# Define file names
$fileNames = @("file1.txt", "file2.txt", "file3.txt")

# Create files and write sample content
foreach ($file in $fileNames) {
    $filePath = Join-Path -Path $directoryPath -ChildPath $file
    # Create or overwrite the file with sample content
    Set-Content -Path $filePath -Value "This is sample content for $file."
    Write-Host "$file created at $filePath"
}

# List all files in the directory with their sizes
Write-Host "`nFiles in ${directoryPath}:"
Get-ChildItem -Path $directoryPath | Select-Object Name, Length | Format-Table -AutoSize

# Prompt the user to enter the name of a file to delete
$fileToDelete = Read-Host "Enter the name of the file to delete (file1.txt, file2.txt, file3.txt)"

# Delete the specified file if it exists
$filePathToDelete = Join-Path -Path $directoryPath -ChildPath $fileToDelete
if (Test-Path -Path $filePathToDelete) {
    Remove-Item -Path $filePathToDelete
    Write-Host "$fileToDelete has been deleted."
} else {
    Write-Host "The specified file does not exist."
}