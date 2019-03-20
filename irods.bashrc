irods-switch(){
    if [ -z "$1" ]
    then
        export IRODS_ENVIRONMENT_FILE=~/.irods/irods_environment.json
        export IRODS_AUTHENTICATION_FILE=~/.irods/.irodsA
        echo "switched to default $IRODS_ENVIRONMENT_FILE"
    else
        SERVER_DIR=~/.irods/servers
        DIR=${SERVER_DIR}/$1
        mkdir -p $DIR
        export IRODS_ENVIRONMENT_FILE=$DIR/irods_environment.json
        export IRODS_AUTHENTICATION_FILE=$DIR/.irodsA
        if [ ! -e $IRODS_AUTHENTICATION_FILE ]
        then
            iinit
        fi
        echo "switched to config $IRODS_ENVIRONMENT_FILE"
    fi
}

irods-which(){
    if [ -z "$IRODS_ENVIRONMENT_FILE" ]
    then
        echo "~/.irods/irods_environment.json:"
        cat ~/.irods/irods_environment.json
    else
        echo $IRODS_ENVIRONMENT_FILE
        cat $IRODS_ENVIRONMENT_FILE
    fi
}

irods-switch-expand() {
    for i in $( ls -d ~/.irods/servers/*/ )
    do
        SERVER=$( basename $i )
        COMPREPLY+=($SERVER)
    done
}

complete -F irods-switch-expand irods-switch;
export -f irods-switch;
