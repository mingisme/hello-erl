%%%-------------------------------------------------------------------
%% @doc fun1 public API
%% @end
%%%-------------------------------------------------------------------

-module(fun1_app).

-behaviour(application).

-export([start/2, stop/1, funAsArg/1, funAsReturn/1]).

start(_StartType, _StartArgs) ->
    fun1_sup:start_link().

stop(_State) ->
    ok.

funAsArg(L) ->
    lists:map(fun(X)->2*X end, L).

funAsReturn(N) ->
    Mult = fun(Times) ->
        fun(X) ->
            X * Times
        end
    end,
    Triple=Mult(3),
    Triple(N).



%% internal functions
