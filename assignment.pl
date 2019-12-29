route(dublin, cork, 200, 'fct').
route(cork, dublin, 200, 'fct').
route(cork, corkAirport, 20, 'fc').
route(corkAirport, cork, 25, 'fc').
route(dublin, dublinAirport, 10, 'fc').
route(dublinAirport, dublin, 20, 'fc').
route(dublinAirport, corkAirport, 225, 'p').
route(corkAirport, dublinAirport, 225, 'p').


locations(Source,Dest,Seen,Places,Time,M) :- route(Source,Dest,_,_),
               append([Dest,Source], Seen, L),
               reverse(L,Places),
               fastest_mode(Source,Dest,_,Time,M).
locations(Source,Dest,Seen,Places,Time,M) :- route(Source,X,_,_),
               not(member(X, Seen)),
               fastest_mode(Source,X,_,T,M),
               locations(X,Dest, [Source|Seen], Places, Z,M),
               Time is T + Z.
starting_point(Source,Dest,Places,Time,M) :- locations(Source, Dest,[], Places, Time,M).


foot(S,D,M,String) :-
               route(S,D,_,Modes),
               atom_chars(Modes, List),
               member(f, List),
               member(f, String),
               M = f.

car(S,D,M,String) :-
              route(S,D,_,Modes),
              atom_chars(Modes, List),
              member(c, List),
              member(c, String),
              M = c.

train(S,D,M,String) :-
              route(S,D,_,Modes),
              atom_chars(Modes, List),
              member(t, List),
              member(t, String),
              M = t.

plane(S,D,M,String) :-
              route(S,D,_,Modes),
              atom_chars(Modes, List),
              member(p, List),
              member(p, String),
              M = p.

speeds(p, 500).
speeds(t, 100).
speeds(c, 80).
speeds(f, 5).

fastest_mode(S,D,M,T,String) :-(plane(S,D,M,String);
                    train(S,D,M,String);
                    car(S,D,M,String);
                    foot(S,D,M,String)),
                    speeds(M, Speed),
                    route(S, D, Distance,_),
                    T is Distance / Speed,!.

quickest_time(S, D, Places, Times, M) :-
               findall(Time, starting_point(S, D, _, Time,M), L),
               min_member(Times, L),
               starting_point(S, D, Places, Times,M).


journey(S,D,M):- atom_chars(M,String),
    quickest_time(S,D,P,T,String),
    write('Hours = '),
    write(T),
    write('\n'),
    write('Visited = '),
    write(P),
    write('\n'),!.



















