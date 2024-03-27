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
u35(LIN, LOUT) :- even_odd(LIN, Odd, Even), join(Odd, Even, LOUT).

% Sorts even and odd number to its arrays
even_odd([], [], []).
even_odd([X|LIN], Odd, [X|Even]) :- X mod 2 =:= 0, even_odd(LIN, Odd, Even).
even_odd([X|LIN], [X|Odd], Even) :- even_odd(LIN, Odd, Even).

% Joins two arrays
join([], B, B).
join([X|A], B, [X|LOUT]) :- join(A, B, LOUT).
