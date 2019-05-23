drzewo(nil). 
drzewo(_, P, _) :- drzewo(P).
drzewo(_, _, P) :- drzewo(P).

insertBST(nil, N, drzewo(N, nil, nil)).
insertBST(drzewo(V, P, Q), N, drzewo(VA, PA, QA)) :- N =< V, V == VA, insertBST(P, N, PA), Q == QA.
insertBST(drzewo(V, P, Q), N, drzewo(VA, PA, QA)) :- V < N, V == VA, P == PA, insertBST(Q, N, QA).

wypiszBST(nil, []).
wypiszBST(drzewo(N, P, Q), L) :- wypiszBST(P, L1), wypiszBST(Q, L2, L1), append(L1, [N | L2], L).

liscie(nil, []).
liscie(drzewo(N, nil, nil), [N]).
liscie(drzewo(N, P, Q), L) :- liscie(P, L1), liscie(Q, L2), append(L1, L2, L).



