% runMultipleSims
clear all
close all

% wc perturbations

%%%% SIM 1

wccommon = 0;
wdcommon = 0;
colorflag = 'b';
colorflagstar = 'b';
run

%%%% SIM 2
clear all

wccommon = 0.01;
wdcommon = 0;
colorflag = 'g';
colorflagstar = 'g';
run

%%%% SIM 3
clear all

wccommon = 0.05;
wdcommon = 0;
colorflag = 'm';
colorflagstar = 'm';
run

%%%% SIM 4
clear all

wccommon = 0.1;
wdcommon = 0;
colorflag = 'y';
colorflagstar = 'y';
run

%%%% SIM 5
clear all

wccommon = 0.5;
wdcommon = 0;
colorflag = 'k';
colorflagstar = 'k';
run

%%%% SIM 6
clear all

wccommon = 0.3;
wdcommon = 0;
colorflag = 'c';
colorflagstar = 'c';
run

%%%% SIM 7
clear all

wccommon = 1;
wdcommon = 0;
colorflag = 'r';
colorflagstar = 'r*';
run

figure(1)
subplot(2,1,1),axis([0 30 -0.2 2])
subplot(2,1,2),axis([0 30 -0.8 0.4])

% wd perturbations
clear all
close all

%%%% SIM 1

wccommon = 0;
wdcommon = 0;
colorflag = 'b';
colorflagstar = 'b';
run


%%%% SIM 2
clear all

wccommon = 0;
wdcommon = 0.4;
colorflag = 'g';
colorflagstar = 'g';
run

%%%% SIM 3
clear all

wccommon = 0;
wdcommon = 0.3;
colorflag = 'm';
colorflagstar = 'm';
run

%%%% SIM 4
clear all

wccommon = 0;
wdcommon = 0.8;
colorflag = 'k';
colorflagstar = 'k';
run

%%%% SIM 5
clear all

wccommon = 0;
wdcommon = 1;
colorflag = 'r';
colorflagstar = 'r*';
run

figure(1)
subplot(2,1,1),axis([0 25 -0.2 2])

figure(1)
subplot(2,1,2),axis([0 25 -0.8 0.8])