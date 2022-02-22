-module (cs2).
-export ([server/0,start/1,client/2]).

recvMsg() -> receive
    {X, PID} -> PID ! X*X,
    recvMsg()
    after 3000 -> 
        io:format("Server is going down...~n",[])
    end.

server() -> io:format("Server started with PID= ~p ~n", [self()]),
            recvMsg().


client(_, []) -> 1=1;
client(SPID, [X|XS]) ->
    io:write("Clien sends ~p ~n", [X]), 
    SPID ! {X, self()},
    receive
        X -> io:format("~p ~n", [X]),
        client(SPID, XS)
    end.
        

start(List) -> Server_PID = spawn(cs2,server,[]),
           spawn (cs2, client, [Server_PID, List]).

