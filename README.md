# cookiecutter-python

A simple cookiecutter for my projects.

## What?

This solves the problem of you having to start work on new 
python projects, and having to manually copy over a lot of 
boilerplate code and architecture.

## How?

Using [cookiecutter](https://github.com/cookiecutter/cookiecutter) and [cruft](https://github.com/cruft/cruft)

## Installation 

Don't (unless you want to build off this). Use it directly. 

## Usage

First, install cruft:

```bash
pip install cruft
```

and then create your own repo using this as a template:

```bash
cruft create https://github.com/sg-s/cookiecutter-python/
```

The script will create a new directory (and repository) for you
with a bunch of useful things pre-set-up. 

## Features

### Pre-configured conda environment and Jupyter kernel spec

If you install this, you will get a new conda environment 
named the same as the repo you are creating, with some 
utility work to install the kernel so that Jupyter can see it. 

### Pre-configured with testing infrastructure 

The following things are set up:

- tests to make sure you write tests for every function
- install script that will install with `-e` on a configurable local machine
- script to test every notebook 

### Pre-configured with git hooks

- pre-commit hooks to make sure you write docstrings for your functions
- pre-commit hooks to automatically update version number using [calver](https://calver.org/)

### Ready to build docs

- mkdocs templates to get you started on your own nice documentation