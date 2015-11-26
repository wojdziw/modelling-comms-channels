%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GS_INNER_PRODUCT(coefficients1, coefficients2, x)
%
% Computes the inner product of the Gram Schmidt polynomials described by
% the supplied coefficients
%
% Inputs:   coefficients1,      coefficients of the Gram Schmidt
%           coefficients2       polynomials to be multiplied
%           x                   x range over which the numerical integral
%                               should be evaluated
% 
% Outputs:  integral            the inner product of the two functions
%                               calculated using the trapezium method for
%                               numerical integration
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function integral = gs_inner_product(coefficients1, coefficients2, x)
  
  % Evaluating the polynomial values over the prescribed range
  polynomial1 = polyval(coefficients1, x);
  polynomial2 = polyval(coefficients2, x);
  exponential = exp(-x);
  
  % Evaluating the element-wise product of the factors
  product = polynomial1 .* polynomial2 .* exponential;
  integral = trapz(x, product);
