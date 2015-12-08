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
sigma2 = 2; mu = 0;
nsamp = 1e4 ; nbins = 100;
[fo, x] = exp_data (sigma2, mu, nsamp, nbins);

% Computing the basic Laguerre fit to the generated data
order = 5;
alpha = 0;
laguerre = laguerre_fit(fo,x, order, alpha);

% Computing the parameterised fit to the generated data
estimated_mean = trapz (x , x .* fo )
parameterised_fit = (1/estimated_mean)*exp(-x/estimated_mean);

% Computing the error between Laguerre fit and parameterised fit
error = trapz(x, (laguerre - parameterised_fit).^2);
display(error);

% Plotting the data
plot(x, laguerre, '-', 'LineWidth',1, 'Color', 'blue');

hold on;
plot(x,fo,'kx','LineWidth',1.2)
grid on
ystr = sprintf('Laguerre fit (order = %g, alpha = %g)',order, alpha);
xlabel('x'); ylabel(ystr);

% hold on;
% plot(x, parameterised_fit, '-', 'LineWidth',1, 'Color', 'red');
% xlabel('x'); ylabel('Generated data points with the Laguerre and Parameterised fit');
