%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RecursiveLaguerre.m
% Script to calculate the Laguerre polynomial coefficients recursively
% using previous functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = 1;
n = 5;

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

coefficients = coefficients

display(coefficients);