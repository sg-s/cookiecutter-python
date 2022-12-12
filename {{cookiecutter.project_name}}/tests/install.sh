
# check if we're running on a self-hosted machine
SELF_HOSTED_NAME=$(cat .SELF_HOSTED_NAME)

HOST=$(hostname)
if [[ "$HOST" == *"$SELF_HOSTED_NAME"* ]]; then
    echo "Running on self-hosted, so will install in developer mode..."
    pip install -e .[dev]   
fi

# the reason we are -e installing it is so that we have a reliable
# place where we know the code will be in, because various
# bits of the code download data
