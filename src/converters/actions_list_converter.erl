%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converts actions list data
%%% @end
%%% Created : 05. дек 2014 12:16
%%%-------------------------------------------------------------------
-module(actions_list_converter).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").
-include("api_resources.hrl").

-export([convert/2, convert_single/1, convert_list/2]).

convert(Data, Headers) ->
  [{actions, Actions},
    {links, [_Links]},
    %% {last, _LastLink},
    %% {next, _NextLink}
    {meta, [{total, _TotalItems}]}] = converter_utils:decode(Data),
  converter_utils:convert_list(Actions, actions_list_converter, Headers).

convert_list(Actions, Headers) ->
  #actions_list{
    actions = Actions,
    limits = converter_utils:parse_limits(Headers)
  }.

convert_single(Data) ->
  [{id, Id},
    {status, Status},
    {type, Type},
    {started_at, StartedAt},
    {completed_at, CompletedAt},
    {resource_id, ResourceId},
    {resource_type, ResourceType},
    {region, Region}] = Data,
  #action{
    id = Id,
    status = Status,
    type = Type,
    started_at = iso8601:parse(StartedAt),
    completed_at = iso8601:parse(CompletedAt),
    resource_id = ResourceId,
    resource_type = ResourceType,
    region = Region
  }.