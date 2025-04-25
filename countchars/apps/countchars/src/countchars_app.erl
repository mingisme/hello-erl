%%%-------------------------------------------------------------------
%% @doc countchars public API
%% @end
%%%-------------------------------------------------------------------

-module(countchars_app).

-behaviour(application).

-export([start/2, stop/1, count_chars/1]).

start(_StartType, _StartArgs) ->
    countchars_sup:start_link().

stop(_State) ->
    ok.

count_chars(Str) ->
    count_chars(Str, #{}).

count_chars([H|T], X) ->
    case maps:is_key(H,X) of
        true ->
            N = maps:get(H,X),
            count_chars(T, X#{H => N + 1});
        false ->
            count_chars(T, X#{H => 1 })
    end;
count_chars([],X) ->
    X.

%% internal functions
