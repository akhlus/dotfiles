#!/usr/bin/env bash

usage() {
    echo "Usage: $0 [-p <path>] -t <sys_type> [-f] -m <mode>"
    exit 1
}

update() {
    local path="$1"
    local sys_type="$2"
    local format="$3"
    local mode="$4"

    cd "$path" || { echo "Failed to change directory"; return 1; }

    if git diff --quiet; then
        read -p "No changes detected - proceed anyway? [y]/n" cont
        cont=${cont:-y}  # Default to 'y'
        if [[ "$cont" == "n" ]]; then
            return
        fi
    fi

    if [[ "$format" == "true" ]]; then
        alejandra . &>/dev/null \
          || ( alejandra . ; echo "formatting failed!" && exit 1)
    fi

    git add .
    git diff --staged -U0
    echo "Rebuilding..."

    case "$sys_type" in
        home)
            name="home"
            command="home-manager"
            ;;
        nixos)
            name="system"
            command="sudo nixos-rebuild"
            ;;
        darwin)
            name="apple"
            command="darwin-rebuild"
            ;;
        *)
            echo "Error with sys_type"
            return
            ;;
    esac

    if ! $command "$mode" --flake "$path#$name" &> nixos-switch.log; then
        grep --color error nixos-switch.log >&2
        exit 1
    fi

    date=$(date '+%Y-%m-%d-%H-%M')
    read -p "Commit to git? [y]/n" commit
    commit=${commit:-y}  # Default to 'y'
    if [[ "$commit" == "n" ]]; then
        return
    fi

    read -p "Git commit message: " commit_message
    git commit -am "$date $commit_message"

    read -p "Push to github? [y]/n" push
    push=${push:-y}  # Default to 'y'
    if [[ "$push" == "n" ]]; then
        return
    fi

    git push
}

format="false"
while getopts "p:t:fm:" opt; do
    case ${opt} in
        p ) path=$OPTARG ;;
        t ) sys_type=$OPTARG ;;
        f ) format="true" ;;
        m ) mode=$OPTARG ;;
        * ) usage ;;
    esac
done

if [[ -z "$path" ]]; then
    if [[ -z "$FLAKE_PATH" ]]; then
        echo "Error: No path provided and FLAKE_PATH is not set."
        exit 1
    fi
    path="$FLAKE_PATH"
fi

if [[ -z "$sys_type" || -z "$mode" ]]; then
    usage
fi

curdir=$(pwd)
update "$path" "$sys_type" "$format" "$mode"
cd "$curdir" || exit 1
