#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "Использование: $0 'заголовок' 'регулярное_выражение' | имя1 имя2 ..."
    exit 1
fi

header="$1"  
shift        

if [[ $# -eq 1 ]]; then
    pattern="$1"
    search_mode="regex"
else
    file_list=("$@")
    search_mode="list"
fi

print_with_numbers() {
    local file="$1"
    local count=1

    echo "==== Листинг файла: $file ===="
countt=1
cat $file | while read line
do
echo "Line $countt: $line"
countt=$(( $countt + 1 ))
done
echo "Finished"
    echo "============================="
}

search_files() {
    local dir="$1"

    for item in "$dir"/*; do
        if [[ -e "$item" ]]; then
            if [[ -f "$item" ]]; then
                filename=$(basename "$item")

                if [[ "$search_mode" == "regex" && "$filename" =~ $pattern ]]; then
                    echo "Найден файл (по регулярному выражению): $item"
                    check_header "$item"
                elif [[ "$search_mode" == "list" ]]; then
                    for name in "${file_list[@]}"; do
                        if [[ "$filename" == "$name" ]]; then
                            echo "Найден файл (по списку имен): $item"
                            check_header "$item"
                            break
                        fi
                    done
                fi
            fi

            if [[ -d "$item" ]]; then
                search_files "$item"
            fi
        fi
    done
}

check_header() {
    local file="$1"
    
    if [[ -r "$file" ]]; then
        first_line=$(head -n 1 "$file")
        if [[ "$first_line" == "$header" ]]; then
            print_with_numbers "$file"
        fi
    else
        echo "Ошибка: Нет прав на чтение файла $file"
    fi
}

search_files "."

