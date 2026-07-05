#!/usr/bin/env bash

case "$1" in
    --date)
        date
        ;;
    *)
        echo "Uzyj: ./skrypt.sh --date"
        ;;
esac