-module (posNeg).
-export ([posNeg/1]).


posNeg(List) -> func(List, 0, 0).

func([], Pos, Neg)->
    {Pos, Neg};
func([A|Rest], Pos, Neg) when A > 0 ->
    func(Rest, Pos + 1, Neg);
func([A|Rest], Pos, Neg) when A < 0 ->
    func(Rest, Pos, Neg + 1). 