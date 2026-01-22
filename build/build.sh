#!/bin/bash
set -e

# Terminal color variables
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
RESET="\033[0m"


## Clean dist
printf "${YELLOW}Cleaning dist..${RESET}\n"
rm -rf ./dist/*

## Compile WASM
printf "${YELLOW}Compiling WASM..${RESET}\n"
cd go-src # Move to GO folder
make wasm

## Copy GO JS  from the installed go version, as per:
## https://go.dev/wiki/WebAssembly#getting-started
mkdir -p ../wasm-dist
GOROOT_PATH=$(go env GOROOT)
cp -f $GOROOT_PATH/lib/wasm/wasm_exec.js ../wasm-dist

cd .. # Move back to root

## Compile and copy web files (TS, HTML, .etc)
printf "${YELLOW}Compiling web...${RESET}\n"
npx vite build

printf "\033[1;32mDone\033[0m\n"




