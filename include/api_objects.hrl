%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%%
%%% @end
%%% Created : 05. дек 2014 11:54
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").

-export_type([account/0, action/0, actions_list/0, domain/0, domains_list/0, maybe_error/1]).
-export_type([limits/0, error/0]).

-record(limits, {
  limit :: non_neg_integer(),
  remaining :: non_neg_integer(),
  reset :: integer()
}).
-type limits() :: #limits{}.

-record(error, {
  error :: string(),
  message :: string()
}).
-type error() :: #error{}.
-type maybe_error(Object) :: Object | error() | 'error'.

-record(account, {
  droplet_limit :: non_neg_integer(),
  email :: string(), %% maybe nonempty_string?
  uuid :: nonempty_string(),
  email_verified :: boolean(),
  limits :: limits()
}).
-type account() :: #account{}.

-record(action, {
  id :: non_neg_integer(),
  status :: nonempty_string(),
  type :: nonempty_string(),
  started_at :: calendar:datetime(),
  completed_at :: calendar:datetime(),
  resource_id :: non_neg_integer(),
  resource_type :: nonempty_string(),
  region :: nonempty_string(),
  limits :: limits()
}).
-type action() :: #action{}.

-record(actions_list, {
  actions :: list(action()),
  limits :: limits()
}).
-type actions_list() :: #actions_list{}.

-record(domain, {
  name :: nonempty_string(),
  ttl :: non_neg_integer(),
  zone_file :: nonempty_string(),
  limits :: limits()
}).
-type domain() :: #domain{}.

-record(domains_list, {
  domains :: list(domain()),
  limits :: limits()
}).
-type domains_list() :: #domains_list{}.