% Author: [Your Name]
% MATLAB script to analyze and process an analog signal

% User inputs
T = input('Enter the time duration in seconds (T): ');
Fs = input('Enter the sampling frequency (Fs): ');
n_bits = input('Enter the number of bits of coding: ');

% Signal parameters
A = 1; % Amplitude
F = 1; % Frequency

% Time vector
t = 0:1/Fs:T;

% Analog signal
x_t = A * (0.8 * sin(2 * pi * F * t) + 1.2 * cos(2 * pi * 0.7 * F * t));

% Nyquist rate
nyquist_rate = 2 * F;

% Normalized frequencies
normalized_freq = F / Fs;

% Number of quantization levels
L = 2^n_bits;

% Dynamic range
dynamic_range = 20 * log10(L);

% Quantization step size
delta = (max(x_t) - min(x_t)) / L;

% Quantized signal
x_q = round(x_t / delta) * delta;

% Quantization noise
quantization_noise = x_t - x_q;

% Signal-to-Quantization-Noise Ratio (SQNR)
sqnr = 10 * log10(mean(x_t.^2) / mean(quantization_noise.^2));

% RMS Noise
rms_noise = sqrt(mean(quantization_noise.^2));

% Recovered analog signal (simple zero-order hold)
x_recovered = x_q;

% Plotting
figure;
plot(t, x_t);
title('Analog Signal');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
stem(t, x_t);
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
plot(t, x_recovered);
title('Recovered Analog Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Display results
fprintf('Nyquist rate: %.2f Hz\n', nyquist_rate);
fprintf('Normalized frequency: %.2f\n', normalized_freq);
fprintf('Number of quantization levels: %d\n', L);
fprintf('Dynamic range: %.2f dB\n', dynamic_range);
fprintf('SQNR: %.2f dB\n', sqnr);
fprintf('RMS Noise: %.2f\n', rms_noise);

% Conclusion and discussion
disp('Conclusion:');
disp('Observe the changes in the input values and their effect on the results.');

disp('Discussion:');
disp('a) The sampling frequency affects the resolution of the discrete-time signal.');
disp('b) The number of bits of coding affects the quantization levels and dynamic range.');
disp('c) The Nyquist rate is twice the maximum frequency of the signal.');
disp('d) Normalized frequencies are the actual frequencies divided by the sampling frequency.');
disp('e) The number of quantization levels is determined by the number of bits.');
disp('f) Dynamic range is the ratio of the largest to smallest signal levels.');
disp('g) SQNR is the ratio of signal power to quantization noise power.');
disp('h) RMS Noise is the root mean square of the quantization noise.');
disp('i) The analog signal is the continuous signal.');
disp('j) The discrete-time signal is the sampled version of the analog signal.');
disp('k) The quantized discrete-time signal is the digitized version of the discrete-time signal.');
disp('l) Quantization noise is the difference between the analog signal and the quantized signal.');