goinside(){
    docker exec -it $1 bash -c "stty cols $COLUMNS rows $LINES && bash";
}

goinside_root(){
    docker exec -u root -it $1  bash -c "stty cols $COLUMNS rows $LINES && bash";
}

_goinside(){
    COMPREPLY=( $(docker ps --format "{{.Names}}" -f name=$2) );
}

complete -F _goinside goinside;
complete -F _goinside goinside_root;
export -f goinside;
export -f goinside_root;