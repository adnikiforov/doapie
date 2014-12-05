%%%-------------------------------------------------------------------
%%% @author a.d.nikiforov@gmail.com
%%% @copyright (C) 2014
%%% @doc
%%% API resources (URLs)
%%% @end
%%% Created : 05. Dec 2014 11:21
%%%-------------------------------------------------------------------
-author("a.d.nikiforov@gmail.com").

%% Account info
-define(DO_ACCOUNT_INFO, {"https://api.digitalocean.com/v2/account", get, []}).

%% %% Actions
%% -define(DO_ACTIONS_LIST, "https://api.digitalocean.com/v2/actions").
%% -define(DO_ACTION, "https://api.digitalocean.com/v2/actions/{ACTION_ID}").
%%
%% %% Domains
%% -define(DO_DOMAINS_LIST, "https://api.digitalocean.com/v2/domains").
%% -define(DO_DOMAIN, "https://api.digitalocean.com/v2/domains/{DOMAIN_ID}").
%%
%% %% Domain records
%% -define(DO_DOMAIN_RECORDS_LIST, "https://api.digitalocean.com/v2/domains/{DOMAIN_ID}/records").
%% -define(DO_DOMAIN_RECORD, "https://api.digitalocean.com/v2/domains/{DOMAIN_ID}/records/{RECORD_ID}").
%%
%% %% Droplets
%% -define(DO_DROPLETS_LIST, "https://api.digitalocean.com/v2/droplets").
%% -define(DO_DROPLET, "https://api.digitalocean.com/v2/droplets/{DROPLET_ID}").
%% -define(DO_DROPLET_KERNELS_LIST, "https://api.digitalocean.com/v2/droplets/{DROPLET_ID}/kernels").
%% -define(DO_DROPLET_SNAPSHOTS_LIST, "https://api.digitalocean.com/v2/droplets/{DROPLET_ID}/shapshots").
%% -define(DO_DROPLET_BACKUPS_LIST, "https://api.digitalocean.com/v2/droplets/{DROPLET_ID}/backups").
%% -define(DO_DROPLET_ACTIONS_LIST, "https://api.digitalocean.com/v2/droplets/{DROPLET_ID}/actions").
%% -define(DO_DROPLETS_UPGRADES, "https://api.digitalocean.com/v2/droplet_upgrades").
