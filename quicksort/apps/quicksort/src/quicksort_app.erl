%%%-------------------------------------------------------------------
%% @doc quicksort public API
%% @end
%%%-------------------------------------------------------------------

-module(quicksort_app).

-behaviour(application).

-export([start/2, stop/1, qsort/1]).

start(_StartType, _StartArgs) ->
    quicksort_sup:start_link().

stop(_State) ->
    ok.

qsort([]) -> [];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
        ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

%% internal functions
