%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Main module
%%% @end
%%% Created : 05. Dec 2014 10:33
%%%-------------------------------------------------------------------
-module(doapie).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").
-include("api_resources.hrl").

-export([get_account/0]).

-spec get_account() -> account() | 'error'.
get_account() ->
  doapie_util:make_request(?DO_ACCOUNT_INFO, account_converter).