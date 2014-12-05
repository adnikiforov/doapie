%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converts account data
%%% @end
%%% Created : 05. дек 2014 12:16
%%%-------------------------------------------------------------------
-module(account_converter).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").
-include("api_resources.hrl").

-export([convert/2]).

convert(Data, Headers) ->
  [{account,[{droplet_limit,DropletLimit},
    {email,Email},
    {uuid,Uuid},
    {email_verified,EmailVerified}]}] = converter_utils:decode(Data),
  #account{
    droplet_limit = DropletLimit,
  email = Email,
  uuid = Uuid,
  email_verified = EmailVerified,
  limits = converter_utils:parse_limits(Headers)
  }.