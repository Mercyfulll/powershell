# Prompt the user to specify the directory to scan
$directory = Read-Host "Enter the directory path to scan for .txt files"

# Check if the directory exists
if (-Not (Test-Path -Path $directory)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Get all .txt files in the specified directory
$textFiles = Get-ChildItem -Path $directory -Filter "*.txt"

# Check if there are no .txt files in the directory
if ($textFiles.Count -eq 0) {
    Write-Host "No text files found in the specified directory."
    exit
}

# Display the list of text files with numbers
Write-Host "Select a text file to view:"
for ($i = 0; $i -lt $textFiles.Count; $i++) {
    Write-Host "$($i + 1): $($textFiles[$i].Name)"
}

# Prompt the user to select a file number
$userInput = Read-Host "Enter the number of the file you want to view"

# Validate user input
if ($userInput -lt 1 -or $userInput -gt $textFiles.Count) {
    Write-Host "Invalid selection. Please choose a valid number."
    exit
}

# Get the selected file based on user input
$selectedFile = $textFiles[$userInput - 1]

# Read and display the contents of the selected file
Write-Host "`nContents of $($selectedFile.Name):"
Get-Content -Path $selectedFile.FullName