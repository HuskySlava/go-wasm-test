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

## Copy WASM
printf "${YELLOW}Copying WebAssembly to dist...${RESET}\n"
cp dist/* ../dist
cp wasm_exec.js ../dist # WASM Runtime
rm -rf dist

cd .. # Move back to root

## Compile TypeScript
printf "${YELLOW}Compiling TypeScript...${RESET}\n"
tsc

## Copy html
printf "${YELLOW}Copying HTML...${RESET}\n"
cd ts-src
cp index.html ../dist
printf "\033[1;32mDone\033[0m\n"




