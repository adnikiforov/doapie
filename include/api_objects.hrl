%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%%
%%% @end
%%% Created : 05. дек 2014 11:54
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").

-export_type([account/0, limits/0]).

-record(limits, {
  limit :: non_neg_integer(),
  remaining :: non_neg_integer(),
  reset :: integer()
}).
-type limits() :: #limits{}.

-record(account, {
  droplet_limit :: non_neg_integer(),
  email :: string(), %% maybe nonempty_string?
  uuid :: nonempty_string(),
  email_verified :: boolean(),
  limits :: #limits{}
}).
-type account() :: #account{}.