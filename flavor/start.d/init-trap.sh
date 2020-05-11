function on_sigterm () {
    echo "sigterm signal received - container shutdown intiated"
    while true
    do
        HTTP_RESPONSE=$(curl --silent --write-out "HTTPSTATUS:%{http_code}" -X GET "http://localhost/nginx_status")
        # extract the status
        HTTP_STATUS=$(echo $HTTP_RESPONSE | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')
        if [ ! $HTTP_STATUS -eq 200  ]; then
            echo "Error [HTTP status: $HTTP_STATUS]"
            echo "Service not running, so killing container"
            exit 0;
        fi
        # extract the body
        HTTP_BODY=$(echo $HTTP_RESPONSE | sed -e 's/HTTPSTATUS\:.*//g')
        if [ "$(echo $HTTP_BODY | awk '$11=="Reading:"{printf("%s, ", $12)}$13=="Writing:"{print $14}')" != "0, 1" ]; 
        then
            echo "Service is busy"
        else
            echo "Service is idle, so stopping container"
            exit 0;
        fi
        sleep 2
    done
}
trap 'on_sigterm' SIGTERM;