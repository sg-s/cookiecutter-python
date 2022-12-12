#!/bin/bash

# this shell script runs after the project runs

echo "Initializing git repo..."
git init

echo "setting up pre-commit hooks..."
cp assets/update_version.py .git/hooks/
cp assets/pre-commit .git/hooks/

echo "Making a conda env..."
cp assets/make_conda_env.sh .
bash ./make_conda_env.sh
rm ./make_conda_env.sh