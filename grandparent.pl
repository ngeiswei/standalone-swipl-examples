% Standalone SWI-Prolog program that outputs all grandparents

use_module(library(main)).
:- initialization(main, main).

% Parents groundings
parent(jon, alex).
parent(alex, louise).
parent(alex, robert).

% Grand parent rule
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Remove parent(alex, robert)
:- dynamic parent/2.
:- retractall(parent(alex, robert)).

% Retrieve and print all grandparents
main :- findall(gp(X, Y), grandparent(X, Y), R), writef("Results: %w\n", [R]).
