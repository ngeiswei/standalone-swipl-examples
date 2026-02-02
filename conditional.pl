% Standalone SWI-Prolog program to experiment with conditionals

use_module(library(main)).
:- initialization(main, main).

% Initialize flags
flag_a(true).
flag_b(false).
flag_c(true).

% Conditional rule.  If A is true then B and C are set according to
% flag_b(B) and flag_c(C).  Otherwise B and C are set to true.
conditional(A, B, C) :-
    flag_a(A),
    (A -> (flag_b(B), flag_c(C))
    ; (B = true, C = true)).

% Print all flags
main :-
    findall((X, Y, Z), conditional(X, Y, Z), R),
    writef("Results: %w\n", [R]).
