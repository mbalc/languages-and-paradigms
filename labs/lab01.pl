suma([A | T], S) :- suma(T, S - A).
suma([], S) :- S is 0.


dlugosc([_ | B], L) :- dlugosc(B, L - 1).
dlugosc([], L) :- L is 0.


lim([A | B], P) :- A >= P, lim(B, P).
lim([], _).

element([A | _], E) :- A is E.
element([_ | B], E) :- element(B, E).

min(L, E) :- lim(L, E), element(L, E).


odwroc_([E | T], B, C) :- odwroc_(T, B, [E | C]).
odwroc_([], B, C) :- B = C.


odwroc(A, B) :- odwroc_(A, B, []).

palindrom(A) :- odwroc(A, A).


slowo_([a | B], C) :- slowo_(B, [b | C]).
slowo_(A, A).

slowo(A) :- slowo_(A, []).


slowo_([a | B], R, C) :- slowo_(B, R, [b | C]).
slowo_(A, R, C) :- append(C, R, A).

slowo(A, R) :- slowo_(A, R, []).

