#!/bin/bash

set -e

echo "=> Starting and running RethinkDB..."

/usr/bin/rethinkdb --directory "/data/db" --log-file "/data/logs/rethinkdb.log" @$
