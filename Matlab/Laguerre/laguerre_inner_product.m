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

function integral = laguerre_inner_product(y1, y2, xrange)
  product = y1 .* y2;
  integral = trapz(xrange, product);
end
