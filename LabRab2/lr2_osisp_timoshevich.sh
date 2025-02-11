#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <входной_файл>"
    exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
    echo "Ошибка: файл '$input_file' не найден!"
    exit 1
fi

sed -E 's/(^|[.!?]\s+)([[:space:]]*)([a-zа-яё])/\1\2\U\3/g' "$input_file" > "$input_file.tmp" && mv "$input_file.tmp" "$input_file"
