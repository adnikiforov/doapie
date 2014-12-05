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

-export([convert/2]).

convert(Data, Headers) ->
  [{actions, Actions},
    {links, [{pages,
      [{last, _LastLink},
        {next, _NextLink}]
    }]},
    {meta, [{total, _TotalItems}]}] = converter_utils:decode(Data),
  convert_actions(Actions, Headers).

convert_actions(Actions, Headers) ->
  convert_actions(Actions, Headers, []).

convert_actions(Actions, Headers, Accum) when Actions == [] ->
  #actions_list{
    actions = Accum,
    limits = converter_utils:parse_limits(Headers)
  };

convert_actions([H | T], Headers, Accum) ->
  convert_actions(T, Headers, lists:append(Accum, [convert_single_action(H)])).

convert_single_action(Data) ->
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
    started_at = StartedAt,
    completed_at = CompletedAt,
    resource_id = ResourceId,
    resource_type = ResourceType,
    region = Region
  }.