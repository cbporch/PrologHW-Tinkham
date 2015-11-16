% jobs_ok(+Shifts, +Employees)
% Checks a list of shifts consisting of Employees
% and verifies that the given Shifts has no duplicates,
% that the employees are 'qualified' for their jobs.
jobs_ok([[A,B,C,D], [E,F,G,H], [I,J,K,L], [M,N,O,P]], [Emp|T]) :-
	no_dup(A, [B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]),
	employee_ok(Emp,[[A,B,C,D],
			 [E,F,G,H],
			 [I,J,K,L],
			 [M,N,O,P]]),
	jobs_ok([[A,B,C,D],
		 [E,F,G,H],
		 [I,J,K,L],
		 [M,N,O,P]], T).
jobs_ok(_Shifts, []).

% no_dup(+Item, +L)
% Checks for any duplicates in L.
% Returns false if there are duplicates.
no_dup(_, []).
no_dup(Item, [H|T]) :-
	Item \== H,
	no_dup(Item, T),
	no_dup(H, T).
	
% employee_ok(+Employee, +Shifts)
% Checks that the current employee is in
% the current shift, and is qualified.
% Employees not in the shift are accepted as well.
employee_ok([Name,1,_,_], [[Name,_,_,_]|_]).
employee_ok([Name,1,_,_], [[_,Name,_,_]|_]).
employee_ok([Name,_,1,_], [[_,_,Name,_]|_]).
employee_ok([Name,_,_,1], [[_,_,_,Name]|_]).
employee_ok([Name|T], [_|Rest]) :-
	employee_ok([Name|T], Rest).
employee_ok([Name,_,_,_],[[A,B,C,D], [E,F,G,H], [I,J,K,L], [M,N,O,P]]) :-
	not(member(Name, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P])).
