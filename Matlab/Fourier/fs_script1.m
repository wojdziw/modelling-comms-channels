%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fs_script1.m
% Script to test one example of orthogonality in Fourier Series
% DWM 5/9/10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 1;                 % Define period
w = 2*pi/T;            % Derive omega
                       % Integral limits are -T/2 to +T/2
nint = 1000;           % We'll use a 1000 intervals
x = (-T/2:T/nint:T/2); % to give vector of x values

% Here we test cos(mwx) times sin(nwx) with m=3 and n=5
m = 3; c = cos(m*w*x); % Because x is a vector, so is c
n = 5; s = sin(n*w*x); % and so is s
cs = c .* s;           % Compute their element by element product

% Now use the Trapezium Rule to integrate.
result = trapz(x,cs)   % This is the result: hope it is small!

% Plot the c, s, and prod in red, green and blue
hold off;
set(gca, 'FontSize', 18);
plot(x, c,  '-', 'LineWidth',2, 'Color', [0.7 0 0]); hold on;
plot(x, s,  '-', 'LineWidth',2, 'Color', [0 0.7 0]); hold on;
plot(x, cs, '-', 'LineWidth',3, 'Color', [0 0 0.7]); hold on;
xlabel('x'); ylabel('c,s, c times s');
print('-depsc', 'fs_script1.eps'); % Save diagram as colour postscript

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
