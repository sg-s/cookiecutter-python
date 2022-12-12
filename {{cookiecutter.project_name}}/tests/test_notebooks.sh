# testing notebooks




# remove some junk
rm docs/how-to/.ipynb_checkpoints/*.ipynb


FILES=$(find . -type f -name "*.ipynb")


# if we're running on lambda-quad, isxtools
# is installed in the main environment,
# so the kernel we should use is the default,
# which is called "python"
#
# if running on local, I assume that you've installed
# isxtools in a environment called "isxtools"
# so let's use that for testing notebooks
#
HOST=$(hostname)
SUB='lambda-quad'
if [[ "$HOST" == *"$SUB"* ]]; then
    kernel_name="python" 
else
    kernel_name="isxtools"
fi

for f in $FILES
do
    # skip testing mongo notebook
    # because that notebook requires interactivity
    # because it needs a password
    if [[ $f == *"Mongo"* ]]; then
        continue
    fi

    echo $f

    time jupyter nbconvert --to notebook --execute $f --ExecutePreprocessor.kernel_name=$kernel_name || exit 1

    # remove the converted notebook
    rep="nbconvert.ipynb"
    rm ${f/ipynb/$rep}


done || exit 1

