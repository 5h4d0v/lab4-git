#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

case "$1" in
    --date)
        date
        ;;

    --logs)
        for i in $(seq 1 100); do
            filename="log${i}.txt"

            echo "Nazwa pliku: $filename" > "$filename"
            echo "Utworzony przez skrypt: $SCRIPT_NAME" >> "$filename"
            echo "Data utworzenia: $(date)" >> "$filename"
        done

        echo "Utworzono 100 plikow log."
        ;;

    *)
        echo "Uzyj:"
        echo "./skrypt.sh --date"
        echo "./skrypt.sh --logs"
        ;;
esac