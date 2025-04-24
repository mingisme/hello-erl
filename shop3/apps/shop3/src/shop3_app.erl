%%%-------------------------------------------------------------------
%% @doc shop3 public API
%% @end
%%%-------------------------------------------------------------------

-module(shop3_app).

-behaviour(application).

-export([start/2, stop/1, total/1]).

start(_StartType, _StartArgs) ->
    shop3_sup:start_link().

stop(_State) ->
    ok.

cost(oranges) ->5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) ->7.

total(L) ->
    lists:sum([ cost(A) * B || {A,B} <- L]).


%% internal functions
