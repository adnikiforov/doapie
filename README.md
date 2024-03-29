doapie
======

Doapie is wrapper for DigitalOcean cloud platform API - DigitalOceanAPIErlang

### Try it

``` bash
rebar get-deps compile
cd priv && cp doapie.config.example doapie.config && nano doapie.config
```
Set ```token``` value with your token from DigitalOcean ([here](https://cloud.digitalocean.com/settings/applications))
``` bash
erl -pa ebin -pa deps/*/ebin -config priv/doapie.config
```

``` erlang
application:ensure_all_started(doapie).
> 12:49:24.878 [info] Application lager started on node nonode@nohost
12:49:24.893 [info] Application crypto started on node nonode@nohost
12:49:24.907 [info] Application asn1 started on node nonode@nohost
12:49:24.907 [info] Application public_key started on node nonode@nohost
12:49:24.942 [info] Application ssl started on node nonode@nohost
12:49:24.949 [info] Application ibrowse started on node nonode@nohost
12:49:24.951 [info] Application jsx started on node nonode@nohost
12:49:24.951 [info] Application doapie started on node nonode@nohost

rr(doapie).
> [account,limits]

doapie:get_account().
> #account{droplet_limit = 10,
         email = <<"example@mail">>,
         uuid = <<"a779050df9ffdd6d5d295b1b4916ec16fe7c554a">>,
         email_verified = true,
         limits = #limits{limit = 1200,remaining = 1190,
                          reset = 1417774700}}
```

### Use it
So, now it's not ready for real use, but you can include it in your application, if you want.
All you need is add ```application:ensure_all_started(doapie).``` into your ```start/n``` function and ```-include("api_objects.hrl").``` if you want to receive records instead of tuples from API requests.

### Implemented
```erlang
%% Get account info
-spec get_account() -> maybe_error(account()).

%% Get all account actions (by pages, max 25 items per page)
-spec get_actions_list(non_neg_integer(), non_neg_integer()) -> maybe_error(actions_list()).

%% Get action by id
-spec get_action(non_neg_integer()) -> maybe_error(action()).

%% Get all domains
-spec get_domains_list(non_neg_integer(), non_neg_integer()) -> maybe_error(domains_list()).

%% Get domain by id
-spec get_domain(non_neg_integer()) -> maybe_error(domain()).

%% Create domain by name and ip address
-spec create_domain(nonempty_string(), nonempty_string()) -> maybe_error(domain()).

%% Delete domain by id
-spec delete_domain(non_neg_integer()) -> maybe_error(limits()).
```

### Many thanks
 - @cmullaparthi [cmullaparthi/ibrowse](https://github.com/cmullaparthi/ibrowse.git)
 - @talentdeficit [talentdeficit/jsx](https://github.com/talentdeficit/jsx.git)
 - @basho [basho/lager](https://github.com/basho/lager.git)
