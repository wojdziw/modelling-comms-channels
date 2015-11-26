%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RECURSIVE_LAGUERRE(n, alpha)
%
% Computes the vector of the Laguerre polynomial coefficients recursively
% up to order n.
%
% Inputs:   n               highest order of the calculated polynomials
%           alpha           alpha parameter used in Laguerre polynomials
%                           calculation
% 
% Outputs:  coefficients    coefficients of the Laguerre polynomials
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = recursive_laguerre(n, alpha)

  % Hardcoding the first few values of the Laguerre coefficients
  coefficients = zeros(n+1);
  coefficients(1, 1) = 1;
  coefficients(2, 1) = alpha+1;
  coefficients(2, 2) = -1;

  % Recursively computing the coefficients of the subsequent polynomials
  % based on lower orders
  % Due to the 1-based ordering in MATLAB, row n represents coefficients of
  % the order (n-1)
  for order = 2:n
    row = order + 1;
    
    first_coef = (2*(order)+alpha-1)/(order);
    second_coef = -((order)+alpha-1)/(order);

    coefficients(row, :) = first_coef * coefficients(row-1, :) - circshift(coefficients(row-1, :), [0,1])/(row-1);
    coefficients(row, :) = coefficients(row, :) + second_coef * coefficients(row-2, :);
  end
  
  % Due to the way we are storing the values, we need to reflect the
  % polynomial coefficients horizontally
  coefficients = fliplr(coefficients);
end

