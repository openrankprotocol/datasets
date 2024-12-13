if [[ $(cargo --version) ]]; then
    echo "Found cargo\n"
else
    (curl -sSf https://sh.rustup.rs || echo "exit 1") | sh -s -- -y || exit
    source $HOME/.cargo/env || exit
    export PATH=$HOME/.cargo/bin:$PATH
fi

echo "Downloading Example Datasets..."
git lfs pull
echo "Done\n"

echo "Installing SDK.."
cargo install openrank-sdk --version "0.1.5"
echo "Done\n"

echo "Generating keypair:"
openrank-sdk generate-keypair
