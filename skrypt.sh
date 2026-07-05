#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

case "$1" in
    --date)
        date
        ;;

    --logs)
        if [[ -z "$2" ]]; then
            count=100
        else
            count="$2"
        fi

        for i in $(seq 1 "$count"); do
            filename="log${i}.txt"

            echo "Nazwa pliku: $filename" > "$filename"
            echo "Utworzony przez skrypt: $SCRIPT_NAME" >> "$filename"
            echo "Data utworzenia: $(date)" >> "$filename"
        done

        echo "Utworzono $count plikow log."
        ;;

    *)
        echo "Uzyj:"
        echo "./skrypt.sh --date"
        echo "./skrypt.sh --logs"
        echo "./skrypt.sh --logs 30"
        ;;
esac