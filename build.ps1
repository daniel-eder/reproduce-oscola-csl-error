# Remove the 'build' directory if it exists
if (Test-Path ./build) {
    Remove-Item -Recurse -Force ./build
}

# Create the 'build' directory if it doesn't exist
if (-not (Test-Path ./build)) {
    New-Item -ItemType Directory -Path ./build
}

# Change to the 'src' directory
Set-Location ./src

# Run lualatex twice with the specified output directory
for ($i = 0; $i -lt 2; $i++) {
    # & lualatex -interaction=nonstopmode --output-directory=../build main.tex
    & lualatex --output-directory=../build main.tex
}

# move next to the source file for editor viewers to find
Move-Item -Force ../build/main.pdf ../src/main.pdf

# Change back to the root directory for next run
Set-Location ../