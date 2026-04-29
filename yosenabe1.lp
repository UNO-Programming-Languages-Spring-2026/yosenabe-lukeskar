%% Your code here
same_row(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), X = XX, Y != YY.

same_column(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), Y = YY, X != XX.

before_area(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), X = XX, Y < YY, area(X,Y2,A), Y < Y2, Y2 < YY.

before_area(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), X = XX, YY < Y, area(X,Y2,A), YY < Y2, Y2 < Y.

before_area(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), Y = YY, X < XX, area(X2,Y,A), X < X2, X2 < XX.

before_area(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), Y = YY, XX < X, area(X2,Y,A), XX < X2, X2 < X.


possible_targets(X,Y,XX,YY) :- same_row(X,Y,XX,YY), area(XX,YY,A), not before_area(X,Y,XX,YY,A).

possible_targets(X,Y,XX,YY) :- same_column(X,Y,XX,YY), area(XX,YY,A), not before_area(X,Y,XX,YY,A).


1 { target(X,Y,XX,YY) : possible_targets(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.