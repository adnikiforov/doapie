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

-spec get_account() -> maybe_error(account()).
get_account() ->
  doapie_util:make_request(?DO_ACCOUNT_INFO, account_converter).

-spec get_actions_list(non_neg_integer(), non_neg_integer()) -> maybe_error(actions_list()).
get_actions_list(Page, PerPage) ->
  ApiAction = doapie_util:render_api_action(?DO_ACTIONS_LIST,
    [{page, Page}, {per_page, (doapie_util:get_per_page(PerPage))}]),
  doapie_util:make_request(ApiAction, actions_list_converter).

-spec get_action(non_neg_integer()) -> maybe_error(action()).
get_action(ActionId) ->
  ApiAction = doapie_util:render_api_action(?DO_ACTION, [{action_id, ActionId}]),
  doapie_util:make_request(ApiAction, action_converter).

-spec get_domains_list(non_neg_integer(), non_neg_integer()) -> maybe_error(domains_list()).
get_domains_list(Page, PerPage) ->
  ApiAction = doapie_util:render_api_action(?DO_DOMAINS_LIST,
    [{page, Page}, {per_page, (doapie_util:get_per_page(PerPage))}]),
  doapie_util:make_request(ApiAction, domains_list_converter).

-spec get_domain(non_neg_integer()) -> maybe_error(domain()).
get_domain(DomainId) ->
  ApiAction = doapie_util:render_api_action(?DO_DOMAIN, [{domain_id, DomainId}]),
  doapie_util:make_request(ApiAction, domain_converter).

-spec create_domain(nonempty_string(), nonempty_string()) -> maybe_error(domain()).
create_domain(Name, IpAddr) ->
  {Url, Method, _Data} = ?DO_DOMAIN_CREATE,
  doapie_util:make_request({Url, Method, [{name, Name}, {ip_address, IpAddr}]}, domain_converter).

-spec delete_domain(non_neg_integer()) -> maybe_error(limits()).
delete_domain(DomainId) ->
  ApiAction = doapie_util:render_api_action(?DO_DOMAIN_DELETE, [{domain_id, DomainId}]),
  doapie_util:make_request(ApiAction, domain_delete_converter).