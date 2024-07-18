figlet Port Scanner

echo
echo "Enter an IP address."
 
read ip

scanOpt=""

until [ "$scanOpt" = "0" ]; do

        echo
        echo "Do you wish to perform a light scan [common ports], a full scan [ports 1-1024], or simply exit?"
        echo "l/f/e"

        read -s scanOpt

    if [ "$scanOpt" = "l" ]; then

        commonPorts=('21' '22' '23' '25' '53' '80' '110' '143' '443' '445' '3389' '3306' '5900' '6379' '8080') 

        ncOutput=$(nc -z -v $ip ${commonPorts[@]} 2>&1)

        echo
        echo "$ncOutput" | grep -i succeeded!
            
    elif [ "$scanOpt" = "f" ]; then

        echo
        echo "This might take a couple of seconds..."

        ncOutput=$(nc -z -v $ip {1..1024} 2>&1)

        echo 
        echo "$ncOutput" | grep -i succeeded!

    fi

    echo
    echo "ENTER: Scan the same IP"
    echo "1: Change the IP"

    read -s userInput

    if [ "$userInput" = "1" ]; then

        echo
        echo "Whats the new IP?" 

        read newIP

        ip=$newIP
    fi

    clear

done