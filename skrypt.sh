#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

show_help() {
    echo "Dostepne opcje:"
    echo ""
    echo "  --date, -d"
    echo "      Wyswietla dzisiejsza date."
    echo ""
    echo "  --logs, -l"
    echo "      Tworzy domyslnie 100 plikow logx.txt."
    echo ""
    echo "  --logs LICZBA, -l LICZBA"
    echo "      Tworzy podana liczbe plikow logx.txt."
    echo ""
    echo "  --help, -h"
    echo "      Wyswietla pomoc."
}

case "$1" in
    --date|-d)
        date
        ;;

    --logs|-l)
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

    --help|-h)
        show_help
        ;;

    *)
        echo "Nieznana opcja albo brak opcji."
        echo "Uzyj: ./skrypt.sh --help"
        ;;
esac