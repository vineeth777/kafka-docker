#!/bin/bash

ps aux | perl -MJSON -lane 'if (!@keys) { @keys = @F } else { my %h = map {($keys[$_], $F[$_])} 0..$#keys; push @data, \%h } END { print encode_json \@data }' > ps_aux.JSON  && date > ps_aux.JSON
sed -i 's/},/},\n/g' ps_aux.JSON 
