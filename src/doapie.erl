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
-include("internal_resources.hrl").

%% -export([get_account/0, get_action/1, get_actions_list/2]).
-compile(export_all).

-spec get_account() -> account() | error() | 'error'.
get_account() ->
  doapie_util:make_request(?DO_ACCOUNT_INFO, account_converter).

-spec get_actions_list(non_neg_integer(), non_neg_integer()) -> actions_list() | error() | 'error'.
get_actions_list(Page, PerPage) ->
  PerPageCount =
    case PerPage of
      PerPage when PerPage > 25 -> ?MAX_PER_PAGE;
      PerPage -> PerPage
    end,
  ApiAction = doapie_util:render_api_action(?DO_ACTIONS_LIST, [{page, Page}, {per_page, PerPageCount}]),
  doapie_util:make_request(ApiAction, actions_list_converter).

-spec get_action(non_neg_integer()) -> action() | error() | 'error'.
get_action(ActionId) ->
  ApiAction = doapie_util:render_api_action(?DO_ACTION, [{action_id, ActionId}]),
  doapie_util:make_request(ApiAction, action_converter).