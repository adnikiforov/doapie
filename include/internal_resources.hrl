%%%-------------------------------------------------------------------
%%% @author adnikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% Internal resources
%%% @end
%%% Created : 5. Dec 2014 0:40
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").

-export_type([http_methods/0]).

-define(HEADER_CONTENT_TYPE, {"Content-Type", "application/json"}).
-define(HEADER_AUTH, "Authorization").
-define(HEADER_AUTH_BEARER, "Bearer ").

-define(MAX_PER_PAGE, 25).

-type http_methods() :: 'get'|'post'|'put'|'delete'.