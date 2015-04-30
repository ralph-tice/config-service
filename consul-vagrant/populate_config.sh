#!/bin/bash

#shove some example data into consul

curl -X PUT -d 'mysql.internal' http://localhost:8500/v1/kv/web/mysql

# assume there's just one MYSQL host for now
JQ_QUERY=".[0].Value"
MYSQL_HOST=`curl http://localhost:8500/v1/kv/web/mysql -s | jq $JQ_QUERY -r | base64 --decode`

echo $MYSQL_HOST