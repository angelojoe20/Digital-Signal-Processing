% DSP Operations in MATLAB using individual figure windows
% User chooses a type of signal and DSP operation to apply

% Clear workspace and command window
clear;
clc;

% Display options for signal type
disp('Select the type of signal to process:');
disp('a) - Unit Impulse');
disp('b) - Unit Step');
disp('c) - Ramp');
signal_choice = input('Enter your choice (a/b/c): ', 's');

% Define the discrete time range
n = -10:10;

% Initialize the signal based on user choice
switch signal_choice
    case 'a'  % Unit Impulse
        x = (n == 0);
        titleText = 'Unit Impulse';
        
        % Plot Unit Impulse in a dedicated figure
        figure;
        stem(n, x, 'filled');
        title('Original Unit Impulse Signal');
        xlabel('n');
        ylabel('Amplitude');
        xticks(-10:2:10);
        yticks(min(x):2:max(x));
        grid on;
        
    case 'b'  % Unit Step
        x = (n >= 0);
        titleText = 'Unit Step';
        
        % Plot Unit Step in a dedicated figure
        figure;
        stem(n, x, 'filled');
        title('Original Signal: Unit Step');
        xlabel('n');
        ylabel('Amplitude');
        xticks(-10:2:10);
        yticks(min(x):2:max(x));
        grid on;
        
    case 'c'  % Ramp
        x = n .* (n >= 0);
        titleText = 'Ramp';
        
        % Plot Ramp in a dedicated figure
        figure;
        stem(n, x, 'filled');
        title('Original Ramp Signal');
        xlabel('n');
        ylabel('Amplitude');
        xticks(-10:2:10);
        yticks(min(x):2:max(x));
        grid on;
        
    otherwise
        error('Invalid choice for signal type.');
end

% Display options for DSP operations
disp('Select the DSP operation:');
disp('a) - Fold');
disp('b) - Time Shift');
disp('c) - Time Scale');
disp('d) - Flip');
operation_choice = input('Enter your choice (a/b/c/d): ', 's');

% Apply the selected DSP operation
switch operation_choice
    case 'a'  % Fold
        x_processed = fliplr(x);
        operationText = 'Folding';
        
    case 'b'  % Time Shift
        k = input('Enter the time shift value (positive for left, negative for right): ');
        x_processed = circshift(x, k); % Shift right if k is negative, left if k is positive
        operationText = ['Time Shift by ', num2str(k)];
        
    case 'c'  % Time Scale
        a = input('Enter the scaling factor: ');
        n_scaled = round(n/a); % Apply scaling
        x_processed = zeros(size(n));
        x_processed(n_scaled >= -10 & n_scaled <= 10) = x(find(ismember(n, n_scaled)));
        operationText = ['Time Scaling by ', num2str(a)];
        
    case 'd'  % Flip
        x_processed = -fliplr(x);
        operationText = 'Flipping';
        
    otherwise
        error('Invalid choice for DSP operation.');
end

% Plot processed signal in a separate figure
figure;
stem(n, x_processed, 'filled', 'r');
title(['Ramp Signal after ', operationText]);
xlabel('n');
ylabel('Amplitude');

% Set x and y ticks to show only even numbers
xticks(-10:2:10);
yticks(min(x_processed):2:max(x_processed));
grid on;
