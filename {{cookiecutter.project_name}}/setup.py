"""setup file"""

from setuptools import find_packages, setup

setup(
    name="{{cookiecutter.project_name}}",
    version="22.12.12",
    packages=find_packages(exclude=("tests", "docs")),
    description="{{ cookiecutter.description }}",
    author="{{ cookiecutter.full_name }}",
    url="https://github.com/sg-s/cookiecutter-python",
    author_email="{{ cookiecutter.email }}",
    python_requires=">=3.9",
    install_requires=[],
    extras_require={
        "dev": [
            "interrogate>=1.0",
            "pytest",
            "pycore @ git+https://github.com/sg-s/pycore.git",
        ],
        "docs": [
            "mkdocs-jupyter",
            "mkdocs-material==8.3.6",
            "mkdocs-material-extensions==1.0.3",
            "mkdocs>=1.4.0",
        ],
    },
)
