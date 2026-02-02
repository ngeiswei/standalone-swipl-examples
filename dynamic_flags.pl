% Standalone SWI-Prolog program to experiment with dynamic flags

use_module(library(main)).
:- initialization(main, main).

% Declare flags
:- dynamic flag_a/1.
:- dynamic flag_b/1.
:- dynamic flag_c/1.

% Initialize flags
flag_a(true).
flag_b(false).
flag_c(true).

% Overwrite flag_c
:- retractall(flag_c(_)), assertz(flag_c(false)).

% Print all flags
main :-
    findall((X, Y, Z), (flag_a(X), flag_b(Y), flag_c(Z)), R),
    writef("Results: %w\n", [R]).
