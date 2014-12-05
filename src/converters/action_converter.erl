%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Converts single action data
%%% @end
%%% Created : 05. дек 2014 12:16
%%%-------------------------------------------------------------------
-module(action_converter).
-author("a.d.nikiforov@gmail.com").

-include("api_objects.hrl").
-include("api_resources.hrl").

-export([convert/2]).

convert(Data, Headers) ->
  [{action, [
    {id, Id},
    {status, Status},
    {type, Type},
    {started_at, StartedAt},
    {completed_at, CompletedAt},
    {resource_id, ResourceId},
    {resource_type, ResourceType},
    {region, Region}
  ]}] = converter_utils:decode(Data),
  #action{
    id = Id,
    status = Status,
    type = Type,
    started_at = iso8601:parse(StartedAt),
    completed_at = iso8601:parse(CompletedAt),
    resource_id = ResourceId,
    resource_type = ResourceType,
    region = Region,
    limits = converter_utils:parse_limits(Headers)
  }.