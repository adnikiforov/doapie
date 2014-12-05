%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Some conversion util methods
%%% @end
%%% Created : 05. дек 2014 12:25
%%%-------------------------------------------------------------------
-module(converter_utils).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").

-export([parse_limits/1, decode/1]).

-spec parse_limits(list({nonempty_string(), nonempty_string()})) -> limits().
parse_limits(Headers) ->
  Dict = dict:from_list(Headers),
  Limit = dict_find("RateLimit-Limit", Dict),
  Rem = dict_find("RateLimit-Remaining", Dict),
  Reset = dict_find("RateLimit-Reset", Dict),
  #limits{
    limit = try_convert_to_int(Limit),
    remaining = try_convert_to_int(Rem),
    reset = try_convert_to_int(Reset)
  }.

%% jsx:decode wrapper
-spec decode(list()) -> term().
decode(Data) ->
  jsx:decode(list_to_binary(Data), [{labels, atom}]).

%% Returns value or undef from dict
-spec dict_find(nonempty_string(), any()) -> any() | 'undefined'.
dict_find(Key, Dict) ->
  case dict:find(Key, Dict) of
    {ok, Value} -> Value;
    error -> undefined
  end.

-spec try_convert_to_int(string()) -> integer() | string().
try_convert_to_int(String) ->
  case string:to_integer(String) of
    {Int, _} when is_integer(Int) -> Int;
    {error, _} -> String
  end.