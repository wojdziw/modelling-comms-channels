%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GS_POLYNOMIALS(n, x, alternating_ones)
%
% Computes the vector of the e-coefficients of the Gram-Schmidt polynomials
%
% Inputs:   n                   highest order of the calculated polynomials
%           x                   x-range for which the polynomial values are
%                               calculated
%           (alternating_ones)  optional - boolean value choosing the basis
%                               function - either and array of monomials 
%                               1, x, x^2, ... or 1, -x, x^2, ...     
% 
% Outputs:  coefficients        coefficients of the Gram Schmidt
%                               polynomials for the given order
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = gs_polynomials(n, x, alternating_ones)

  % If the alternating_ones input is not detected, use the regular basis
  if ~exist('alternating_ones','var')
    alternating_ones = false;
  end
  
  % Choosing the appropriate basis
  if (alternating_ones)
    ones = basis_ones_alternating(n+1);
  else
    ones = basis_ones(n+1);
  end
  
  coefficients = zeros(n+1);
  g_g_product = zeros([1 n+1]);

  % Calculating the Gram Schmidt coefficients based on the previous orders
  for order = 0:n
    row = order+1;
    coefficients(row, n+1-order) = ones(row,n+1-order);
    for power = 1:order
      v_g_product = gs_inner_product(ones(row,:), coefficients(row-power,:),x);
      e_coeff = v_g_product/g_g_product(row-power);
      coefficients(row, :) = coefficients(row, :) + (-1)*e_coeff*coefficients(row-power, :);
    end
    g_g_product(row) = gs_inner_product(coefficients(row,:), coefficients(row,:), x);
  end
  
  % Computing the normalizing constant and normalizing the polynomial
  for order = 0:n
    row = order+1;
    normalizing_constant = sqrt(g_g_product(row));
    coefficients(row, :) = coefficients(row,:)/normalizing_constant;
  end
end
  
  
      
