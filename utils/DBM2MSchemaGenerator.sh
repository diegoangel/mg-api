#!/usr/bin/env bash

dbicdump -o dump_directory=../lib -o components='["InflateColumn::DateTime"]' Infrastructure::DB::M2M::Schema 'dbi:mysql:database=m2m;host=127.0.0.1;port=3306' admin circle

