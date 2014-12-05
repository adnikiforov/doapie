%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Error converter
%%% @end
%%% Created : 05. дек 2014 14:07
%%%-------------------------------------------------------------------
-module(error_converter).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").

%% API
-export([convert/1]).

convert(Data) ->
  [{id, Error}, {message, Message}] = converter_utils:decode(Data),
  #error{
    error = Error,
    message = Message
  }.
