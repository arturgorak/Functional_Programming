-module(poczatek).
-export([start/0,procB/0,procA/1]).
 
procA(PID_B) ->
  io:format("Process A started with PID=~p.~n", [self()]),
    io:format("Process A sends atom czesc to B.~n"),
  PID_B ! czesc.
 
 
procB() ->
  io:format("Process B started with PID=~p.~n", [self()]),
  receive
    czesc -> io:format("Process B received atom czesc.~n")
  end.
 
start() ->
  PID_B = spawn(poczatek, procB, []),
  spawn(poczatek, procA, [PID_B]).