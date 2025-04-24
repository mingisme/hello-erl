%%%-------------------------------------------------------------------
%% @doc shop2 public API
%% @end
%%%-------------------------------------------------------------------

-module(shop2_app).

-behaviour(application).

-export([start/2, stop/1, total/1]).

-import(lists, [sum/1, map/2]).

start(_StartType, _StartArgs) ->
    shop2_sup:start_link().

stop(_State) ->
    ok.

total(L) ->
    sum(map(fun({What, N})-> cost(What) * N end, L)).

cost(oranges) ->5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) ->7.


%% internal functions
