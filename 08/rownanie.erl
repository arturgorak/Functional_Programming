-module (rownanie).
-export ([rownanie/3]).

delta(A, B, C) -> (B*B) - (4*A*C).


rownanie(A, B, C) ->
    D = delta(A, B, C),
    if 
        D < 0 -> 
            brakRozwiazan;
        D == 0 -> 
            (-B) / 2 * A;
        D > 0 -> 
            {(-B - math:sqrt(D)) / (2 * A), (-B + math:sqrt(D)) / (2 * A)}
    end.

