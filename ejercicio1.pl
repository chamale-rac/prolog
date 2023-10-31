progenitor(francisco, cony).
progenitor(francisco, marvin).
progenitor(maria, cony).
progenitor(maria, marvin).

progenitor(oscar, samuel).
progenitor(oscar, andrea).

progenitor(cony, samuel).
progenitor(cony, andrea).

hombre(francisco).
mujer(maria).

hombre(marvin).
hombre(oscar).
hombre(samuel).

mujer(cony).
mujer(andrea).

% rel - padres
padre(X, Y) :- progenitor(X, Y), hombre(X).
madre(X, Y) :- progenitor(X, Y), mujer(X).

% rel - hijx
hijo(X, Y) :- progenitor(Y, X), hombre(X).
hija(X, Y) :- progenitor(Y, X), mujer(X).

% rel - abuelx
abuelo(X, Z) :- padre(X, Y), progenitor(Y, Z).
abuela(X, Z) :- madre(X, Y), progenitor(Y, Z).

% rel - hermanx
hermano(X, Y) :- progenitor(Z, X), progenitor(Z, Y), hombre(X), X\=Y.
hermana(X, Y) :- progenitor(Z, X), progenitor(Z, Y), mujer(X), X\=Y.

% rel - tix
tio(X, Y) :- progenitor(Z, Y), hermano(X, Z).
tia(X, Y) :- progenitor(Z, Y), hermana(X, Z).

% rel - sobrinx
sobrino(X, Y) :- progenitor(Z, X), (hermano(Z, Y);hermana(Z, Y)), hombre(X).
sobrina(X, Y) :- progenitor(Z, X), (hermano(Z, Y);hermana(Z, Y)), mujer(X).
