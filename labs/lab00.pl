ojciec(Dziecko, Ojciec) :-
  dziecko(Dziecko, _, Ojciec).

matka(Dziecko, Matka) :-
  dziecko(Dziecko, Matka, _).

rodzic(D, R) :- dziecko(D, _, R).
rodzic(D, R) :- dziecko(D, R, _).

babcia(Dziecko, Babcia) :-
  rodzic(Dziecko, Rodzic),
  matka(Rodzic, Babcia).

prarodzic(Dziecko, Prarodzic) :-
  rodzic(Dziecko, Rodzic),
  rodzic(Rodzic, Prarodzic).

przodek(Dziecko, Przodek) :-
  rodzic(Dziecko, Przodek).
przodek(Dziecko, Przodek) :-
  przodek(Dziecko, Rodzic),
  przodek(Rodzic, Przodek).

dziecko(jasio, ewa, jan).
dziecko(stasio, ewa, jan).
dziecko(basia, anna, piotr).
dziecko(jan, ela, jakub).


lista([]).
lista([_ | B]) :- lista(B).

pierwszy(E, [E | _]).

