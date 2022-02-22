-module (zad1).
-export ([start/1, hello/1]).

hello(Msg) -> io:format("Tu proces ~p ~n", [Msg]),
io:format("Tu proces ~p ~n", [Msg]),
io:format("Tu proces ~p ~n", [Msg]).

start(1) -> spawn(zad1, hello, [1]);
start(N) -> spawn(zad1, hello, [N]),
            start(N-1).
           



