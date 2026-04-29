%% Your code here
same_row(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), X = XX, Y != YY.

same_column(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_), Y = YY, X != XX.

possible_targets(X,Y,XX,YY) :- same_row(X,Y,XX,YY), area(XX,YY,A), not before_area(X,Y,XX,YY,A).

possible_targets(X,Y,XX,YY) :- same_column(X,Y,XX,YY), area(XX,YY,A), not before_area(X,Y,XX,YY,A).


1 { target(X,Y,XX,YY) : possible_targets(X,Y,XX,YY) } 1 :- number(X,Y,_).


occupied(A) :- target(X,Y,XX,YY), area(XX,YY,A).

:- area(_,_,A), not occupied(A).

path(X,Y,XX,YY,X,PY) :- target(X,Y,XX,YY), Y <= YY, cell(X,PY), Y <= PY, PY <= YY.

path(X,Y,XX,YY,X,PY) :- target(X,Y,XX,YY), YY <= Y, cell(X,PY), YY <= PY, PY <= Y.

path(X,Y,XX,YY,PX,Y) :- target(X,Y,XX,YY), X <= XX, cell(PX,Y), X <= PX, PX <= XX.

path(X,Y,XX,YY,PX,Y) :- target(X,Y,XX,YY), XX <= X, cell(PX,Y), XX <= PX, PX <= X.

:- path(X1,Y1,XX1,YY1,PX,Py), path(X2,Y2,XX@,YY2,PX,PY), number(X1,Y1,_), number(X2,Y2,_), X1 != X2.

:- path(X!,Y1,XX1,YY1,PX,PY), path(X2,Y2,XX2,YY2,PX,PY), number(X1,Y1,_), number(X2,Y2,_), Y1 != Y2.


#show target/4.