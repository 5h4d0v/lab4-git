#!/usr/bin/env bash

SCRIPT_NAME="$(basename "$0")"

# PODMIEN NA SWOJ LINK DO REPOZYTORIUM
REPO_URL="https://github.com/5h4d0v/lab4-git.git"

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
    echo "  --error, -e"
    echo "      Tworzy domyslnie 100 katalogow errorx z plikami errorx.txt."
    echo ""
    echo "  --error LICZBA, -e LICZBA"
    echo "      Tworzy podana liczbe katalogow errorx oraz plikow errorx/errorx.txt."
    echo ""
    echo "  --init"
    echo "      Klonuje repozytorium i dodaje jego katalog do PATH."
    echo ""
    echo "  --help, -h"
    echo "      Wyswietla pomoc."
}

get_count() {
    if [[ -z "$1" ]]; then
        echo 100
    else
        echo "$1"
    fi
}

create_logs() {
    count="$(get_count "$1")"

    for i in $(seq 1 "$count"); do
        filename="log${i}.txt"

        echo "Nazwa pliku: $filename" > "$filename"
        echo "Utworzony przez skrypt: $SCRIPT_NAME" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done

    echo "Utworzono $count plikow log."
}

create_errors() {
    count="$(get_count "$1")"

    for i in $(seq 1 "$count"); do
        dirname="error${i}"
        filename="${dirname}/${dirname}.txt"

        mkdir -p "$dirname"

        echo "Nazwa pliku: ${dirname}.txt" > "$filename"
        echo "Katalog: $dirname" >> "$filename"
        echo "Utworzony przez skrypt: $SCRIPT_NAME" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done

    echo "Utworzono $count katalogow error z plikami."
}

init_repo() {
    repo_name="$(basename "$REPO_URL" .git)"

    if [[ -d "$repo_name" ]]; then
        echo "Katalog $repo_name juz istnieje. Pomijam klonowanie."
    else
        git clone "$REPO_URL"
    fi

    repo_path="$(pwd)/$repo_name"

    export PATH="$repo_path:$PATH"

    if [[ -f "$HOME/.bashrc" ]]; then
        echo "export PATH=\"$repo_path:\$PATH\"" >> "$HOME/.bashrc"
    else
        echo "export PATH=\"$repo_path:\$PATH\"" > "$HOME/.bashrc"
    fi

    echo "Dodano katalog repozytorium do PATH:"
    echo "$repo_path"
    echo ""
    echo "Aby odswiezyc terminal, wpisz:"
    echo "source ~/.bashrc"
}

case "$1" in
    --date|-d)
        date
        ;;

    --logs|-l)
        create_logs "$2"
        ;;

    --error|-e)
        create_errors "$2"
        ;;

    --init)
        init_repo
        ;;

    --help|-h)
        show_help
        ;;

    *)
        echo "Nieznana opcja albo brak opcji."
        echo "Uzyj: ./skrypt.sh --help"
        ;;
esac