function out = f(u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: f.m
%
% Description: Flow map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global a b e lambda wc1 wc2 barwc1 barwc2

% state
x1 = u(1);
x2 = u(2);
tau = u(3);
x = [x1;x2];

psi0 = 4*x1*x2 + 2*x2^2 + 2*(-a*sin(x1) - b*x2) * (x2 + x1) + lambda * norm(x);
psi0w = 2*abs(x2+x1)*(barwc2*abs(x2)+barwc1);
psi1 = 2*(x1 + x2);

uc1 = 0;
if psi0 + psi0w <= 0
    uc1 = 0;
else
    uc1 = -(psi0+psi0w)/psi1;
end

% flow map
x1dot = x2;
x2dot = -a*sin(x1) - (b+wc2)*x2 + uc1 + wc1;  % write z instead of uc1

out = [x1dot; x2dot; 1];