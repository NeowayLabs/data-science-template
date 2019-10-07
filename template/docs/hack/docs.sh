# Exit at first error
set -e

# Clear sphinx-apidoc output directory
rm -rf docs/source/apidoc/*
# Execute sphinx-apidoc
sphinx-apidoc -f -e -o docs/source/apidoc/ model_name/
# Clear build directory
rm -rf docs/build/*
# Copy md files from docs to source/md folder
mkdir -p docs/source/md/
cp docs/*.md docs/source/md/
# Change file to show "API" in the table of contents rather than the package's name
sed -i.bak '0,/model_name/s//API/' docs/source/apidoc/modules.rst
# Show package's name in the home page
sed -i.bak '0,/project/s//model_name/' docs/source/index.rst
# Delete backup files
find . -name "*.bak" -type f -delete
# Generate html docs
make -C docs/ html
# Clear temp files at source/md directory
rm -rf docs/source/md/*
