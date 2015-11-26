%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% recursive_laguerre_testbench.m
% 
% Tests the recursive_laguerre function which computes the values of the
% Laguerre polynomials up to order n based on the supplied alpha
% coefficient value.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close all

% Parameters for Laguerre polynomials generation
n = 5;
alpha = 0;

% Computing the Laguerre coefficients
coefficients = recursive_laguerre(n, alpha);

% Computing the values of the Laguerre functions for the chosen datapoints
xrange = -5:0.001:20;
for row = 1:n+1
  y = polyval(coefficients(row,:),xrange);
  axis([-5,20,-10,20])
  plot(xrange, y, '-', 'LineWidth',1, 'Color', [rand rand rand]); hold on; 
end
xlabel('x'); ylabel('Laguerre polynomials');

display(coefficients);