%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% laguerre_optimal_fit_testbench.m
% 
% Generates the exponentially distributed data points using the exp_data
% function and computes a Laguerre fit based on the optimised "scale" and
% "alpha" parameters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

% Generating the exponentially distributed data
sigma2 = 6; mu = 100;
nsamp = 1e4 ; nbins = 100;
[fo , x] = exp_data (sigma2, mu, nsamp, nbins);

% Computing the optimized Laguerre fit to the generated data
n = 5;
laguerre = laguerre_optimal_fit(fo,x,n);

% Plotting the data
plot(x, fo, 'k.','LineWidth',1.2)
grid on

hold on;
plot(x, laguerre, '-', 'LineWidth',1, 'Color', 'blue');
xlabel('x'); ylabel('Exponentially distributed data and the optimal Laguerre fit');