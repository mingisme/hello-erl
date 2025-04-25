%%%-------------------------------------------------------------------
%% @doc perms public API
%% @end
%%%-------------------------------------------------------------------

-module(perms_app).

-behaviour(application).

-export([start/2, stop/1, perms/1]).

start(_StartType, _StartArgs) ->
    perms_sup:start_link().

stop(_State) ->
    ok.

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L -- [H])].

%% internal functions
