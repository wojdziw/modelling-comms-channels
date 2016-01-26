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
  
  coefficients = zeros(n+1);  % Initiate a matrix for the polynomial coefficients
  g_g_product = zeros([1 n+1]); % Initiate a matrix for the self products

  % Calculating the Gram Schmidt coefficients based on the previous orders
  for order = 0:n
    row = order+1; % Polynomial of n'th order is in (n+1)'th row
    coefficients(row, n+1-order) = ones(row,n+1-order); % Leading coefficient
    for power = 1:order % Remaining expansion coefficients
      v_g_product = gs_inner_product(ones(row,:), coefficients(row-power,:),x);
      e_coeff = v_g_product/g_g_product(row-power);
      coefficients(row, :) = coefficients(row, :) + (-1)*e_coeff*coefficients(row-power, :); % Multiply the lower order polynomial by the e_coeff and add
    end
    g_g_product(row) = gs_inner_product(coefficients(row,:), coefficients(row,:), x); % Compute the square of the normalizing constant
  end
  
%   % Plot the integrand volume for the highest order
%   y1 = polyval(coefficients(n+1-1,:),x);
%   y2 = polyval(ones(n+1,:), x);
%   exponential = exp(-x);
%   product = - y1 .* y2 .* exponential;
%   axis([0,100,-80,80])
%   plot(x, product, '-', 'LineWidth',1, 'Color', 'blue'); 
%   grid on;
%   xlabel('x'); ylabel('Volume of the integrand');
  
  % Computing the normalizing constant and normalizing the polynomial
  for order = 0:n
    row = order+1;
    normalizing_constant = sqrt(g_g_product(row));
    coefficients(row, :) = coefficients(row,:)/normalizing_constant;
  end
end
  
  
      
