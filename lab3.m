% CPE 0415 – DIGITAL SIGNAL PROCESSING
% LABORATORY ACTIVITY
% Title: ANALOG TO DIGITAL CONVERSION (ADC)
% Name: [Your Name]
% Student Number: [Your Student Number]
% Section: [Your Section]
% Date: [Current Date]

% Clear workspace and command window
clear;
clc;

% Input Section
T = input('Enter the time duration in seconds (T): ');
Fs = input('Enter the sampling frequency (Fs): ');
n = input('Enter the number of bits of coding (n): ');

% Signal Definition
A = 1; % Amplitude
F = 1; % Frequency
t = 0:1/Fs:T; % Time vector
x_t = A * (0.8 * sin(2 * pi * F * t) + 1.2 * cos(2 * pi * 0.7 * F * t));

% Calculations
Nyquist_rate = 2 * F;
normalized_frequencies = [F/Fs, 0.7*F/Fs];
quantization_levels = 2^n;
dynamic_range = 6.02 * n + 1.76;
SQNR = 1.76 + 6.02 * n;
RMS_noise = A / sqrt(12 * quantization_levels^2);

% Signal Processing
% Analog signal is already defined as x_t
% Discrete-Time Signal
x_n = x_t;

% Quantized Discrete-Time Signal
x_q = round(x_n * quantization_levels) / quantization_levels;

% Quantization Noise
quantization_noise = x_n - x_q;

% Recovered Analog Signal
recovered_signal = x_q;

% Plotting
figure;
plot(t, x_t);
title('Analog Signal');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
stem(t, x_n);
title('Discrete-Time Signal');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
stem(t, x_q);
title('Quantized Discrete-Time Signal');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
plot(t, quantization_noise);
title('Quantization Noise');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
plot(t, recovered_signal);
title('Recovered Analog Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Conclusion and Discussion
fprintf('Nyquist rate: %.2f Hz\n', Nyquist_rate);
fprintf('Normalized frequencies: %.2f, %.2f\n', normalized_frequencies);
fprintf('Number of Quantization Levels: %d\n', quantization_levels);
fprintf('Dynamic range: %.2f dB\n', dynamic_range);
fprintf('SQNR: %.2f dB\n', SQNR);
fprintf('RMS Noise: %.2f\n', RMS_noise);

% Observations and discussions should be written based on the results obtained.