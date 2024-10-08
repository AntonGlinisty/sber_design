options=$(getopt -o h --long START,STATUS,STOP -- "$@")

eval set -- "$options"

while true; do
    case "$1" in
        --START)
            if [ "$MONITORING_PID" == "" ]; then
                . monitoring.sh &
                export MONITORING_PID=$!
                export START_TIMESTAMP=$(date +%T)
            fi
            echo "Monitoring process pid = $MONITORING_PID"
        ;;
        --STATUS)
            if [ "$MONITORING_PID" == "" ]; then
                echo "Monitoring process is not running!"
            else 
                echo "Monitoring process is running!"
            fi
        ;;
        --STOP)
            if ! [ "$MONITORING_PID" == "" ]; then
                kill $MONITORING_PID
                unset MONITORING_PID
                echo "Monitoring process was killed!"
            fi
        ;;
        --)
            break
        ;;
    esac
    shift
done
