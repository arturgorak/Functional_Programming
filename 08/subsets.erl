-module (subsets).
-export ([subsets/2]).

subsets(_, 0) -> [[]];
subsets([], _) -> [];
subsets([A|Rest], K) -> 
    lists:map(fun(X) -> [A] ++ X end, subsets(Rest, K - 1)) ++ subsets(Rest, K).