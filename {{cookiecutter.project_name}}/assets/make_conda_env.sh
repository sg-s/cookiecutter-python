
# check if conda exists
if ! [ -x "$(command -v conda)" ]; then
  echo 'Error: conda is not installed. Cannot proceed. ' >&2
  exit 0
fi


# makes a new conda environment 

# if no 2nd argument is provided, default to 3.6
PYVERSION=$(cat setup.py | grep "python_requires"  | tr -dc '0-9.'
)

echo "Will make environment using this python version:"

echo $PYVERSION

# # conda, in its infinite wisdom, has decided that it won't
# # work when called from shell scripts, see:
# # https://github.com/conda/conda/issues/7980
# #
# # this inscrutable workaround works, but I have no idea why
# # 
# eval "$(conda shell.bash hook)"

# # deactivate whatever we're in now
# conda deactivate 

# # first, make a new env without user intervention 
# yes | conda create -n $1 python=$PYVERSION pip wheel  


# # switch to that
# conda activate $1 


# # allow this environment to show up in jupyter lab
# pip install ipykernel
# python -m ipykernel install --user --name $1