%%%-------------------------------------------------------------------
%% @doc todo public API
%% @end
%%%-------------------------------------------------------------------

-module(todo_app).

-include("todo.hrl").

-behaviour(application).

-export([start/2, stop/1, test/0]).

start(_StartType, _StartArgs) ->
    todo_sup:start_link().

stop(_State) ->
    ok.

test() ->
    X1 = #todo{status = urgent, text = "Fix err"},
    X2 = X1#todo{status = done},
    #todo{who=W, text=Txt} = X2,
    io:fwrite("~s, ~s~n",[W,Txt]).

%% internal functions
