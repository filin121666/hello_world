#!/usr/bin/env bash

run_asm_code() {
    cd ./asm || exit
    make -s
    ./hello
    cd ..
}

run_c_code() {
    cd ./c || exit
    gcc -o hello hello.c
    ./hello
    cd ..
}

run_cpp_code() {
    cd ./c++ || exit
    g++ -o hello hello.cpp
    ./hello
    cd ..
}

run_python_code() {
    cd ./python || exit
    python3 hello.py
    cd ..
}

current_path=$(pwd)
current_dir=$(basename "$current_path")

if [[ "$current_dir" == "hello_world" && "$1" == "--lang" ]]; then
    case "$2" in
        asm) run_asm_code ;;
        c) run_c_code ;;
        c++) run_cpp_code ;;
        python) run_python_code ;;
        *)
            echo "Unknown language: $2"
            ;;
    esac
elif [[ "$current_dir" == "hello_world" ]]; then
    echo "You have not selected a language."
    echo -n "Select language (asm, c, c++, python): "
    read -r language
    case "$language" in
        asm) run_asm_code ;;
        c) run_c_code ;;
        c++) run_cpp_code ;;
        python) run_python_code ;;
        *)
            echo "You have entered an incorrect language."
            ;;
    esac
else
    echo "You are not in the hello_world directory."
fi
