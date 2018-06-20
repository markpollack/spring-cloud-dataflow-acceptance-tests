#!/bin/bash

 if (cf apps | grep "skipper-server"); then
    echo "Deleting the skipper server"
    cf delete skipper-server -f -r
 fi

 apps=`cf apps | awk 'FNR > 3 {print $1}'`
 for app in $apps
 do
    if [[ $app != 'No' ]]; then
        echo "Deleting the app: $app"
        cf delete $app -f -r
    fi
 done

