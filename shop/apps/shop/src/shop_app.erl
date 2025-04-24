%%%-------------------------------------------------------------------
%% @doc shop public API
%% @end
%%%-------------------------------------------------------------------

-module(shop_app).

-behaviour(application).

-export([start/2, stop/1, total/1]).

start(_StartType, _StartArgs) ->
    shop_sup:start_link().

stop(_State) ->
    ok.

cost(oranges) ->5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) ->7.

total([{What,N}|T]) -> cost(What)*N + total(T);
total([]) -> 0.



%% internal functions
