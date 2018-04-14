#!/bin/bash

git clone https://github.com/tdlib/td
cd td
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
sudo make install
cd ../..
mkdir build
cmake -DCMAKE_BUILD_TYPE=Release -DTDLUA_TD_STATIC=1 ..
cmake --build .

curl -s https://api.telegram.org/bot$token/sendDocument -F chat_id=$chat_id -F document="@tdlua.so"
