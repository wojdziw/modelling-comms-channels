%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGUERRE_FIT(fo, x, n, alpha)
%
% Computes a basic Laguerre fit to the exponentially distributed data
% (randomly generated). 
%
% Inputs:   fo       values of the function being fitted
%           x        domain of the function being fitted
%           n        highest order of the Laguerre polynomial being used
%           alpha    alpha parameter used in the computation of Laguerre
%                     functions
% 
% Outputs:  result   the vector of values of the Laguerre fit
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = laguerre_fit(fo, x, n, alpha)
  lag_values = associated_laguerre(n, alpha, x); % Obtaining the fitting functions
  coefs = zeros(1,n+1); % Multipliers of the appropriate functions
  for order = 0:n
    row = order+1; % Function of n'th order is in (n+1)'th row
    coefs(row) = laguerre_inner_product(lag_values(row,:), fo, x); % Fitting coefficients
  end
  result = coefs * lag_values; % Multiplying the function values by appropriate coefificients and adding up
end
