%%%-------------------------------------------------------------------
%% @doc for public API
%% @end
%%%-------------------------------------------------------------------

-module(for_app).

-behaviour(application).

-export([start/2, stop/1,for/3]).

start(_StartType, _StartArgs) ->
    for_sup:start_link().

stop(_State) ->
    ok.

for(MAX,MAX,F) -> 
    [F(MAX)];
for(I,MAX,F) ->
    [F(I) | for(I+1,MAX,F)].


%% internal functions
