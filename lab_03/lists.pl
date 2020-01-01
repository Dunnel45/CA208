/* Rules */
myElem(X,[X|_]).
myElem(X,[_|T]):-
    myElem(X,T).

myHead(X,[X|_]).

myLast(X,[X]).
myLast(X,[_|T]):-
    myLast(X,T).

myTail(X,[_|X]).

myAppend([],L,L).
myAppend([H|L1],L2,[H|L3]):-
    myAppend(L1,L2,L3).

myReverse([],[]).
myReverse([X|T],Y):-
    myReverse(T,T1), myAppend(T1,[X],Y).

myDelete(X,[X|L],L).
myDelete(X,[_|T],[_|Tail]):-
    myDelete(X,T,Tail).
