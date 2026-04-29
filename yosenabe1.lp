%% Your code here
same_row(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), X = XX, Y != YY.

same_column(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), Y = YY, X != XX.

possible_targets(X,Y,XX,YY) :- same_row(X,Y,XX,YY), area(XX,YY,A), not before_area(X,Y,XX,YY,A).

possible_targets(X,Y,XX,YY) :- same_column(X,Y,XX,YY), area(XX,YY,A), not before_area(X,Y,XX,YY,A).


1 { target(X,Y,XX,YY) : possible_targets(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.




