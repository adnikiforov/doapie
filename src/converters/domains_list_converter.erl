%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converts domains list data
%%% @end
%%% Created : 05. дек 2014 12:16
%%%-------------------------------------------------------------------
-module(domains_list_converter).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").
-include("api_resources.hrl").

-export([convert/2, convert_single/1, convert_list/2]).

convert(Data, Headers) ->
  [{domains, Domains},
    {links, [_Links]},
    %% {last, _LastLink},
    %% {next, _NextLink}
    {meta, [{total, _TotalItems}]}] = converter_utils:decode(Data),
  converter_utils:convert_list(Domains, domains_list_converter, Headers).

convert_list(Domains, Headers) ->
  #domains_list{
    domains = Domains,
    limits = converter_utils:parse_limits(Headers)
  }.

convert_single(Data) ->
  [{name, Name},
    {ttl, TTL},
    {zone_file, ZoneFile}] = Data,
  #domain{
    name = Name,
    ttl = TTL,
    zone_file = ZoneFile
  }.