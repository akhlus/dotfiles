#!/usr/bin/env bash

FLAKE_PATH="${FLAKE_PATH:-.}"
MODE="switch"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--path) FLAKE_PATH="$2"; shift ;;
        -m|--mode) MODE="$2"; shift ;;
        -s|--system) SYSTEM="$2"; shift;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done


alejandra --quiet $FLAKE_PATH

git -C "$FLAKE_PATH" add .

read -p "Do you want to update flake inputs? (y/[n]): " flake_update
if [[ "$flake_update" == "y" ]]; then
    nix flake update --flake "$FLAKE_PATH"
fi

case "$SYSTEM" in
    home)
        name="home"
        command="home-manager"
        ;;
    nixos)
        name="$(hostname)"
        command="sudo nixos-rebuild"
        ;;
    darwin)
        name="$(hostname)"
        command="sudo darwin-rebuild"
        ;;
    *)
        echo "Error with rebuild type - use one of [ home nixos darwin ]"
        return
        ;;
esac

echo "Rebuilding..."

if ! $command "$MODE" --flake "$FLAKE_PATH#$name" &> $FLAKE_PATH/update.log; then
    grep --color error $FLAKE_PATH/update.log >&2
    exit 1
fi

date=$(date '+%Y-%m-%d-%H-%M')
read -p "Do you want to commit the changes? (y/[n]): " commit_choice
if [[ "$commit_choice" == "y" ]]; then
    read -p "Enter commit message: " commit_msg
    git -C "$FLAKE_PATH" commit -am "$date $commit_msg"
else
    exit 0
fi

read -p "Do you want to push the changes? (y/[n]): " push_choice
if [[ "$push_choice" == "y" ]]; then
    git -C "$FLAKE_PATH" push
fi
