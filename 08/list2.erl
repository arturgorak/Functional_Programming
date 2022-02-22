-module (list2).
-export ([even_pos/1, dlugosc/1]).
% Komentarz: funkcja obliczajaca silnie

dlugosc([]) -> 0;
dlugosc([_|Xs]) -> 1 + dlugosc(Xs).




even_pos([]) -> [];
even_pos([_]) -> [];
even_pos([_,Y|XS]) -> [Y] ++ even_pos(XS).

% silnia(0) -> 1;
% silnia(N) -> N * silnia (N-1).
% binom(N,K) -> silnia(N)/(silnia(K) * silnia(N-K)).