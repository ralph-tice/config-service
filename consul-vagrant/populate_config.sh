#!/bin/bash

#shove some example data into consul

curl -X PUT -d 'mysql.internal' http://localhost:8500/v1/kv/web/mysql

# assume there's just one MYSQL host for now, and use -r to strip enclosing quotes
JQ_QUERY=".[0].Value -r"
MYSQL_HOST=`curl http://localhost:8500/v1/kv/web/mysql -s | jq $JQ_QUERY | base64 --decode`

echo $MYSQL_HOST