%%%-------------------------------------------------------------------
%% @doc pythag public API
%% @end
%%%-------------------------------------------------------------------

-module(pythag_app).

-behaviour(application).

-export([start/2, stop/1, pythag/1]).

start(_StartType, _StartArgs) ->
    pythag_sup:start_link().

stop(_State) ->
    ok.

pythag(N) ->
    [
        {A,B,C} ||
            A <- lists:seq(1,N),
            B <- lists:seq(1,N),
            C <- lists:seq(1,N),
            A + B + C =< N,
            A*A + B*B =:= C*C
    ].

%% internal functions
