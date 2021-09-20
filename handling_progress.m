%% Script for plotting handling progress
%% Arrays with data for each manoeuvre- entered as each test was run

% Acceleration-Deceleration

EDI_ad = [5.5 6.1 6.2 6.1 5.9 5.8 5.6 5.7 5.9 6.3 6.2 6.7 6.2 5.8 5.2 5.1 4.7 4.5 4.1 4.1 3.8 3.5 3.3 3.0 2.9...
    ;5.9 5.4 5.2 4.7 4.6 4.7 4.2 3.9 3.1 2.5 1.1 2.5 2.4 2.3 2.5 2.6 2.1 1.9 2.3 2.1 2.2 2.5 1.8 2.6 2.9...
    ;4.1 4.5 4.6 4.7 5.1 4.8 4.2 4.5 4.1 4.3 4.5 4.6 4.0 3.8 3.6 3.9 3.3 2.8 2.5 2.5 2.1 1.5 1.0 0.3 0 ...
    ;6.2 4.7 4.4 4.1 3.6 3.1 2.5 1.9 1.5 1.0 0.5 0 0.1 0.4 0 0 0 0 0 0 0 0 0 0 0].*(10^-3);

EDD_ad = [4.8 5.0 5.4 4.6 3.8 5.2 5.1 5.6 4.1 5.3 6.1 5.7 4.9 4.1 3.9 3.9 3.8 3.0 2.1 1.5 1.2 0.9 0.5 0.2 0.1...
    ;6.3 6.0 6.0 5.5 5.2 5.1 4.8 4.5 4.1 3.6 3.4 3.2 3.2 3.1 3.0 2.6 2.3 2.1 1.8 1.4 1.2 1.1 0.7 0.4 0.1...
    ;2.7 3.1 3.7 4.4 4.6 3.1 3.2 4.7 5.3 5.7 4.8 5.0 5.6 5.7 4.1 3.7 3.2 3.1 2.6 2.5 1.5 1.5 1.1 0.6 0 ...
    ;3.0 3.5 3.4 2.9 2.6 2.6 2.7 2.3 2.1 1.5 0.5 0 0.4 0.5 0.2 0.1 0.1 0 0 0 0.5 0 0 0  0].*(10^-3);

TTI_ad = [13.0 13.4 12.3 12.9 14.1 13.6 13.0 12.6 13.2 13.8 13.1 13.9 13.5 12.0 6.0 13.5 12.0 10.4 8.5 9.4 8.1 7.4 7.1 6.8 6.1...
    ;6.0 7.1 6.4 6.6 6.0 5.7 5.8 6.1 4.6 5.7 6.1 6.0 6.1 5.4 5.4 5.1 4.3 4.4 3.9 3.5 3.1 2.6 2.8 3.1 2.9...
    ;4.0 3.9 4.2 3.7 3.6 3.4 3.8 3.8 3.7 3.4 3.8 3.5 3.5 3.6 3.4 3.4 3.3 3.2 3.3 3.1 2.9 3.1 3.2 3.1 3.1...
    ;3.0 3.6 3.7 4.6 4.1 4.6 4.2 3.9 4.3 4.5 4.1 4.3 4.2 4.5 4.2 4.0 3.8 2.4 2.5 2.1 1.9 1.2 0.6 0 0].*(10^-3);

TTD_ad = [11.5 10.0 9.6 6.7 5.9 6.7 4.9 5.3 5.7 5.6 5.4 5.5 5.4 5.2 5.4 5.1 4.8 4.5 3.9 3.2 2.8 2.6 2.4 2.5 2.5...
    ;6.5 6.0 5.7 5.3 4.8 4.2 3.6 3.1 2.9 2.6 2.5 2.4 2.4 2.3 2.6 2.5 2.4 2.5 2.7 2.3 2.5 2.6 2.4 2.3 2.5...
    ;2.1 1.8 1.4 1.1 0.7 0.5 0.3 0.1 0 0 0 0 0 0 0 0 0.1 0 0.4 0 0 0 0 0 0 ...
    ;2.9 2.5 2.2 1.7 1.3 1.1 0.8 0.6 0.4 0.2 0.1 0 0 0 0 0.3 0.1 0 0 0 0 0 0 0 0].*(10^-3);

% Climb-Descend

EDI_cd = [15 18 27 29 38 44 49 58 64 71 73 70 75 80 71 66 64 63 61 57 56 59 60 59 58 ...
    ;4.7 8.9 14.3 19.5 18.5 22.1 28 29 30 33 35 35 36 33 34 33 32 31 30 31 32 33 32 33 32 ...
    ;3.4 8.8 13.5 19.5 25 24 24 23 22 23 22 21 23 24 21 22 20 24 22 21 19 20 22 21 20 ...
    ;5.5 7.9 12 15 17 19 20 18 18 17 19 18 19 14 17 16 14 13 14 16 15 14 15 15 15].*(10^-3);

EDD_cd = [12.6 18 25 29 33 37 38 42 48 53 59 66 70 73 75 79 82 83 86 87 88 89 88 89 89 ...
    ;5.2 9.1 13.4 19 25 29 32 34 36 34 36 38 39 37 36 37 38 37 36 35 36 36 35 34 36 ...
    ;8 14 16 19 20 22 25 26 28 27 26 27 24 22 24 26 27 24 22 18 19 18 17 18 18 ...
    ;4 6 9 12 14 16 18 19 21 20 21 20 22 25 26 28 33 32 30 31 30 32 32 31 32].*(10^-3);

TTI_cd = [3.5 6 8 10 13 15 16 14 17 21 19 115 17 18 16 17 18 19 16 17 18 17 14 16 18 ...
    ;5 5.4 5.7 6.2 6.8 7.2 8 8.2 8.5 8.9 9.5 9.5 9.8 9.4 9.3 9.4 9.5 9.7 9.4 9.5 9.7 9.5 9.3 9.3 9.5...
    ;0 0 0.7 0.9 1.5 1.9 2.5 3.1 3.4 3.7 4.5 4.5 5.2 5.6 5.9 6.1 6.4 6.8 6.4 6.5 6.6 6.7 6.6 6.6 6.6...
    ;0 0 0.9 0.8 1.4 1.8 2.4 2.2 2.7 3.1 3.9 3.9 4.4 4.7 4.9 5.2 5.4 5.4 5.5 5.6 5.7 5.3 5.3 5.4 5.6].*(10^-3);

TTD_cd = [3 9 17 19 27 39 48 59 66 74 89 86 80 69 60 51 43 38 35 32 34 33 31 32 33 ...
    ;5.7 16 21 28 34 38 41 45 48 51 44 43 36 32 28 23 20 18 16 14 16 15 13 14 15.6...
    ;1.6 5 9 13 16 18 19 22 20 21 20 20 20 18 15 12 10 7 8 9 8 8 8 9 8 ...
    ;0 3 7 10 13 17 22 25 26 24 22 20 18 15 14 15 14 13 11 9 8 7 8 7 8].*(10^-3);

% Transient Turn

RDL = [18 21 22 23 24 26 28 29 28 27 27 24 22 20 18 18 14 10 11 9 8 8 5 3 4 ...
    ;7 9 11 13 14 12 11 10 9 9 8 8 7 7 6 5.5 5 4.2 4 3.8 3.5 3.6 3.7 3.6 3.6 ...
    ;4.8 5.1 5.3 5.2 4.9 4.7 4.8 4.7 4.6 4.5 4.6 4.6 4.5 4.6 4.4 4.2 4.1 3.8 3.4 3.1 2.8 2.4 2.6 2.5 2.5 ...
    ;4.1 4.1 4.0 3.8 3.7 3.6 7 3.3 3.1 2.7 2.8 10 2.9 2.5 2.3 1.9 1.8 1.6 1.3 2 1.2 1.1 0.8 1 1].*(10^-3);

RDR = [16 17 15 14 13 15 16 14 12 11 13 17 15 11 10 11 8 8 6 5 3 4 5 4 4.6 ...
    ;6 5 4 6 7 4 6 5.5 5 6 7 6 6 5 4 6 7 5 4 2 1 2 1 0.8 1.1 ...
    ;4 4.7 4.8 5 6 5.3 4.9 5 3.9 4.3 5.1 5 4.9 5.2 4.9 4.8 5.1 4.7 4.5 4.1 3.9 3.6 3.7 3.8 3.7 ...
    ;3 2 3 5 4 3 4 5 6 7 6 6 6 5 4 6 4 4 3 3 2 1 2 1 1].*(10^-3);

DEA = [11.8 11.5 11.1 10.7 10.2 10.1 9.7 9.3 9.0 8.7 8.4 8.5 8.1 7.8 7.4 7.1 6.5 6.2 5.2 4.6 4.0 3.1 2.4 1.9 1.1 ...
    ;4.3 5.8 5.4 6.3 7.1 6.8 6.3 5.9 6.5 6.8 7.1 7 6.2 5.5 5.0 4.6 4.1 3.8 3.6 3.3 3.0 3.1 3.2 3.4 3.3 ...
    ;9 7 10 11 9 8 9 8 7 9 8 7.5 9 7 8 6.5 5.8 5.1 4.4 3.9 2.7 2.0 1.5 1 0 ...
    ;5.1 4.8 4.6 5.1 5.2 5.0 4.8 4.7 4.9 5.0 4.9 5 6 5 6 5 3 4 3 2 1 0 1 0 0].*(10^-3);

DEC = [5 5.1 5.2 4.9 4.6 4.1 3.9 3.8 3.3 3.7 3.5 3.6 3.4 3.7 3.8 3.5 3.1 3.2 3.4 3.6 3.4 3.5 3.5 3.4 6 ...
    ;7.6 7.3 7.1 6.9 6.6 6.3 6.1 5.9 5.4 5.6 5.7 5.5 5.3 4.9 4.8 5.1 4.7 4.3 4.1 4.1 3.9 3.8 3.5 3.4 3 ...
    ;2.3 2.3 2.2 2.4 2.2 2.6 2.5 2.7 2.4 2.2 2.5 2.9 2.5 2.7 2.5 2.3 2.1 2.2 2.1 1.9 2.0 2.0 1.9 1.8 1.8 ...
    ;6 6.1 5.8 5.2 5.6 5.3 4.9 4.7 4.9 4.6 4.2 3.7 3.8 3.6 3.5 3.1 3.4 3.0 2.6 2.1 1.5 1.1 0.7 0.5 0].*(10^-3);

EDI_tt = [17 16.3 16.5 15.8 15.2 15.0 14.7 14.2 13.8 13.4 13.5 13 12.5 12.1 12.5 11.6 10.9 9.9 8.4 8.7 8.0 6.2 4.1 4.4 2.1 ...
    ;15 15.3 14.6 14.1 13.7 14.2 13.5 13.8 13.2 12.6 12.1 11.6 11 10.4 9.7 9.1 8.4 7.9 6.3 5.4 5.6 4.6 3.9 2.6 2.3 ...
    ;7 8.1 7.4 7.1 6.8 6.9 7.3 6.3 7.1 7.2 7.1 7 7.1 6.7 6.2 5.8 5.8 5.3 4.6 5.1 4.7 4.3 4.1 4.0 3.8 ...
    ;6 5.8 6.1 5.4 5.1 4.9 5.1 4.8 4.3 4.1 4.6 5 5.1 4.7 4.1 3.9 4.1 3.8 3.2 2.9 2.4 2.1 1.9 1.3 0].*(10^-3);

EDD_tt = [9 8.5 9.1 9.9 10.3 10.6 11.3 12.1 12.0 12.6 13.1 14 15.5 14.1 13.5 12.3 10.4 9.1 8.3 7.1 7.8 6.1 5.2 4.1 3 ...
    ;11 9.4 8.5 8.7 8.2 7.4 6.9 7.1 6.3 5.9 4.8 4.3 3.8 3.4 3.8 3.3 2.8 2.4 2.1 1.9 2.0 1.8 3.4 2.4 1.5 ...
    ;2 1.7 1.9 1.5 2.2 2.8 3.1 3.5 3.3 4.1 4.3 5.5 6.1 5.8 5.3 5.1 5.3 5.1 4.8 5.3 5.4 5.2 4.7 5.1 5 ...
    ;7 7.1 6.5 6.2 5.8 5.1 4.8 4.8 4.9 3.1 2.8 0 0 0.5 0.6 0.1 0 0 0 0.3 0 0 0.1 0 0].*(10^-3);
    
%% Other required arrays

% Requires an array of 1-25, for the x axis

runs = 1:25;

%% Plotting the various FFT Peak Progression plots

% Acceleration-Deceleration

figure(1)
tiledlayout(4,1)
sgtitle('Acceleration-Deceleration Handling Progression')

nexttile
hold on
grid on
plot(runs,EDD_ad(1,:),'b')
plot(runs,EDD_ad(2,:),'r')
plot(runs,EDD_ad(3,:),'g')
plot(runs,EDD_ad(4,:),'k')
title('Elevator Deflection Decrease')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,EDI_ad(1,:),'b')
plot(runs,EDI_ad(2,:),'r')
plot(runs,EDI_ad(3,:),'g')
plot(runs,EDI_ad(4,:),'k')
title('Elevator Deflection Increase')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,TTD_ad(1,:),'b')
plot(runs,TTD_ad(2,:),'r')
plot(runs,TTD_ad(3,:),'g')
plot(runs,TTD_ad(4,:),'k')
title('Thruster Throttle Decrease')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,TTI_ad(1,:),'b')
plot(runs,TTI_ad(2,:),'r')
plot(runs,TTI_ad(3,:),'g')
plot(runs,TTI_ad(4,:),'k')
title('Thruster Throttle Increase')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

% Climb-Descend

figure(2)
tiledlayout(4,1)
sgtitle('Climb-Descend Handling Progression')

nexttile
hold on
grid on
plot(runs,EDD_cd(1,:),'b')
plot(runs,EDD_cd(2,:),'r')
plot(runs,EDD_cd(3,:),'g')
plot(runs,EDD_cd(4,:),'k')
title('Elevator Deflection Decrease')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,EDI_cd(1,:),'b')
plot(runs,EDI_cd(2,:),'r')
plot(runs,EDI_cd(3,:),'g')
plot(runs,EDI_cd(4,:),'k')
title('Elevator Deflection Increase')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,TTD_cd(1,:),'b')
plot(runs,TTD_cd(2,:),'r')
plot(runs,TTD_cd(3,:),'g')
plot(runs,TTD_cd(4,:),'k')
title('Thruster Throttle Decrease')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,TTI_cd(1,:),'b')
plot(runs,TTI_cd(2,:),'r')
plot(runs,TTI_cd(3,:),'g')
plot(runs,TTI_cd(4,:),'k')
title('Thruster Throttle Increase')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off


% Transient Turn 

figure(3)
tiledlayout(3,2)
sgtitle('Transient Turn Handling Progression')

nexttile
hold on
grid on
plot(runs,EDD_tt(1,:),'b')
plot(runs,EDD_tt(2,:),'r')
plot(runs,EDD_tt(3,:),'g')
plot(runs,EDD_tt(4,:),'k')
title('Elevator Deflection Decrease')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,EDI_tt(1,:),'b')
plot(runs,EDI_tt(2,:),'r')
plot(runs,EDI_tt(3,:),'g')
plot(runs,EDI_tt(4,:),'k')
title('Elevator Deflection Increase')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,RDL(1,:),'b')
plot(runs,RDL(2,:),'r')
plot(runs,RDL(3,:),'g')
plot(runs,RDL(4,:),'k')
title('Rudder Deflection Left')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,RDR(1,:),'b')
plot(runs,RDR(2,:),'r')
plot(runs,RDR(3,:),'g')
plot(runs,RDR(4,:),'k')
title('Rudder Deflection Right')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,DEA(1,:),'b')
plot(runs,DEA(2,:),'r')
plot(runs,DEA(3,:),'g')
plot(runs,DEA(4,:),'k')
title('Differential Elevators Anticlockwise')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off

nexttile
hold on
grid on
plot(runs,DEC(1,:),'b')
plot(runs,DEC(2,:),'r')
plot(runs,DEC(3,:),'g')
plot(runs,DEC(4,:),'k')
title('Differential Elevators Clockwise')
xlabel('Flight Number')
ylabel('FFT Peak')
legend({'1Hz','2Hz','3Hz','4Hz'})
hold off
