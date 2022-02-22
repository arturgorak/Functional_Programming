-module (splitter).
-export ([split/1]).

func([], A, B) -> {A, B};
func([X|XS], A, B) ->
    if  
        is_integer(X) -> func(XS,  [X] ++ A, B);
        true -> func(XS, A,  [X] ++ B)
    end.

split(List) -> func(List, [], []).



