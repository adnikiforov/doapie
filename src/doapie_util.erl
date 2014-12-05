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
-export([make_request/2, render_api_action/2]).

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

%% Make request using predefined api action tuple and convert it using converter
-spec make_request({nonempty_string(), http_methods(), list()}, atom()) -> term().
make_request(ApiAction, Converter) ->
  {Url, Action, Data} = ApiAction,
  case Data of
    [] ->
      Response = ibrowse:send_req(Url, build_headers(), Action);
    RequestData ->
      Response = ibrowse:send_req(Url, build_headers(), Action, RequestData)
  end,
  case Response of
    {ok, Code, Headers, Body} ->
      case string:to_integer(Code) of
%%      Check code is in 200...299 range
        {Int, _R} when is_integer(Int), Int >= 200, Int < 300 ->
          erlang:apply(Converter, convert, [Body, Headers]);
        {Int, _R} when is_integer(Int) ->
          lager:error("Error code ~p ~p", [Int, Body]),
          erlang:apply(error_converter, convert, [Body]);
        {error, Reason} ->
          lager:error("Error ~p", [Reason]), error
      end;
    {_, _Code, _Headers, Body} ->
      lager:error("Error ~p", [Body]), error
  end.

-spec render_api_action({string(), http_methods(), list()}, list()) -> {string(), http_methods(), list()}.
render_api_action({Url, Method, ActionData}, Data) ->
  {render_url(Url, Data), Method, ActionData}.

render_url(Url, Data) when Data == [] ->
  Url;
render_url(Url, Data) ->
  [{Key, Value} | T] = Data,
  StringedKey = string:to_upper(atom_to_list(Key)),
  render_url(re:replace(Url, "{" ++ StringedKey ++ "}", any_to_string(Value), [global, {return, list}]), T).

-spec any_to_string(integer() | atom() | string()) -> string().
any_to_string(Value) ->
  case Value of
    Value when is_integer(Value) -> integer_to_list(Value);
    Value when is_atom(Value) -> atom_to_list(Value);
    Value -> Value
  end.