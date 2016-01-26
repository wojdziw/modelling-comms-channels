%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RODRIGUES_LAGUERRE(n, alpha)
%
% Computes the vector of the n-th order Laguerre polynomial coefficients
% using the Rodrigues formula.
%
% Inputs:   n               highest order of the calculated polynomials
%           alpha           alpha parameter used in Laguerre polynomials
%                           calculation
% 
% Outputs:  coefficients    coefficients of the Laguerre polynomials
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = rodrigues_laguerre(n, alpha)

  % n-th derivative is in (n+1)'th index
  coefficients = zeros([1 n+1]);
  coefficients(1) = 1;

  % Calculating the coefficient due to multiplied differentiation of an exponent
  for k = 2:n+1
    coefficients(k) = coefficients(k-1) * (n + alpha - (k-2));
  end

  % Using the Leibniz rule for generalising the product rule in differentiation
  factor = factorial(n); % Avoiding repeated factorial calculation
  for k = 1:n+1
    coefficients(k) = nchoosek(n,k-1)*coefficients(k)*((-1)^(n-k+1))/factor;
  end

end