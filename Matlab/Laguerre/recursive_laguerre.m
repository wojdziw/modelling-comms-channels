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
  for order = 2:n
    row = order + 1; % Polynomial in n'th order is in (n+1)'th row
    
    first_coef = (2*(order)+alpha-1)/(order); % Multiplier of the L_(n-1)
    second_coef = -((order)+alpha-1)/(order); % Multiplier of the L_(n-2)

    % Circshift simulates multiplying by 'x'
    coefficients(row, :) = first_coef * coefficients(row-1, :) - circshift(coefficients(row-1, :), [0,1])/(row-1);
    coefficients(row, :) = coefficients(row, :) + second_coef * coefficients(row-2, :);
  end
  
  coefficients = fliplr(coefficients); % Reflect the coefficients horizontally
end

