%empty tree
tree(empty).

% node with Val, L and R
tree(node(Val,L1,L2)).

% insert
insert(X, empty,node(X,empty,empty)).
insert(X, node(Val,L1,L2),node(Val,NewL1,L2)) :- X =< Val, insert(X,L1,NewL1).
insert(X, node(Val,L1,L2),node(Val,L1,NewL1)) :- X > Val, insert(X,L2,NewL2).

%exists
exists(X, node(X,_,_)).
exists(X, node(Val,L1,_)) :- X < Val, exists(X,L1).
exists(X, node(Val,_,L2)) :- X > Val, exists(X,L2).
