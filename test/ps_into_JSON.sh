#!/bin/bash

now=$(date) && echo "$now" >ps.JSON && ps aux | perl -MJSON -lane 'my @a = @F; push @data, \@a; END { print encode_json \@data }' >>ps.JSON

sed -i 's/],/]\n/g' ps.JSON

