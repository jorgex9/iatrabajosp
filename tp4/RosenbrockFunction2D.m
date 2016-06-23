function z=RosenbrockFunction2D(x,y)

%% 
% <latex>
% For plotting purposes it is helpful to have two input arguments
% each of which can be vectors or matrices. The output z is of the same
% size as x and y.
% Evaluates the two-dimensional Rosenbrock function
% \begin{equation} 
% z=f(x,y) = 100(y-x^2)^2 + (1-x)^2.
% \end{equation}
% The minimum of this function is $z=0$ at $(x,y)=(1,1)$.
% </latex>

z=100*(y - x.^2).^2 + (1-x).^2;

