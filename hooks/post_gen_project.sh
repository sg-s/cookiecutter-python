#!/bin/bash

# this shell script runs after the project runs

echo "Initializing git repo..."
git init

echo "setting up pre-commit hooks..."
cp assets/update_version.py .git/hooks/
cp assets/pre-commit .git/hooks/

