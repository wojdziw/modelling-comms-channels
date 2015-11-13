%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function inner_product.m
%
% Computes the inner product of two functions given an x
% Inputs:
% coefficients1, coefficients2    Coefficients of the functions for which
% we compute the inner product
% Outputs:
% A single numerical value of the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function integral = inner_product(coefficients1, coefficients2, xrange)
  polynomial1 = polyval(coefficients1, xrange);
  polynomial2 = polyval(coefficients2, xrange);
  exponential = exp(-xrange);
  
  product = polynomial1 .* polynomial2 .* exponential;
  integral = trapz(xrange, product);
