/* Facts */
man(nisse).
man(peter).
man(bosse).

woman(ulrika).
woman(anne).

beautiful(ulrika).
beautiful(nisse).
beautiful(peter).

rich(nisse).
rich(anne).

strong(anne).
strong(peter).
strong(bosse).

kind(bosse).

/****************************************************************
 * Like.
 ****************************************************************/

like(X, Y) :-
    man(X),
    woman(Y),
    beautiful(Y).

like(peter, Y) :-
    kind(Y).

like(nisse, Y) :-
    woman(Y),
    like(Y, nisse).

/* Ulrika likes men who likes her and is (rich & kind) or (beautiful & strong) */
like(ulrika, Y) :-
    man(Y),
    ((rich(Y), kind(Y)); (beautiful(Y), strong(Y))),
    like(Y, ulrika).

/****************************************************************
 * Happy.
 ****************************************************************/

happy(X) :-
    rich(X);

    (((man(X), woman(Y)); (woman(X), man(Y))),
     like(X, Y),
     like(Y, X)).

/****************************************************************
 * How many persons like Ulrika?
 ****************************************************************/

how_many_like_ulrika :-
    findall(X, like(X, ulrika), B),
    length(B, N),
    write(N), write(' people likes ulrika'), nl.
