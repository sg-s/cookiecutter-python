
# check if conda exists
if ! [ -x "$(command -v conda)" ]; then
  echo 'Error: conda is not installed. Cannot proceed. ' >&2
  exit 0
fi


# makes a new conda environment 

# figure out which version of python we should use
PYVERSION=$(cat setup.py | grep "python_requires"  | tr -dc '0-9.'
)

echo "Will make environment using this python version:"
echo $PYVERSION


# we will name the conda env after the name of the repo
# let's sanitize the name a little...
CONDA_ENV_NAME=$(cat setup.py | grep "name=" | cut -d "=" -f 2)
CONDA_ENV_NAME=${CONDA_ENV_NAME//'"'/}
CONDA_ENV_NAME=${CONDA_ENV_NAME//','/}
CONDA_ENV_NAME=${CONDA_ENV_NAME//'-'/_}

echo "Will make environment named:"
echo $CONDA_ENV_NAME

# conda, in its infinite wisdom, has decided that it won't
# work when called from shell scripts, see:
# https://github.com/conda/conda/issues/7980
#
# this inscrutable workaround works, but I have no idea why
# 
eval "$(conda shell.bash hook)"

# deactivate whatever we're in now
conda deactivate 

# first, make a new env without user intervention 
yes | conda create -n $CONDA_ENV_NAME python=$PYVERSION pip wheel  


# switch to that
conda activate $CONDA_ENV_NAME


# allow this environment to show up in jupyter lab
pip install ipykernel
python -m ipykernel install --user --name $CONDA_ENV_NAME