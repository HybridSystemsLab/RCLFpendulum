function [v] = D(u) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Ricardo Sanfelice
%
% Project: Simulation of a hybrid system
%
% Name: D.m
%
% Description: Jump set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global delta;

% state
x1 = u(1);
x2 = u(2);

uc2 = 0;

if ((x1 <= uc2) && (x2 <= 0))  % jump condition
    v = 1;  % report jump
else
    v = 0;   % do not report jump
end

