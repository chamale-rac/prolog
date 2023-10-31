% definicion de grafo
arista(a, b).
arista(a, c).
arista(a, d).
arista(c, d).

% extras para tests
arista(c, x).
arista(x, y).

% predicado camino
camino(X, Y, [X, Y]) :- arista(X, Y).
camino(X, Y, [X | Resto]) :- arista(X, Z), camino(Z, Y, Resto).
