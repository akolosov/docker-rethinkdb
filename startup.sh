#!/bin/bash

echo "=> Starting and running RethinkDB..."

/usr/bin/rethinkdb --directory /data/db --log-file /data/logs/rethinkdb.log @$
