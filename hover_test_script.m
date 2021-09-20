%{
syms x y

eqn1 = x*sind(45)+y*sind(70) == 58860;

eqn2 = x*cosd(45)+y*cosd(70) == 0;

[A,B] = equationsToMatrix([eqn1,eqn2] , [x,y]);

S = linsolve(A,B); 
%}

fun = @hover_function;

x0 = [2900 2900 45 -45];

x = fsolve(fun,x0) %#ok<NOPTS>
