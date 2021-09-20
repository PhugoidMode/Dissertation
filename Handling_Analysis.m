%% Script for performing spectral analysis on flight inputs

%%
%Asking for the analysis needed

fprintf('1 for Acceleration-Deceleration, 2 for Climb-Descend, 3 for Transient Turn\n')

choice = input('Which manoeuvre has been performed?\n');

%% Accel-Decel Analysis

if choice == 1

%W data
w_data = dlmread('w_out.txt');

w_values_int = transpose(w_data);

w_values = w_values_int(1,:); %as both elevators are changed by the input, 
%the frequency of usage of this control is the same for both

freq_analysis_w = fft(w_values);

sfreq_w = length(w_values);

n_w = length(w_values);

Amp_w = 2*freq_analysis_w(2:floor(n_w/2)+1)/n_w;

Amplitudes_w = abs(Amp_w);

freq_out_w = sfreq_w*(1:n_w/2)/n_w;

%S data
s_data = dlmread('s_out.txt');

s_values_int = transpose(s_data);

s_values = s_values_int(2,:);

freq_analysis_s = fft(s_values);

sfreq_s = length(s_values);

n_s = length(s_values);

Amp_s = 2*freq_analysis_s(2:floor(n_s/2)+1)/n_s;

Amplitudes_s = abs(Amp_s);

freq_out_s = sfreq_s*(1:n_s/2)/n_s;

%R data
r_data = dlmread('r_out.txt');

r_values_int = transpose(r_data);

r_values = r_values_int(1,:);

freq_analysis_r = fft(r_values);

sfreq_r = length(r_values);

n_r = length(r_values);

Amp_r = 2*freq_analysis_r(2:floor(n_r/2)+1)/n_r;

Amplitudes_r = abs(Amp_r);

freq_out_r = sfreq_r*(1:n_r/2)/n_r;

%F data
f_data = dlmread('f_out.txt');

f_values_int = transpose(f_data);

f_values = f_values_int(1,:);

freq_analysis_f = fft(f_values);

sfreq_f = length(f_values);

n_f = length(f_values);

Amp_f = 2*freq_analysis_f(2:floor(n_f/2)+1)/n_f;

Amplitudes_f = abs(Amp_f);

freq_out_f = sfreq_f*(1:n_f/2)/n_f;

% Plotting for Accel-Decel

figure(1)
tiledlayout(2,2);

sgtitle('Acceleration-Deceleration Handling Analysis')

nexttile
hold on
plot(freq_out_w, Amplitudes_w)
xlim([0 6])
title('Elevator Deflection Increase Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Elevators Deflection Increase'})
hold off

nexttile
hold on
plot(freq_out_s, Amplitudes_s)
xlim([0 6])
title('Elevator Deflection Decrease Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Elevators Deflection Decrease'})
hold off

nexttile
hold on
plot(freq_out_r, Amplitudes_r)
xlim([0 6])
title('Thruster Throttle Increase Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Thruster Throttle Increase'})
hold off

nexttile
hold on
plot(freq_out_f, Amplitudes_f)
xlim([0 6])
title('Thruster Throttle Decrease Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude'; 'Thruster Throttle Decrease'})
hold off
end

%% Climb-Descend Analysis

if choice == 2
    
%W data
w_data = dlmread('w_out.txt');

w_values_int = transpose(w_data);

w_values = w_values_int(1,:); %as both elevators are changed by the input, 
%the frequency of usage of this control is the same for both

freq_analysis_w = fft(w_values);

sfreq_w = length(w_values);

n_w = length(w_values);

Amp_w = 2*freq_analysis_w(2:floor(n_w/2)+1)/n_w;

Amplitudes_w = abs(Amp_w);

freq_out_w = sfreq_w*(1:n_w/2)/n_w;

%S data
s_data = dlmread('s_out.txt');

s_values_int = transpose(s_data);

s_values = s_values_int(2,:);

freq_analysis_s = fft(s_values);

sfreq_s = length(s_values);

n_s = length(s_values);

Amp_s = 2*freq_analysis_s(2:floor(n_s/2)+1)/n_s;

Amplitudes_s = abs(Amp_s);

freq_out_s = sfreq_s*(1:n_s/2)/n_s;

%R data
r_data = dlmread('r_out.txt');

r_values_int = transpose(r_data);

r_values = r_values_int(1,:);

freq_analysis_r = fft(r_values);

sfreq_r = length(r_values);

n_r = length(r_values);

Amp_r = 2*freq_analysis_r(2:floor(n_r/2)+1)/n_r;

Amplitudes_r = abs(Amp_r);

freq_out_r = sfreq_r*(1:n_r/2)/n_r;

%F data
f_data = dlmread('f_out.txt');

f_values_int = transpose(f_data);

f_values = f_values_int(1,:);

freq_analysis_f = fft(f_values);

sfreq_f = length(f_values);

n_f = length(f_values);

Amp_f = 2*freq_analysis_f(2:floor(n_f/2)+1)/n_f;

Amplitudes_f = abs(Amp_f);

freq_out_f = sfreq_f*(1:n_f/2)/n_f;

% Plotting for Climb-Descend

figure(1)
tiledlayout(2,2);

sgtitle('Climb-Descend Handling')

nexttile
hold on
plot(freq_out_w, Amplitudes_w)
xlim([0 6])
title('Elevator Deflection Increase Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel('Fourier Amplitude, Elevators Deflection Increase')
hold off

nexttile
hold on
plot(freq_out_s, Amplitudes_s)
xlim([0 6])
title('Elevator Deflection Decrease Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel('Fourier Amplitude, Elevators Deflection Decrease')
hold off

nexttile
hold on
plot(freq_out_r, Amplitudes_r)
xlim([0 6])
title('Thruster Throttle Increase Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel('Fourier Amplitude, Thruster Throttle Increase')
hold off

nexttile
hold on
plot(freq_out_f, Amplitudes_f)
xlim([0 6])
title('Thruster Throttle Decrease Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel('Fourier Amplitude, Thruster Throttle Decrease')
hold off
    
end 

%% Transient Turn Analysis

if choice == 3
    
%Q data
q_data = dlmread('q_out.txt');

q_values_int = transpose(q_data);

q_values = q_values_int(1,:);

freq_analysis_q = fft(q_values);

sfreq_q = length(q_values);

n_q = length(q_values);

Amp_q = 2*freq_analysis_q(2:floor(n_q/2)+1)/n_q;

Amplitudes_q = abs(Amp_q);

freq_out_q = sfreq_q*(1:n_q/2)/n_q;

%E data
e_data = dlmread('e_out.txt');

e_values_int = transpose(e_data);

e_values = e_values_int(1,:);

freq_analysis_e = fft(e_values);

sfreq_e = length(e_values);

n_e = length(e_values);

Amp_e = 2*freq_analysis_e(2:floor(n_e/2)+1)/n_e;

Amplitudes_e = abs(Amp_e);

freq_out_e = sfreq_e*(1:n_e/2)/n_e;

%A data
a_data = dlmread('a_out.txt');

a_values_int = transpose(a_data);

a_values = a_values_int(1,:);

freq_analysis_a = fft(a_values);

sfreq_a = length(a_values);

n_a = length(a_values);

Amp_a = 2*freq_analysis_a(2:floor(n_a/2)+1)/n_a;

Amplitudes_a = abs(Amp_a);

freq_out_a = sfreq_a*(1:n_a/2)/n_a;

%D data
d_data = dlmread('d_out.txt');

d_values_int = transpose(d_data);

d_values = d_values_int(1,:);

freq_analysis_d = fft(d_values);

sfreq_d = length(d_values);

n_d = length(d_values);

Amp_d = 2*freq_analysis_d(2:floor(n_d/2)+1)/n_d;

Amplitudes_d = abs(Amp_d);

freq_out_d = sfreq_d*(1:n_d/2)/n_d;

%W data
w_data = dlmread('w_out.txt');

w_values_int = transpose(w_data);

w_values = w_values_int(1,:); %as both elevators are changed by the input, 
%the frequency of usage of this control is the same for both

freq_analysis_w = fft(w_values);

sfreq_w = length(w_values);

n_w = length(w_values);

Amp_w = 2*freq_analysis_w(2:floor(n_w/2)+1)/n_w;

Amplitudes_w = abs(Amp_w);

freq_out_w = sfreq_w*(1:n_w/2)/n_w;

%S data
s_data = dlmread('s_out.txt');

s_values_int = transpose(s_data);

s_values = s_values_int(2,:);

freq_analysis_s = fft(s_values);

sfreq_s = length(s_values);

n_s = length(s_values);

Amp_s = 2*freq_analysis_s(2:floor(n_s/2)+1)/n_s;

Amplitudes_s = abs(Amp_s);

freq_out_s = sfreq_s*(1:n_s/2)/n_s;

% Plotting for Transient Turn

figure(3)
tiledlayout(3,2);

sgtitle('Transient Turn Handling')

nexttile
hold on
plot(freq_out_q, Amplitudes_q)
xlim([0 6])
title('Rudder Deflection Left Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Rudder Deflection Left'})
hold off

nexttile
hold on
plot(freq_out_e, Amplitudes_e)
xlim([0 6])
title('Rudder Deflection Right Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ;'Rudder Deflection Right'})
hold off

nexttile
hold on
plot(freq_out_a, Amplitudes_a)
xlim([0 6])
title('Differential Elevator Anticlockwise Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Differential Elevator Anticlockwise'})
hold off

nexttile
hold on
plot(freq_out_d, Amplitudes_d)
xlim([0 6])
title('Differential Elevator Clockwise Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Differential Elevator Clockwise'})
hold off

nexttile
hold on
plot(freq_out_w, Amplitudes_w)
xlim([0 6])
title('Elevator Deflection Increase Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude' ; 'Elevator Deflection Increase'})
hold off

nexttile
hold on
plot(freq_out_s, Amplitudes_s)
xlim([0 6])
title('Elevator Deflection Decrease Spectral Analysis')
xlabel('Frequency (Hz)')
ylabel({'Fourier Amplitude';'Elevator Deflection Decrease'})
hold off
    
end 









