%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converts single domain data
%%% @end
%%% Created : 05. Dec 2014 12:16
%%%-------------------------------------------------------------------
-module(domain_converter).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").
-include("api_resources.hrl").

-export([convert/2]).

convert(Data, Headers) ->
  [domain, [
    {name, Name},
    {ttl, TTL},
    {zone_file, ZoneFile}]] = Data,
  #domain{
    name = Name,
    ttl = TTL,
    zone_file = ZoneFile,
    limits = converter_utils:parse_limits(Headers)
  }.