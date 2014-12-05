%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Some util methods
%%% @end
%%% Created : 05. Dec 2014 10:57
%%%-------------------------------------------------------------------
-module(doapie_util).
-author("a.d.nikiforov@gmail.com").

-include("internal_resources.hrl").

%% API
-export([build_headers/0]).

%% Build request headers - Content-Type and Auth header using get_token/0
-spec build_headers() -> list().
build_headers() ->
  [?HEADER_CONTENT_TYPE, {?HEADER_AUTH, ?HEADER_AUTH_BEARER ++ get_token()}].

%% Returns token or raise error/exit if configuration incorrect
-spec get_token() -> string().
get_token() ->
  case application:get_env(doapie, token) of
    undefined ->
      lager:error("Configuration not found"),
      exit("Configuration not found");
    {ok, Token} when is_atom(Token) ->
      atom_to_list(Token);
    {ok, Token} ->
      Token
  end.
