%%%-------------------------------------------------------------------
%% @doc trytest public API
%% @end
%%%-------------------------------------------------------------------

-module(trytest_app).

-behaviour(application).

-export([start/2, stop/1, demo1/0, demo2/0, demo3/0, some_func/1]).

start(_StartType, _StartArgs) ->
    trytest_sup:start_link().

stop(_State) ->
    ok.

some_func(X) ->
    {P,_Q} = {X, 1},
    P.

demo3() ->
    try generate_exception(5)
    catch _:Reason:Stacktrace ->
        {Reason, erlang:display(Stacktrace)}
    end.

demo2()->
    [{I, (catch generate_exception(I))} || I <- [1,2,3,4,5]].

demo1() ->
    [catcher(I) || I <- [1,2,3,4,5]].

catcher(N) ->
    try generate_exception(N) of
       Val -> {N, normal, Val}
    catch
        throw:X -> {N, caught, thrown, X};
        exit:X -> {N, caught, exited, X};
        error:X -> {N, caught, error, X}
    end.

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT',a};
generate_exception(5) -> error(a).

%% internal functions
