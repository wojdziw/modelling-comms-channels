%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASSOCIATED_LAGUERRE(n, alpha)
%
% Calculates the coefficients of the associated set of Laguerre functions
% based on the recursive laguerre coefficients.
%
% Inputs:   n               highest order of the calculated polynomials
%           alpha           alpha parameter used in Laguerre polynomials
%                           calculation
%           x               x-range for which the polynomial values are
%                           calculated
% 
% Outputs:  a_laguerres     values of the associated laguerre polynomials
%                           at given x
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function a_laguerres = associated_laguerre(n, alpha, x)

% Calculating the recursive Laguerre polynomial coefficients
lr_coefficients = recursive_laguerre(n,alpha);

% Initialising the matrix storing the associated Laguerre polynomial values
a_laguerres = zeros([n+1 length(x)]);

% Calculating the associated Laguerre polynomial values
for order = 0:n
  row = order+1;
  scale = sqrt(gamma(order+1)/gamma(order+1+alpha));
  lr_coefficients(row,:) = lr_coefficients(row,:)*scale;
  a_laguerres(row,:) = polyval(lr_coefficients(row,:),x) .* exp(-x/2) .* x .^(alpha/2);
end

  
