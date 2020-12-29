%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: CLF-based Control of Pendulum with Disturbances
at jumps
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: runWd.m
% Set of simulation files created and edited by 
% Ricardo Sanfelice
%--------------------------------------------------------------------------

%clear all 

%%%%%%%% INITIALIZE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions                                                  
x0 = [pi/2-0.0001;0;0]; % position, velocity, timer

% global constants
global a b c cprime e0 e1 r lambda delta wc1 wc2 barwc1 barwc2 wd
delta = 0.01; % update every 10 ms
a = 1;
b = 1;

% now define parameters of rho function (rho.m)
cprime = 0;
c0 = 0;

% now define parameters for the restitution function (restitutionE.m)
e0 = 1/3;
e1 = 2/3;

% disturbances
% comment as needed
%   flows
wc1 = 0;
wc2 = 0; 
barwc1 = 0;
barwc2 = 0;
%   jumps
wd = 0;
barwd = 0; 

% %   flows
wc1 = 0;
wc2 = 0; 
barwc1 = 0;
barwc2 = 0;
%   jumps
wd = 0.4;
barwd = 0.4; 

% %   flows
wc1 = 0;
wc2 = 0; 
barwc1 = 0;
barwc2 = 0;
%   jumps
wd = 0.8;
barwd = 0.8; 

% pick r small enough
r = 0.000000015;

% compute associated lambda
s = linspace(-pi/2,0,100);
for i = 1:100
    minToGo(i) = min(2*(1-(1+rho(s(i),c0,cprime))^2),1-(restitutionE(s(i),e0,e1)+barwd)^2);
end
lambda = min(minToGo)/2;

% select control law at jumps
s = -pi/2;
s = linspace(-pi/2,0,100);
for i = 1:100
   Gamma11 = -2*(1-(1+rho(s(i),c,cprime))^2) + lambda;
   Gamma12 = -(2+rho(s(i),c,cprime))*restitutionE(s(i),e0,e1);
   Gamma21 = Gamma12;
   Gamma22 = -(1-restitutionE(s(i),e0,e1)^2) + lambda;
   % but the cross terms grow away from D, so we remove them
   Gamma = [Gamma11, 0; 0, Gamma22];
%   eig(Gamma)
end

% plot rho and e
% figure(1)
% clf
% s = linspace(-pi/2,0,100);
% plot(s,rho(s,c,cprime),'r')
% hold on
% plot(s,restitutionE(s,d,e0),'b')

% simulation horizon
T = 25;
J = 50;

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
% rule = 3 -> no priority, random selection when simultaneous conditions (Simulink only)
rule = 1;

%solver tolerances
RelTol = 1e-4;
MaxStep = 0.01;

%%%%%%%%%%%%%%%%%%%% SIMULATE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comment one of these out to use the other method of simulation

% 1) simulate using hybridsolver
%[t x j] = hybridsolver( @f,@g,@C,@D,x0,T,J,rule);

% 2) simulate using HybridSimulator
sim('HybridSimulator')

%%%%%%%%%%%%%%%%%%%%% POSTPROCESSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1 = x(:,1);
x2 = x(:,2);
tau = x(:,3);

colorflag = 'b'; % wdi = 0
colorflag = 'g'; % wdi = 0.1
colorflag = 'r'; % wdi = 0.5
%colorflagstar = '*';
figure(1) % height
%clf
subplot(2,1,1),plotflows(t,j,x1,colorflag,colorflagstar)
grid on
%ylabel('x1')
%axis([0 11 -0.5 3])
set(gca,'FontSize', 13)
grid on
xlabel('$t\, [s]$','Interpreter','latex')
ylabel('$z_1\ $','Interpreter','latex')
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', 20)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
%set(hXLabel,'rotation',0)
set(hXLabel, 'FontSize', 20)
hold on
axis([0 20 -0.1 1.6])

subplot(2,1,2),plotflows(t,j,x2,colorflag,colorflagstar)
grid on
%ylabel('x2')
%axis([0 11 -10 5])
set(gca,'FontSize', 13)
grid on
xlabel('$t\, [s]$','Interpreter','latex')
ylabel('$z_2\ $','Interpreter','latex')
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', 20)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
%set(hXLabel,'rotation',0)
set(hXLabel, 'FontSize', 20)
hold on
axis([0 20 -0.8 0.8])


% add legend
figure(1)
subplot(2,1,1)
L(1) = plot(nan, nan, 'b');
L(2) = plot(nan, nan, 'g');
L(3) = plot(nan, nan, 'r');
leg1 = legend(L,{'$w_{d,i}=0$','$w_{d,i}=0.4$','$w_{d,i}=0.8$'});
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',15);

print -depsc -tiff -r300 SolutionsUnderPerturbationsWd.eps

figure(2) % planar plot
%clf
plotHarc(x1,j,x2,[],colorflag);
hold on
plot(x1(1),x2(1),colorflagstar)
grid on
%ylabel('x2')
%xlabel('x1')
set(gca,'FontSize', 13)
grid on
xlabel('$z_1$','Interpreter','latex')
ylabel('$z_2$','Interpreter','latex')
hYLabel = get(gca,'YLabel');
set(hYLabel, 'FontSize', 20)
set(hYLabel,'rotation',0)
hXLabel = get(gca,'XLabel');
%set(hXLabel,'rotation',0)
set(hXLabel, 'FontSize', 20)
hold on

% add legend
figure(2)
L(1) = plot(nan, nan, 'b');
L(2) = plot(nan, nan, 'g');
L(3) = plot(nan, nan, 'r');
leg1 = legend(L,{'$w_{d,i}=0$','$w_{d,i}=0.4$','$w_{d,i}=0.8$'});
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',15);

print -depsc -tiff -r300 PlanarSolutionsUnderPerturbationsWd.eps