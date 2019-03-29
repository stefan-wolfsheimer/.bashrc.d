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

docker-clean-all() {
    docker system prune
}

docker-clean-containers() {
    n=$( docker ps -a --format '{{.ID}}' | wc -l )
    echo "removing $n containers"
    for i in $( docker ps -a --format '{{.ID}}' )
    do
        docker rm $i
    done
    m=$( docker ps -a --format '{{.ID}}' | wc -l )
    if [ ! $m = "0" ]
    then
        echo "could not remove $m / $n containers"
    fi
}
