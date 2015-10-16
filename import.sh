#!/bin/bash
set -e
echo -n "Deleting data:     "
curl -XDELETE -s ${ELASTIC_SEARCH_URL}/shakespeare && sleep 3 && echo

echo -n "Configuring index: "
curl -XPUT -s -H'Content-Type: application/json' --data-binary @index.json ${ELASTIC_SEARCH_URL}/shakespeare && sleep 3 && echo

echo -n "Importing data     "
curl -XPUT -s -H'Content-Type: application/json' --data-binary @shakespeare.json ${ELASTIC_SEARCH_URL}/_bulk > /dev/null || (echo "FAILED"; exit 1) && echo "Success"
