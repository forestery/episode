options () {

    if [ -n "$1" ]; then # test if any arguments passed - $1 will always exist
        while (( "$#" )); do  # process ALL arguments
            if [ "$1" = ^-t$ ]; then # -t short for "test"
                # do something here THEN shift the argument
                # shift removes it from $@ and reduces $# by
                # one if you supply no argument
                shift

            # we can also process multiple arguments at once
            elif [[ "$1" =~ ^--test=[:alnum:]{1,8}$ ]] && [[ "$2" =~ ^-t2$ ]] && [[ -n "$3" ]]; then # check for 3 arguments
                # do something more then remove them ALL from the arg list    
                shift 3
            else
                echo "No matching arguments!"
                echo "Usage: [script options list here]"
            fi
        done
    else
        echo "Usage: [script options list here]"
        exit 0
    fi
}

options "$@" # run options and loop through/process ALL arguments