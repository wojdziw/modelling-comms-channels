%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function rec_lag_polynomials.m
%
% Computes the vector of the Laguerre polynomial coefficients recursively
% Inputs:
% n    Highest order of the calculated polynomials
% alpha Alpha coefficient
% Outputs:
% A vector of vectors containing the coefficients.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coefficients = rec_lag_polynomials(n, alpha)

  coefficients = zeros(n+1);
  coefficients(1, 1) = 1;
  coefficients(2, 1) = alpha+1;
  coefficients(2, 2) = -1;

  for order = 3:n+1
    first_coef = (2*(order-1)+alpha-1)/(order-1);
    second_coef = -((order-1)+alpha-1)/(order-1);

    coefficients(order, :) = first_coef * coefficients(order-1, :) - circshift(coefficients(order-1, :), [0,1])/(order-1);
    coefficients(order, :) = coefficients(order, :) + second_coef * coefficients(order-2, :);
  end

  coefficients = fliplr(coefficients);
end

