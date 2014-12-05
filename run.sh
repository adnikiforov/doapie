!#/bin/sh
rebar compile && erl -pa ebin -pa deps/*/ebin -config priv/doapie.config -eval 'application:ensure_all_started(doapie).'