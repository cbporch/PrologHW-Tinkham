% jobs_ok(+Shifts, +Employees)
% Employee name exists in Shifts, which consists
% of 16 unique names, and is qualified for the
% job.
jobs_ok([[A,B,C,D], [E,F,G,H], [I,J,K,L], [M,N,O,P]], [Emp|T]) :-
	employee_ok(Emp,[[A,B,C,D],
			 [E,F,G,H],
			 [I,J,K,L],
			 [M,N,O,P]]),
	jobs_ok([[A,B,C,D],
		 [E,F,G,H],
		 [I,J,K,L],
		 [M,N,O,P]], T).
jobs_ok(_Shifts, []).

% employee_ok( +Employee, +Shifts)
% Checks that the current employee is in
% the current shift, and is qualified.
% Unscheduled employees are accepted as well.
employee_ok([Name,1,_,_], [[Name,_,_,_]|_]).
employee_ok([Name,1,_,_], [[_,Name,_,_]|_]).
employee_ok([Name,_,1,_], [[_,_,Name,_]|_]).
employee_ok([Name,_,_,1], [[_,_,_,Name]|_]).
employee_ok([Name|T], [_|Rest]) :-
	employee_ok([Name|T], Rest).
employee_ok([Name,_,_,_],[[A,B,C,D], [E,F,G,H], [I,J,K,L], [M,N,O,P]]) :-
	not(member(Name, [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P])).
