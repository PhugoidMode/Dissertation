%% PERFORMANCE ANALYSIS SCRIPT

%% Read in and augment flight data

input_data = dlmread('hav.log'); 

flight_data = transpose(input_data);

%% Separate matrix into state arrays

time = flight_data(1,:);

u = flight_data(2,:);

v = flight_data(3,:);

w = flight_data(4,:); 
            
p = flight_data(5,:); 

q = flight_data(6,:); 

r = flight_data(7,:); 

phi = flight_data(8,:); 

theta = flight_data(9,:); 

psi = flight_data(10,:);

x_f = flight_data(11,:);

y_f = flight_data(12,:);

z_f = flight_data(13,:); 

%% Choose analysis to run

Choice = input('\nPress 1 for Acceleration-Deceleration, 2 for Climb-Descend, or 3 for Transient Turn\n\n');

%% Analysis performed for acceleration-deceleration

if Choice == 1 
    
    i = 1;
    
    z_max_ad = -86.83;
    
    z_min_ad = 0;
    
for i = length(time)-1
    
    fprintf('Analysing Performance\n\n');
 
    if u(i+1) > u(i)
        start_ad = time(i);
        end_ad = time(length(time));
        time_ad = end_ad-start_ad;
        fprintf('Manoeuvre Time is %d seconds\n\n',time_ad);
        if time_ad > 4.22
            fprintf('Manoeuvre is over time\n\n');
        end 
        if max(u) < 28
            fprintf('Peak velocity not achieved\n\n');
        end 
        if max(z_f) > z_max_ad
            fprintf('Max altitude exceeded\n\n');
        end
        if min(z_f) < z_min_ad
            fprintf('Manoeuvre failed- crashed\n\n');
        end 
        if abs(max(y_f)) > 42.22
            fprintf('Max lateral track exceeded\n\n');
        end 
        if max(theta) < 30
            fprintf('Pitch requirement not met\n\n');
        end 
        if max(psi) > 62.67
            fprintf('Heading angle increases too much\n\n');
        end 
        
    end 
    
    
end 

fprintf('Plotting Relevant States\n\n');

%Plot flight data
figure(1)
tiledlayout(3,1) 
sgtitle('Acceleration-Deceleration Performance')

nexttile
hold on
plot(time,u)
yline(28, '--', 'Threshold');
ylim([24.5,32]);
title('Velocity Plot')
xlabel('Time (s)')
ylabel('Velocity (ms^-1)')
hold off

nexttile
hold on
plot(time,abs(z_f))
yline(abs(z_max_ad), '--', 'Upper Threshold');
yline(z_min_ad, '--', 'Lower Threshold');
title('Altitude Plot')
xlabel('Time (s)')
ylabel('Altitude (m)')
hold off

nexttile
hold on
plot(time,y_f)
yline(5.8, '--', 'Upper Threshold');
yline(-5.8, '--', 'Lower Threshold');
title('Lateral Displacement Plot')
xlabel('Time (s)')
ylabel('Lateral Displacement (m)')
hold off

end

%% Climb-Descend Analysis

if Choice == 2
    
    i = 1;
    
    z_max_end = abs(z_f(length(z_f)-1))+7;
    
    z_min_end = abs(z_f(length(z_f)-1))-7;
    
for i = length(time)-1
    
    fprintf('Analysing Performance\n\n');
 
    if abs(z_f(i+1)) > abs(z_f(i))
        start_cd = time(i);
        end_cd = time(length(time));
        time_cd = end_cd-start_cd;
        fprintf('Manoeuvre Time is %d seconds\n\n',time_cd);
        if time_cd > 37
            fprintf('Manoeuvre is over time\n\n');
        end 
        if abs(max(z_f)) < 60
            fprintf('Required altitude not reached\n\n');
        end
        if abs(max(x_f)) > 1000
            fprintf('Manoeuvre overshot distance\n\n');
        end
        if abs(y_f(i)) > 8
            fprintf('Max lateral track exceeded\n\n');
        end  
        if max(psi) > 30
            fprintf('Heading angle exceeds limit\n\n');
        end 
        
    end 
    
    
end 

fprintf('Plotting Relevant States\n\n');

%Plot flight data
figure(2)
tiledlayout(3,1) 
sgtitle('Climb-Descend Performance')

nexttile
hold on
plot(time,abs(z_f))
yline(60, '--', 'Altitude Threshold');
ylim([24.5,32]);
title('Velocity Plot')
xlabel('Time (s)')
ylabel('Altitude (m)')
hold off

nexttile
hold on
plot(time,psi)
yline(30, '--', 'Upper Threshold');
yline(-30, '--', 'Lower Threshold');
title('Heading Angle Plot')
xlabel('Time (s)')
ylabel('Heading (deg)')
hold off

nexttile
hold on
plot(time,y_f)
yline(7, '--', 'Upper Threshold');
yline(-7, '--', 'Lower Threshold');
title('Lateral Displacement Plot')
xlabel('Time (s)')
ylabel('Lateral Displacement (m)')
hold off

end 
%% Transient Turn Analysis

if Choice == 3
    
    i = 1;
    
    z_max_lr = abs(z_f(1))+86;
    
    z_min_lr = abs(z_f(1))-86;
    
for i = length(time)-1
    
    fprintf('Analysing Performance\n\n');
 
    if abs(v(i+1)) > abs(v(i))
        start_tt = time(i);
        end_tt = time(length(time));
        time_tt = end_tt-start_tt;
        fprintf('Manoeuvre Time is %d seconds\n\n',time_tt);
        if time_tt > 28
            fprintf('Manoeuvre is over time\n\n');
        end 
        if abs(max(z_f)) > z_max_lr
            fprintf('Max altitude exceeded\n\n');
        end
        if abs(min(z_f)) < z_min_lr
            fprintf('Minimum altitude breached\n\n');
        end
        if abs(x_f(i)) < abs(x_f(i-1))
            t_level = time(length(time))-time(i);
            fprintf('Max longitudinal track exceeded\n\n');
        end  
        if psi(length(time)) > 180
            fprintf('Heading angle achieves desired value\n\n');
        end 
        
    end 
    
    
end 

fprintf('Plotting Relevant States\n\n');

%Plot flight data
figure(3)
tiledlayout(3,1) 
sgtitle('Transient Turn Performance Analysis')

nexttile
hold on
plot(time,abs(z_f))
yline(z_max_lr, '--', 'Upper Threshold');
yline(z_min_lr, '--', 'Lower Threshold');
title('Altitude Track Plot')
xlabel('Time (s)')
ylabel('Altitude (m)')
ylim([0 600]);
hold off

nexttile
hold on
plot(time,abs(rad2deg(psi)))
title('Heading Angle Plot')
xlabel('Time (s)')
ylabel('Heading Angle (deg)')
yline(180, '--','Turn End Heading');
ylim([0 Inf])
hold off

nexttile
hold on
plot(time,abs(rad2deg(phi)))
title('Roll Angle Plot')
xlabel('Time (s)')
ylabel('Roll Angle (deg)')
ylim([-45 100])
%yline(0, '--', 'End Roll Angle')
hold off
    
end 







