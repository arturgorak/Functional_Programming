-module (cs1).
-export ([server/0,start/1,client/2]).

recvMsg() -> receive
    end_of_list -> [];
    X -> io:format("~p ~n", [X * X])

                %% tutaj obsluga przychodzacych komunikatow, 
                %% czyli kod serwera.
    end,
    recvMsg().

server() -> io:format("Server started. Awaiting for messages ~n"),
            recvMsg().


client(SPID, []) -> SPID ! end_of_list;
client(SPID, [X|XS]) -> SPID ! X,
    client(SPID, XS).
                %% dzialanie klienta, to po prostu wyslanie atomu msg
                %% do serwera. Oczywiscie moze to byc bardziej skomplikowane...

start(List) -> Server_PID = spawn(cs1,server,[]),
           spawn (cs1, client, [Server_PID, List]).

