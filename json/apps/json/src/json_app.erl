%%%-------------------------------------------------------------------
%% @doc json public API
%% @end
%%%-------------------------------------------------------------------

-module(json_app).

-behaviour(application).

-export([start/2, stop/1, test/0]).

start(_StartType, _StartArgs) ->
    json_sup:start_link().

stop(_State) ->
    ok.

test()->
    M1=#{a=>1,b=>2},
    jsx:encode(M1).

%% internal functions
