% Zadani c. 35:
% Napiste program resici ukol dany predikatem u35(LIN,LOUT), kde LIN je vstupni
% celociselny seznam a LOUT je vystupni seznam obsahujici vsechny prvky seznamu
% LIN, ve kterem jsou vsechna licha cisla predsunuta pred suda cisla.

% Testovaci predikaty:                       		% LOUT
u35_1:- u35([5,-7,4, 8,3,1,0,-2],LOUT),write(LOUT).	% [5,-7,3,1,4,8,0,-2]
u35_2:- u35([8,4,2,0,-2,1],LOUT),write(LOUT).		% [1,8,4,2,0,-2]
u35_3:- u35([],LOUT),write(LOUT).			% []
u35_r:- write('Zadej LIN: '),read(LIN),
	u35(LIN,LOUT),write(LOUT).

% Reseni:
u35(LIN, LOUT) :- odd(LIN, Odd), even(LIN, Even), join(Odd, Even, LOUT).

% Gets all even numbers from the array
even([], []).
even([X|LIN], [X|LOUT]) :- X mod 2 =:= 0, even(LIN, LOUT).
even([_|LIN], LOUT) :- even(LIN, LOUT).

% Gets all odd numbers from the array
odd([], []).
odd([X|LIN], [X|LOUT]) :- X mod 2 =\= 0, odd(LIN, LOUT).
odd([_|LIN], LOUT) :- odd(LIN, LOUT).

% Joins two arrays
join([], [], []).
join([X|A], B, [X|LOUT]) :- join(A, B, LOUT).
join([], [X|B], [X|LOUT]) :- join([], B, LOUT).
