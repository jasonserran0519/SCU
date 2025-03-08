quicksort([],[]) :- !.
quicksort([X|Xs],Y) :- partition(Xs,X,L1,L2), quicksort(L1,C), quicksort(L2,D), append(C,[X|D],Y).

%Code for Partition
partition(_,[],[],[]) :- !.   % pivot, input, below, above
partition(P,[H|T],L1,[H|L2]) :- H > P ,!, partition(P,T,L1,L2).
partition(P,[H|T],[H|L1], L2) :- H =< P, partition(T,P,L1,L2).
