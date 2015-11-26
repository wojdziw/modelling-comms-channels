%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% laguerre_fit_testbench.m
% 
% Generates the exponentially distributed data points using the exp_data
% function and computes a Laguerre fit based on the optimised "scale" and
% "alpha" parameters.
% Subsequently compares the Laguerre fit with the parameterised exponential
% fit.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

% Generating the exponentially distributed data
sigma2 = 2; mu = 1;
nsamp = 1e4 ; nbins = 100;
[fo , x] = exp_data (sigma2, mu, nsamp, nbins);

% Computing the basic Laguerre fit to the generated data
laguerre = laguerre_fit(fo,x,5,0);

% Computing the parameterised fit to the generated data
estimated_mean = trapz (x , x .* fo );
parameterised_fit = (1/estimated_mean)*exp(-x/estimated_mean);

% Computing the error between Laguerre fit and parameterised fit
error = trapz(x, (laguerre - parameterised_fit).^2);
display(error);

% Plotting the data
plot(x, laguerre, '-', 'LineWidth',1, 'Color', 'blue');

hold on;
plot(x,fo,'k.','LineWidth',1.2)
grid on

hold on;
plot(x, parameterised_fit, '-', 'LineWidth',1, 'Color', 'red');
xlabel('x'); ylabel('Generated data points with the Laguerre and Parameterised fit');
