schedule(monday,programming).
schedule(monday,maths).
schedule(monday,english).
schedule(monday,spanish).
schedule(monday,circuits).
schedule(monday,church).
schedule(friday,programming).
schedule(saturday,programming).
schedule(sunday,programming).

difficulty(maths,hard).
difficulty(programming,hard).
difficulty(english,easy).

classinformation(Day, Class, Diff) :-
schedule(Day, Class), 
difficulty(Class, Diff).

