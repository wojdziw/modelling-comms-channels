%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Laguerre.m
% Script to calculate the Laguerre polynomial coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = 1;
n = 5;

% k-th derivative is in (k+1)'th index
x_coeff = zeros([1 n+1]);
x_coeff(1) = 1;

for k = 2:n+1
  x_coeff(k) = x_coeff(k-1) * (n + alpha - (k-2));
end

factor = factorial(n);
%factor = 1;
for k = 1:n+1
  x_coeff(k) = nchoosek(n,k-1)*x_coeff(k)*((-1)^(n-k+1))/factor;
end

display(x_coeff);
