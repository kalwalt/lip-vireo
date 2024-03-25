#! /bin/bash

# docker run -dit --name emscripten-vireo -v $(pwd):/src emscripten/emsdk:3.1.40 bash

docker exec emscripten-vireo emcmake cmake -B bin/Debug -DEMSCRIPTEN_COMP=1
docker exec emscripten-vireo emmake make -C bin/Debug