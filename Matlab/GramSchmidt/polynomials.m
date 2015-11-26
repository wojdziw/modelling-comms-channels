%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function polynomials.m
%
% Computes the vector of the e-coefficients of the Gram-Schmidt polynomials
% Inputs:
% n    Highest order of the calculated polynomials
% Outputs:
% A vector of vectors containing the coefficients.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = polynomials(n, xrange, alternating_ones)
  n = n+1;

  if ~exist('alternating_ones','var')
    alternating_ones = false;
  end
  
  if (alternating_ones)
    ones = basis_ones_alternating(n);
  else
    ones = basis_ones(n);
  end
  
  coefficients = zeros(n);
  g_g_product = zeros([1 n]);

  for order = 1:n
    coefficients(order, n-order+1) = ones(order,n-order+1);
    for power = 1:order-1
      v_g_product = inner_product(ones(order,:),coefficients(order-power,:),xrange);
      e_coeff = v_g_product/g_g_product(order-power);
      fprintf('e%0.0f%0.0f equals %0.3f \n',order-1, power-1, e_coeff)
      coefficients(order, :) = coefficients(order, :) + (-1)*e_coeff*coefficients(order-power, :);
    end
    g_g_product(order) = inner_product(coefficients(order,:), coefficients(order,:), xrange);
  end
  
  % Computing the normalizing constant and normalizing the polynomial
  for order = 1:n
    normalizing_constant = sqrt(g_g_product(order));
    coefficients(order, :) = coefficients(order,:)/normalizing_constant;
  end
  
  
      
