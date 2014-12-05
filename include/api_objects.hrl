%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%%
%%% @end
%%% Created : 05. дек 2014 11:54
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").

-export_type([account/0, limits/0, action/0, error/0]).

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
  started_at :: nonempty_string(), %% TODO datetime type
  completed_at :: nonempty_string(), %% TODO datetime type
  resource_id :: non_neg_integer(),
  resource_type :: nonempty_string(),
  region :: nonempty_string(),
  limits :: limits()
}).
-type action() :: #action{}.