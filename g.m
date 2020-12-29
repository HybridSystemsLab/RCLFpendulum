function out = g(u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: g.m
%
% Description: Jump map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global c cprime e0 e1 delta wd;

% state
x1 = u(1);
x2 = u(2);
tau = u(3);

uc2 = 0;

% jump map
if ((x1 <= uc2) && (x2 <= 0))
	x1plus = x1 + rho(x1,c,cprime) * x1;
	x1plus = uc2;
	x2plus = -(restitutionE(x1,e0,e1)+wd) * x2;
else
	x1plus = x1;
	x2plus = x2;
end

tauplus = 0;

out = [x1plus;x2plus;tauplus];