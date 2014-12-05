%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converts delete domain data
%%% @end
%%% Created : 05. дек 2014 12:16
%%%-------------------------------------------------------------------
-module(domain_delete_converter).
-author("a.d.nikiforov@gmail.com").

-export([convert/2]).

convert(_Data, Headers) ->
  converter_utils:parse_limits(Headers).