/* Facts */

directlynorth(a,f).
directlynorth(b,g).
directlynorth(c,h).
directlynorth(d,i).
directlynorth(e,j).
directlynorth(f,k).
directlynorth(g,l).
directlynorth(h,m).
directlynorth(i,n).
directlynorth(j,o).
directlynorth(k,p).
directlynorth(l,q).
directlynorth(m,r).
directlynorth(n,s).
directlynorth(o,t).

directlyeast(b,a).
directlyeast(c,a).
directlyeast(d,c).
directlyeast(e,d).
directlyeast(g,f).
directlyeast(h,g).
directlyeast(i,h).
directlyeast(j,i).
directlyeast(l,k).
directlyeast(m,l).
directlyeast(n,m).
directlyeast(o,n).
directlyeast(q,p).
directlyeast(r,q).
directlyeast(s,r).
directlyeast(t,s).

/* Rules */

directlysouth(S,N):- directlynorth(N,S).
directlywest(W,E):- directlyeast(E,W).

north(A,B):-directlynorth(A,B).
north(A,B):-directlynorth(A,C),north(C,B).

east(A,B):-directlyeast(A,B).
east(A,B):-directlyeast(A,C),east(C,B).

south(A,B):-directlysouth(A,B).
south(A,B):-directlysouth(A,C),south(C,B).

west(A,B):-directlywest(A,B).
west(A,B):-directlywest(A,C),west(C,B).

northwest(A,B):-north(A,C),west(B,C).
northeast(A,B):-north(A,C),east(B,C).

southwest(A,B):-south(A,C),west(C,B).
southeast(A,B):-south(A,C),east(C,B).























